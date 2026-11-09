"""API y frontend servido, sin llamadas externas al proveedor."""

from copy import deepcopy
from io import StringIO
import logging
import asyncio
import json

import httpx
import pytest
from fastapi.testclient import TestClient

from backend import main as api
from backend.knowledge import KnowledgeError


@pytest.fixture
def client(monkeypatch):
    monkeypatch.setattr(api, 'dotenv_values', lambda _: {
        'OPENAI_API_KEY': 'clave-prueba', 'OPENAI_MODEL': 'modelo-prueba',
        'OPENAI_REASONING_EFFORT': 'high'})
    class FakeOpenAI:
        def __init__(self, **kwargs):
            assert kwargs == {'api_key': 'clave-prueba', 'timeout': 60, 'max_retries': 0}
            self.closed = False
        async def close(self):
            self.closed = True
    monkeypatch.setattr(api, 'AsyncOpenAI', FakeOpenAI)
    with TestClient(api.app) as client:
        yield client
    assert api.app.state.client.closed


def post(client, pregunta='Hola', sesion=None, modo='llm'):
    return client.post('/api/chat', json={'modo': modo, 'pregunta': pregunta, 'sesion': sesion})


def test_frontend_y_prolog_real_sin_clave(client):
    index = client.get('/')
    assert index.status_code == 200
    assert 'id="modo"' in index.text
    assert client.get('/app.js').status_code == 200
    assert client.get('/styles.css').status_code == 200
    result = post(client, '¿Quién fue campeón en 2022?', modo='prolog')
    assert result.status_code == 200
    assert 'Argentina' in result.json()['respuesta']
    assert '<p>' in result.json()['respuesta_html']
    assert result.json()['sesion'] is None
    original = api.app.state.client
    try:
        api.app.state.client = None
        assert post(client, '¿Quién fue campeón en 2022?', modo='prolog').status_code == 200
        assert post(client).status_code == 503
    finally:
        api.app.state.client = original


def test_contexto_aislamiento_markdown_trazas_y_limpieza(client, monkeypatch):
    histories = []
    async def turn(client, model, history, question, *, reasoning_effort, on_tool_call, on_tool_result):
        assert model == 'modelo-prueba'
        assert reasoning_effort == 'high'
        histories.append(deepcopy(history))
        return ({'respuesta': '**Argentina**\n\n- Campeón', 'estado': 'respuesta', 'consultas': 1},
                [{'role': 'user', 'content': question}, {'role': 'assistant', 'content': 'Argentina'}],
                [{'herramienta': 'consultar_mundiales', 'argumentos': {'consulta': 'campeon(2022,E)'},
                  'resultado': {'estado': 'ok', 'resultados': [{'E': 'argentina'}]}}])
    monkeypatch.setattr(api, 'run_turn', turn)
    first = post(client, 'Campeón 2022').json()
    assert '<strong>Argentina</strong>' in first['respuesta_html']
    assert first['traza'][0]['herramienta'] == 'consultar_mundiales'
    sid = first['sesion']
    assert post(client, '¿Y en 2018?', sid).json()['sesion'] == sid
    other = post(client, 'Campeón 2014').json()
    assert other['sesion'] != sid
    assert histories[0] == histories[2] == []
    assert histories[1][0]['content'] == 'Campeón 2022'
    assert client.delete(f'/api/sesiones/{sid}').json() == {'ok': True}
    assert sid not in api.app.state.sessions
    assert post(client, 'Otra', sid).status_code == 410
    assert other['sesion'] in api.app.state.sessions


def test_memoria_conserva_diez_turnos(client, monkeypatch):
    histories = []
    async def turn(client, model, history, question, **kwargs):
        histories.append(deepcopy(history))
        return {'respuesta': question, 'estado': 'conversacion'}, [{'role': 'user', 'content': question}], []
    monkeypatch.setattr(api, 'run_turn', turn)
    sid = None
    for i in range(12):
        sid = post(client, str(i), sid).json()['sesion']
    assert len(api.app.state.sessions[sid].turns) == 10
    assert len(histories[-1]) == 10
    assert histories[-1][0]['content'] == '1'


