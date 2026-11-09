"""Loop con respuestas simuladas de OpenAI, sin consumir la API."""

import asyncio
import json
from copy import deepcopy
from types import SimpleNamespace

import pytest
import httpx
from openai import APITimeoutError, APIStatusError
from openai.types.responses import (ResponseFunctionToolCall, ResponseReasoningItem,
                                    ResponseOutputMessage, ResponseOutputText)

from backend.agent import MAX_TOOLS, crear_herramienta, run_turn
from backend.knowledge import KnowledgeError


def response(*items, status="completed"):
    return SimpleNamespace(output=list(items), status=status,
        output_text="".join(c.text for item in items if item.type == "message"
                            for c in item.content if c.type == "output_text"))


def message(text):
    return ResponseOutputMessage(id="msg_1", type="message", role="assistant", status="completed",
        content=[ResponseOutputText(type="output_text", text=text, annotations=[])])


def final(tipo="respuesta", texto="Argentina fue campeón en 2022."):
    return response(message(json.dumps({"tipo": tipo, "texto": texto})))


def call(args=None, *, name="consultar_mundiales", id="consulta-1"):
    return ResponseFunctionToolCall(type="function_call", name=name, call_id=id, id="fc_"+id,
        arguments=json.dumps(args if args is not None else {"consulta": "campeon(2022, Equipo)"}),
        status="completed")


class FakeModels:
    def __init__(self, responses):
        self.responses = iter(responses)
        self.requests = []

    async def create(self, **kwargs):
        self.requests.append(deepcopy(kwargs))
        item = next(self.responses)
        if isinstance(item, Exception):
            raise item
        return item


def client_for(*responses):
    models = FakeModels(responses)
    return SimpleNamespace(responses=models), models


async def success(payload):
    return {"estado": "ok", "evidencia": "Argentina fue campeón en 2022."}


def test_tool_schema_describes_prolog_and_limits():
    declaration = crear_herramienta()
    assert "enum" not in declaration["parameters"]["properties"]["consulta"]
    assert "gol(IdPartido" in declaration["description"]
    assert "aggregate_all/3" in declaration["description"]
    assert declaration["parameters"]["required"] == ["consulta"]
    assert "prolog" not in declaration["parameters"]["properties"]
    assert "campeon" in declaration["description"]


def test_success_preserves_protocol_ids_and_reasoning():
    reasoning = ResponseReasoningItem(id="rs_1", type="reasoning", summary=[], encrypted_content="encrypted")
    answer = final()
    client, models = client_for(response(reasoning, call()), answer)
    result, turn, trace = asyncio.run(run_turn(client, "gpt-6.1-sol", [], "Campeón 2022", execute=success))
    assert result == {"respuesta": "Argentina fue campeón en 2022.", "estado": "respuesta", "consultas": 1}
    assert trace[0]["argumentos"]["consulta"] == "campeon(2022, Equipo)"
    contents = models.requests[1]["input"]
    assert contents[1]["encrypted_content"] == "encrypted"
    assert contents[2]["call_id"] == "consulta-1"
    assert contents[3]["type"] == "function_call_output"
    assert contents[3]["call_id"] == "consulta-1"
    assert json.loads(contents[3]["output"])["estado"] == "ok"
    assert turn[-1] == answer.output[0].model_dump(mode="json", exclude_none=True)
    for req in models.requests:
        assert req["model"] == "gpt-6.1-sol"
        assert req["reasoning"] == {"effort": "medium"}
        assert req["store"] is False
        assert req["include"] == ["reasoning.encrypted_content"]
        assert req["text"]["format"]["strict"] is True


def test_invalid_arguments_can_be_corrected():
    client, _ = client_for(response(call({"consulta": 2022})),
                           response(call()), final())
    executions = []
    events = []
    async def execute(payload):
        assert len(events) == 2  # Notificar también la inválida, antes de ejecutar la válida.
        executions.append(payload)
        return await success(payload)
    result, _, trace = asyncio.run(run_turn(client, "fake", [], "Pregunta", execute=execute,
                                          on_tool_call=events.append))
    assert result["consultas"] == 2
    assert len(executions) == 1
    assert trace[0]["resultado"]["estado"] == "consulta_invalida"
    assert trace[1]["resultado"]["estado"] == "ok"
    assert [event["numero"] for event in events] == [1, 2]
    assert events[0]["argumentos"] == {"consulta": 2022}
    assert events[1]["herramienta"] == "consultar_mundiales"


def test_reasoning_effort_se_envia_al_proveedor():
    client, models = client_for(final("conversacion", "Hola"))
    asyncio.run(run_turn(client, "fake", [], "Hola", reasoning_effort="high"))
    assert models.requests[0]["reasoning"] == {"effort": "high"}


def test_malformed_json_arguments_can_be_corrected():
    broken = call()
    broken.arguments = '{"consulta":'
    client, models = client_for(response(broken), response(call()), final())
    result, _, trace = asyncio.run(run_turn(client, "fake", [], "Pregunta", execute=success))
    assert result["estado"] == "respuesta"
    assert trace[0]["resultado"]["estado"] == "consulta_invalida"
    assert models.requests[1]["input"][-1]["call_id"] == broken.call_id


def test_incomplete_tool_call_is_not_executed():
    client, _ = client_for(response(call(), status="incomplete"))
    async def forbidden(payload):
        pytest.fail("No ejecutar una respuesta incompleta")
    result, turn, trace = asyncio.run(run_turn(client, "fake", [], "Pregunta", execute=forbidden))
    assert result["estado"] == "error"
    assert result["consultas"] == 0
    assert not trace
    assert all(item.get("type") != "function_call" for item in turn)


@pytest.mark.parametrize("bad", [
    call(name="ejecutar_codigo"), call({"consulta": ""}),
    call({"consulta": "campeon", "codigo": "halt"}),
])
def test_invalid_tool_is_not_executed(bad):
    client, _ = client_for(response(bad), final("error", "No pude resolverlo."))
    async def forbidden(payload):
        pytest.fail("No debe ejecutarse una consulta inválida")
    result, _, trace = asyncio.run(run_turn(client, "fake", [], "Pregunta", execute=forbidden))
    assert result["estado"] == "error"
    assert result["consultas"] == 1
    assert trace[0]["resultado"]["estado"] == "consulta_invalida"


@pytest.mark.parametrize("tipo", ["conversacion", "aclaracion", "fuera_alcance", "error"])
def test_nonfactual_final_needs_no_tool(tipo):
    client, _ = client_for(final(tipo, "Texto controlado."))
    result, _, trace = asyncio.run(run_turn(client, "fake", [], "Pregunta"))
    assert result["estado"] == tipo
    assert result["consultas"] == 0
    assert trace == []


def test_factual_answer_without_tool_is_blocked():
    client, _ = client_for(final())
    result, _, _ = asyncio.run(run_turn(client, "fake", [], "Pregunta"))
    assert result["estado"] == "error"
    assert "Argentina" not in result["respuesta"]


@pytest.mark.parametrize("tool_result,status", [
    ({"estado": "consulta_invalida", "detalle": "Predicado desconocido"}, "error"),
    ({"estado": "limite", "detalle": "Tiempo excedido"}, "error"),
])
def test_no_evidence_does_not_allow_factual_answer(tool_result, status):
    client, _ = client_for(response(call()), final())
    async def execute(payload):
        return tool_result
    result, _, _ = asyncio.run(run_turn(client, "fake", [], "Pregunta", execute=execute))
    assert result["estado"] == status
    assert "Argentina" not in result["respuesta"]


@pytest.mark.parametrize("answer", [
    response(message("No es JSON")),
    response(message('{"tipo":"inventado","texto":"Respuesta"}')),
    response(), response(message("parcial"), status="incomplete"),
    response(status="failed"),
])
def test_invalid_or_missing_final_returns_error(answer):
    client, _ = client_for(answer)
    result, _, _ = asyncio.run(run_turn(client, "fake", [], "Pregunta"))
    assert result["estado"] == "error"


@pytest.mark.parametrize("batch,executed", [(1, MAX_TOOLS), (4, 28), (MAX_TOOLS + 1, 0)])
def test_budget_cannot_be_exceeded(batch, executed):
    client, models = client_for(*[response(*[call(id=str(i)) for i in range(batch)]) for _ in range(MAX_TOOLS + 1)])
    calls = []
    async def execute(payload):
        calls.append(payload)
        return await success(payload)
    result, _, _ = asyncio.run(run_turn(client, "fake", [], "Pregunta", execute=execute))
    assert len(calls) == executed
    assert result["consultas"] == executed
    assert result["estado"] == "limite"
    assert len(models.requests) <= MAX_TOOLS + 1
    if batch == 1:
        assert models.requests[-1]["tool_choice"] == "none"