def test_tool_calls_y_respuesta_se_imprimen_durante_el_turno(client, monkeypatch, caplog):
    output = StringIO()
    from backend import cli
    console = cli.Console(file=output, width=100, color_system=None)
    monkeypatch.setattr(cli, 'console', console)
    monkeypatch.setattr(api, 'console', console)
    caplog.set_level(logging.INFO, logger='uvicorn.error')
    async def turn(client, model, history, question, *, on_tool_call, **kwargs):
        on_tool_call({'numero': 1, 'herramienta': 'consultar_mundiales',
                      'argumentos': {'consulta': 'campeon(2022,E)'}})
        assert 'consultar_mundiales' in output.getvalue()
        assert 'campeon(2022,E)' in output.getvalue()
        assert 'Argentina' not in output.getvalue()
        return {'respuesta': '**Argentina**', 'estado': 'respuesta', 'consultas': 1}, [], []
    monkeypatch.setattr(api, 'run_turn', turn)
    assert post(client, 'Campeón 2022').status_code == 200
    assert 'Argentina' in output.getvalue()
    assert '**Argentina**' not in output.getvalue()
    assert 'pregunta=' in caplog.text
    assert 'modelo=modelo-prueba' in caplog.text
    assert 'estado=respuesta | consultas=1' in caplog.text
    assert 'clave-prueba' not in caplog.text + output.getvalue()


def test_sesion_ocupada_no_admite_chat_ni_borrado(client):
    session = api.Session()
    api.app.state.sessions['ocupada'] = session
    client.portal.call(session.lock.acquire)
    try:
        assert post(client, sesion='ocupada').status_code == 409
        assert client.delete('/api/sesiones/ocupada').status_code == 409
    finally:
        client.portal.call(session.lock.release)


@pytest.mark.parametrize('payload', [
    {'modo': 'otro', 'pregunta': 'Hola'}, {'modo': 'llm', 'pregunta': '   '},
    {'modo': 'llm', 'pregunta': 'x'*501}, {'modo': 'llm'},
])
def test_validacion_de_entrada(client, payload):
    assert client.post('/api/chat', json=payload).status_code == 422


@pytest.mark.parametrize('error,status', [
    (TimeoutError(), 504), (KnowledgeError('interno'), 502),
    (api.APITimeoutError(request=httpx.Request('POST', 'https://api.openai.com/v1/responses')), 504),
    (api.APIConnectionError(request=httpx.Request('POST', 'https://api.openai.com/v1/responses')), 502),
    (api.APIStatusError('secreto-no-exponer', response=httpx.Response(429,
        request=httpx.Request('POST', 'https://api.openai.com/v1/responses')), body={}), 429),
    (api.APIStatusError('secreto-no-exponer', response=httpx.Response(401,
        request=httpx.Request('POST', 'https://api.openai.com/v1/responses')), body={}), 502),
])
def test_errores_sin_guardar_turnos_parciales(client, monkeypatch, error, status):
    session = api.Session()
    session.turns.append([{'role': 'user', 'content': 'Anterior'}])
    api.app.state.sessions['anterior'] = session
    original = deepcopy(session.turns)
    async def turn(*args, **kwargs):
        raise error
    monkeypatch.setattr(api, 'run_turn', turn)
    for sid in (None, 'anterior'):
        response = post(client, sesion=sid)
        assert response.status_code == status
        assert 'secreto-no-exponer' not in response.text
    assert list(api.app.state.sessions) == ['anterior']
    assert session.turns == original
    assert not session.lock.locked()


def test_markdown_no_admite_html_ni_enlaces_ejecutables():
    rendered = api.respuesta_web({'respuesta': '<script>alert(1)</script>\n\n[x](javascript:alert(1))\n\n| A | B |\n|---|---|\n| 1 | 2 |'})['respuesta_html']
    assert '<script>' not in rendered
    assert 'href="javascript:' not in rendered
    assert '<table>' in rendered


def test_stream_envia_inicio_y_resultado_antes_de_la_respuesta(client, monkeypatch):
    async def escenario():
        ejecutar = asyncio.Event()
        terminar = asyncio.Event()
        llamada = {'numero': 1, 'herramienta': 'consultar_mundiales',
                   'argumentos': {'consulta': 'campeon(2022,E)', 'descripcion': 'Buscar campeón de 2022'}}
        async def turn(*args, on_tool_call, on_tool_result, **kwargs):
            on_tool_call(llamada)
            await ejecutar.wait()
            on_tool_result({**llamada, 'resultado': {'estado': 'ok', 'resultados': [{'E': 'argentina'}]},
                            'duracion_ms': 12})
            await terminar.wait()
            return {'respuesta': 'Argentina', 'estado': 'respuesta'}, [], []
        monkeypatch.setattr(api, 'run_turn', turn)
        response = await api.chat_stream(api.ChatRequest(modo='llm', pregunta='Campeón 2022'))
        stream = response.body_iterator
        async def siguiente():
            return json.loads(await asyncio.wait_for(anext(stream), 1))
        try:
            inicio = await siguiente()
            assert inicio['tipo'] == 'tool_inicio'
            assert inicio['datos']['argumentos']['descripcion'] == 'Buscar campeón de 2022'
            ejecutar.set()
            fin = await siguiente()
            assert fin['tipo'] == 'tool_fin'
            assert fin['datos']['duracion_ms'] == 12
            terminar.set()
            respuesta = await siguiente()
            assert respuesta['tipo'] == 'respuesta'
            assert respuesta['datos']['sesion'] in api.app.state.sessions
            with pytest.raises(StopAsyncIteration):
                await anext(stream)
        finally:
            await stream.aclose()
    asyncio.run(escenario())