def test_invalid_calls_count_toward_budget():
    client, models = client_for(*[response(call(name="desconocida")) for _ in range(MAX_TOOLS + 1)])
    result, _, trace = asyncio.run(run_turn(client, "fake", [], "Pregunta"))
    assert result["consultas"] == MAX_TOOLS
    assert len(trace) == MAX_TOOLS
    assert result["estado"] == "limite"


def test_last_tool_can_be_followed_by_final_answer():
    client, models = client_for(response(*[call(id=str(i)) for i in range(MAX_TOOLS)]), final())
    result, _, _ = asyncio.run(run_turn(client, "fake", [], "Pregunta", execute=success))
    assert result["estado"] == "respuesta"
    assert result["consultas"] == MAX_TOOLS
    assert models.requests[-1]["tool_choice"] == "none"


def test_context_is_preserved_and_evidence_can_be_reused():
    first, _ = client_for(response(call()), final())
    _, previous, _ = asyncio.run(run_turn(first, "fake", [], "Campeón 2022", execute=success))
    snapshot = deepcopy(previous)
    second, models = client_for(final())
    result, turn, _ = asyncio.run(run_turn(second, "fake", previous, "Resume lo anterior"))
    assert result["estado"] == "respuesta"
    assert result["consultas"] == 0
    assert models.requests[0]["input"][:-1] == snapshot
    assert previous == snapshot
    assert len(turn) == 2


def test_technical_tool_error_propagates_and_history_is_not_mutated():
    previous = [{"role": "user", "content": "Anterior"}]
    snapshot = deepcopy(previous)
    client, _ = client_for(response(call()))
    async def execute(payload):
        raise KnowledgeError("fallo técnico")
    with pytest.raises(KnowledgeError):
        asyncio.run(run_turn(client, "fake", previous, "Pregunta", execute=execute))
    assert previous == snapshot


def test_provider_error_is_not_sin_datos():
    class BrokenModels:
        async def create(self, **kwargs):
            raise RuntimeError("API no disponible")
    client = SimpleNamespace(responses=BrokenModels())
    with pytest.raises(RuntimeError, match="API no disponible"):
        asyncio.run(run_turn(client, "fake", [], "Pregunta"))


def test_turn_timeout():
    class SlowModels:
        async def create(self, **kwargs):
            await asyncio.Event().wait()
    client = SimpleNamespace(responses=SlowModels())
    result, turn, trace = asyncio.run(run_turn(client, "fake", [], "Pregunta", timeout=0.01))
    assert result["estado"] == "timeout"
    assert turn[0] == {"role": "user", "content": "Pregunta"}
    assert "continúa" in turn[-1]["content"]
    assert trace == []


def test_loop_with_real_prolog():
    client, models = client_for(response(call()), final())
    result, _, trace = asyncio.run(run_turn(client, "fake", [], "¿Quién fue campeón en 2022?"))
    assert result["estado"] == "respuesta"
    assert trace[0]["resultado"] == {
        "estado": "ok", "resultados": [{"Equipo": "argentina"}], "truncado": False
    }
    assert json.loads(models.requests[1]["input"][-1]["output"]) == trace[0]["resultado"]


def test_prolog_error_can_be_corrected_by_model():
    client, _ = client_for(response(call({"consulta": "no_existe(X)"})),
                           response(call()), final())
    result, _, trace = asyncio.run(run_turn(client, "fake", [], "Campeón 2022"))
    assert result["estado"] == "respuesta"
    assert result["consultas"] == 2
    assert trace[0]["resultado"]["estado"] == "consulta_invalida"
    assert trace[1]["resultado"]["resultados"] == [{"Equipo": "argentina"}]


def test_empty_result_can_be_explained_without_canned_reply():
    client, _ = client_for(response(call({"consulta": "campeon(1942, Equipo)"})),
                           final(texto="La base no registra un campeón para 1942."))
    result, _, trace = asyncio.run(run_turn(client, "fake", [], "Campeón 1942"))
    assert trace[0]["resultado"]["estado"] == "sin_datos"
    assert result["respuesta"] == "La base no registra un campeón para 1942."


def test_saludo_se_conserva_sin_autorizar_hechos_sin_evidencia():
    client, _ = client_for(final("conversacion", "¡Hola! Soy MundialBot."))
    saludo, previous, trace = asyncio.run(run_turn(client, "fake", [], "hola"))
    assert saludo["respuesta"] == "¡Hola! Soy MundialBot."
    assert saludo["consultas"] == 0
    assert trace == []
    client, _ = client_for(final("respuesta", "Argentina ganó en 2022."))
    result, _, _ = asyncio.run(run_turn(client, "fake", previous, "¿Quién ganó en 2022?"))
    assert result["estado"] == "error"


def test_descripcion_y_eventos_rodean_la_ejecucion():
    argumentos = {'consulta': 'campeon(2022, Equipo)', 'descripcion': 'Buscar campeón de 2022'}
    client, models = client_for(response(call(argumentos)), final())
    eventos = []
    async def execute(payload):
        assert eventos[0][0] == 'inicio'
        assert len(eventos) == 1
        assert payload['argumentos']['descripcion'] == argumentos['descripcion']
        return {'estado': 'ok', 'resultados': [{'Equipo': 'argentina'}]}
    def terminar(evento):
        assert len(models.requests) == 1  # El modelo aún no recibió el resultado.
        eventos.append(('fin', evento))
        evento['resultado']['estado'] = 'modificado'  # El callback recibe una copia.
    _, _, trace = asyncio.run(run_turn(client, 'fake', [], 'Campeón 2022', execute=execute,
        on_tool_call=lambda event: eventos.append(('inicio', event)), on_tool_result=terminar))
    assert [tipo for tipo, _ in eventos] == ['inicio', 'fin']
    assert eventos[0][1]['argumentos']['descripcion'] == argumentos['descripcion']
    assert trace[0]['resultado']['estado'] == 'ok'
    assert trace[0]['duracion_ms'] >= 0


@pytest.mark.parametrize('descripcion', ['', '   ', 'x' * 101, 42])
def test_descripcion_invalida_se_devuelve_al_agente(descripcion):
    client, _ = client_for(response(call({'consulta': 'true', 'descripcion': descripcion})),
                           response(call()), final())
    _, _, trace = asyncio.run(run_turn(client, 'fake', [], 'Pregunta', execute=success))
    assert trace[0]['resultado']['estado'] == 'consulta_invalida'
    assert trace[1]['resultado']['estado'] == 'ok'


def test_fallo_tecnico_notifica_fin_de_tool_y_se_propaga():
    client, _ = client_for(response(call()))
    events = []
    async def execute(payload):
        raise KnowledgeError('detalle interno')
    with pytest.raises(KnowledgeError):
        asyncio.run(run_turn(client, 'fake', [], 'Pregunta', execute=execute,
                             on_tool_result=events.append))
    assert len(events) == 1
    assert events[0]['resultado']['estado'] == 'error'
    assert 'detalle interno' not in str(events)
    assert events[0]['duracion_ms'] >= 0


def test_timeout_de_turno_notifica_tool_interrumpida():
    client, _ = client_for(response(call()))
    events = []
    async def execute(payload):
        await asyncio.Event().wait()
    result, turn, trace = asyncio.run(run_turn(client, 'fake', [], 'Pregunta', execute=execute, timeout=0.02,
                                              on_tool_result=events.append))
    assert result['estado'] == 'timeout'
    assert trace[0]['resultado']['estado'] == 'interrumpida'
    assert json.loads(turn[-2]['output'])['estado'] == 'interrumpida'
    assert len(events) == 1
    assert events[0]['resultado']['estado'] == 'interrumpida'


def test_agente_consulta_dataset_completo_mediante_la_misma_tool():
    consulta = 'registro(tournaments, _{tournament_id:"WC-2019",winner:Campeona})'
    client, _ = client_for(response(call({'consulta': consulta,
        'descripcion': 'Buscar campeona del Mundial femenino'})),
        final(texto='Estados Unidos ganó el Mundial femenino de 2019.'))
    result, _, trace = asyncio.run(run_turn(client, 'fake', [], '¿Quién ganó el femenino de 2019?'))
    assert result['estado'] == 'respuesta'
    assert trace[0]['resultado']['resultados'] == [{'Campeona': 'United States'}]