def test_desconexion_cancela_turno_y_libera_sesion(client, monkeypatch):
    async def escenario():
        cancelado = asyncio.Event()
        session = api.Session()
        api.app.state.sessions['existente'] = session
        async def turn(*args, on_tool_call, **kwargs):
            on_tool_call({'numero': 1, 'herramienta': 'consultar_mundiales', 'argumentos': {}})
            try:
                await asyncio.Event().wait()
            finally:
                cancelado.set()
        monkeypatch.setattr(api, 'run_turn', turn)
        response = await api.chat_stream(api.ChatRequest(modo='llm', pregunta='Hola', sesion='existente'))
        stream = response.body_iterator
        await asyncio.wait_for(anext(stream), 1)
        assert session.lock.locked()
        await stream.aclose()
        assert cancelado.is_set()
        assert not session.lock.locked()
        assert not session.turns
    asyncio.run(escenario())


def test_stream_http_prolog_y_errores(client, monkeypatch):
    result = client.post('/api/chat/stream', json={'modo': 'prolog', 'pregunta': '¿Quién fue campeón en 2022?'})
    assert result.headers['content-type'].startswith('application/x-ndjson')
    events = [json.loads(line) for line in result.text.splitlines()]
    assert len(events) == 1
    assert events[0]['tipo'] == 'respuesta'
    assert 'Argentina' in events[0]['datos']['respuesta']
    async def turn(*args, **kwargs):
        raise KnowledgeError('detalle interno')
    monkeypatch.setattr(api, 'run_turn', turn)
    result = client.post('/api/chat/stream', json={'modo': 'llm', 'pregunta': 'Hola'})
    event = json.loads(result.text)
    assert event['tipo'] == 'error'
    assert event['datos']['status'] == 502
    assert 'detalle interno' not in result.text
    assert not api.app.state.sessions
    result = client.post('/api/chat/stream', json={'modo': 'llm', 'pregunta': 'Hola', 'sesion': 'no-existe'})
    assert json.loads(result.text)['datos']['status'] == 410


@pytest.mark.parametrize('streaming', [False, True])
def test_timeout_guarda_sesion_y_continuacion_reutiliza_las_consultas(client, streaming):
    from pruebas.test_agent import client_for, response, call, final
    timeout = api.APITimeoutError(request=httpx.Request('POST', 'https://example.test/responses'))
    _, models = client_for(response(call(id='consulta-guardada')), timeout, final())
    api.app.state.client.responses = models
    if streaming:
        response = client.post('/api/chat/stream', json={'modo': 'llm', 'pregunta': 'Campeón 2022'})
        events = [json.loads(line) for line in response.text.splitlines()]
        assert [e['tipo'] for e in events] == ['tool_inicio', 'tool_fin', 'respuesta']
        interrupted = events[-1]['datos']
    else:
        response = post(client, 'Campeón 2022')
        interrupted = response.json()
    assert response.status_code == 200
    assert interrupted['estado'] == 'timeout'
    assert interrupted['traza'][0]['resultado']['resultados'] == [{'Equipo': 'argentina'}]
    sid = interrupted['sesion']
    session = api.app.state.sessions[sid]
    assert len(session.turns) == 1
    assert not session.lock.locked()
    previous = deepcopy(session.turns[0])
    continued = post(client, 'continúa', sid).json()
    assert continued['estado'] == 'respuesta'
    assert continued['sesion'] == sid
    assert continued['consultas'] == 0
    assert len(session.turns) == 2
    assert models.requests[-1]['input'][:-1] == previous
    assert any(item.get('call_id') == 'consulta-guardada' and item.get('type') == 'function_call_output'
               for item in models.requests[-1]['input'])