@pytest.mark.parametrize('error', [
    APITimeoutError(request=httpx.Request('POST', 'https://example.test/responses')),
    APIStatusError('detalle privado', response=httpx.Response(408,
        request=httpx.Request('POST', 'https://example.test/responses')), body={}),
    APIStatusError('detalle privado', response=httpx.Response(504,
        request=httpx.Request('POST', 'https://example.test/responses')), body={}),
])
def test_timeout_proveedor_conserva_consultas_y_continua_sin_repetir(error):
    reasoning = ResponseReasoningItem(id='rs_timeout', type='reasoning', summary=[], encrypted_content='encrypted')
    client, models = client_for(response(reasoning, call()), error, final())
    result, turn, trace = asyncio.run(run_turn(client, 'fake', [], 'Campeón 2022', execute=success))
    assert result['estado'] == 'timeout'
    assert trace[0]['resultado']['estado'] == 'ok'
    assert turn[1]['encrypted_content'] == 'encrypted'
    assert 'detalle privado' not in result['respuesta']
    previous = deepcopy(turn)
    continued, _, new_trace = asyncio.run(run_turn(client, 'fake', previous, 'continúa', execute=success))
    assert continued['estado'] == 'respuesta'
    assert continued['consultas'] == 0
    assert not new_trace
    assert models.requests[-1]['input'][:-1] == turn
    assert previous == turn


def test_timeout_global_durante_respuesta_preserva_resultados_completados():
    class Models:
        def __init__(self):
            self.requests = 0
        async def create(self, **kwargs):
            self.requests += 1
            if self.requests == 1:
                return response(call())
            await asyncio.Event().wait()
    client = SimpleNamespace(responses=Models())
    result, turn, trace = asyncio.run(run_turn(client, 'fake', [], 'Pregunta', execute=success, timeout=0.02))
    assert result['estado'] == 'timeout'
    assert trace[0]['resultado']['estado'] == 'ok'
    assert json.loads(turn[-2]['output'])['estado'] == 'ok'


def test_timeout_en_lote_cierra_todas_las_llamadas_sin_inventar_resultados():
    client, _ = client_for(response(call(id='lista'), call(id='activa'), call(id='pendiente')))
    executions = []
    async def execute(payload):
        executions.append(payload)
        if len(executions) == 1:
            return await success(payload)
        await asyncio.Event().wait()
    result, turn, trace = asyncio.run(run_turn(client, 'fake', [], 'Pregunta', execute=execute, timeout=0.02))
    assert result['estado'] == 'timeout'
    assert result['consultas'] == 2
    results = {item['call_id']: json.loads(item['output']) for item in turn
               if item.get('type') == 'function_call_output'}
    assert set(results) == {'lista', 'activa', 'pendiente'}
    assert results['lista']['estado'] == 'ok'
    assert results['activa']['estado'] == 'interrumpida'
    assert results['pendiente']['estado'] == 'no_ejecutada'
    assert len(trace) == 2
    followup, models = client_for(final())
    continued, _, _ = asyncio.run(run_turn(followup, 'fake', turn, 'continúa', execute=success))
    assert continued['estado'] == 'respuesta'
    assert models.requests[0]['input'][:-1] == turn


def test_cancelacion_externa_no_se_confunde_con_timeout():
    async def scenario():
        started = asyncio.Event()
        class Models:
            async def create(self, **kwargs):
                started.set()
                await asyncio.Event().wait()
        client = SimpleNamespace(responses=Models())
        task = asyncio.create_task(run_turn(client, 'fake', [], 'Pregunta'))
        await started.wait()
        task.cancel()
        with pytest.raises(asyncio.CancelledError):
            await task
    asyncio.run(scenario())


def test_timeout_de_prolog_se_informa_al_modelo_para_corregir_en_el_mismo_turno():
    client, models = client_for(response(call(id='lenta')), response(call(id='corregida')), final())
    executions = []
    async def execute(payload):
        executions.append(payload)
        if len(executions) == 1:
            return {'estado': 'limite', 'detalle': 'La consulta superó 30 segundos. Simplifícala.'}
        return await success(payload)
    result, _, trace = asyncio.run(run_turn(client, 'fake', [], 'Pregunta', execute=execute))
    assert result['estado'] == 'respuesta'
    assert [item['resultado']['estado'] for item in trace] == ['limite', 'ok']
    timeout = json.loads(models.requests[1]['input'][-1]['output'])
    assert timeout['estado'] == 'limite'
    assert '30 segundos' in timeout['detalle']
