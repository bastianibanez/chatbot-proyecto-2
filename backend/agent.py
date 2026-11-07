"""Loop de OpenAI Responses con contexto explícito y presupuesto acotado."""

import asyncio
import json
from copy import deepcopy
from pathlib import Path

from pydantic import ValidationError

from .contracts import Query, RespuestaFinal
from .knowledge import esquema, prolog

DEFAULT_MODEL = "gpt-6.1-sol"
REASONING_EFFORT = "medium"
MAX_TOOLS = 30
TURN_TIMEOUT = 90
PROMPT = Path(__file__).with_name("prompt.txt").read_text(encoding="utf-8")


def crear_herramienta() -> dict:
    """Publicar el contrato y el esquema de Prolog."""
    return {
        "type": "function",
        "name": "consultar_mundiales",
        "description": ("Ejecuta directamente un objetivo SWI-Prolog mediante Janus. "
                        "Esquema de la base: " + esquema()
                        + ". Devuelve resultados con las variables nombradas (las que empiezan "
                        "por _ se omiten), estado y truncado. Listas y números conservan su tipo; "
                        "términos compuestos se representan con functor y argumentos. "
                        "Sin soluciones: sin_datos. Errores de consulta: consulta_invalida. "
                        "Cada consulta tiene 3 segundos y devuelve hasta limite soluciones. "
                        "No hay sandbox ni lista de operaciones permitidas."),
        "parameters": Query.model_json_schema(),
        # Mantener limite opcional y validar los argumentos localmente con Pydantic.
        "strict": False,
    }


async def run_turn(client, model, previous, question, execute=prolog, *, timeout=TURN_TIMEOUT,
                   on_tool_call=None, reasoning_effort=REASONING_EFFORT):
    """Devolver (resultado, turno_completo, traza), sin modificar previous.

    client es un AsyncOpenAI. previous contiene los items completos de Responses,
    incluidos razonamiento cifrado, llamadas y resultados. El llamador conserva
    turnos completos; los fallos técnicos se propagan y no son sin_datos.
    on_tool_call recibe nombre y argumentos antes de validar y ejecutar cada llamada.
    """
    if not isinstance(question, str) or not question.strip():
        raise ValueError("La pregunta debe ser un texto no vacío")
    async with asyncio.timeout(timeout):
        return await _run_turn(client, model, previous, question, execute, on_tool_call, reasoning_effort)


async def _run_turn(client, model, previous, question, execute, on_tool_call, reasoning_effort):
    contents = deepcopy(previous)
    start = len(contents)
    contents.append({"role": "user", "content": question})
    herramienta = crear_herramienta()
    trace = []
    used = 0

    def finish(text, status, original=None):
        if original is not None:
            contents.extend(original)
        else:
            contents.append({"role": "assistant", "content": text})
        return ({"respuesta": text, "estado": status, "consultas": used},
                contents[start:], trace)

    for _ in range(MAX_TOOLS + 1):
        response = await client.responses.create(
            model=model,
            instructions=PROMPT.replace("{max_tools}", str(MAX_TOOLS)),
            reasoning={"effort": reasoning_effort},
            input=contents,
            tools=[herramienta],
            tool_choice="auto" if used < MAX_TOOLS else "none",
            text={"format": {"type": "json_schema", "name": "respuesta_final",
                             "schema": RespuestaFinal.model_json_schema(), "strict": True}},
            store=False,
            include=["reasoning.encrypted_content"],
        )
        if response.status != "completed" or not response.output:
            return finish("No pude obtener una respuesta completa. Intenta reformular la pregunta.", "error")
        # Reenviar todos los items, no solo el texto: el razonamiento acompaña a las tools.
        output = [item.model_dump(mode="json", exclude_none=True) for item in response.output]
        calls = [item for item in response.output if item.type == "function_call"]
        if not calls:
            try:
                final = RespuestaFinal.model_validate_json(response.output_text)
            except ValidationError:
                return finish("No pude interpretar la respuesta. Intenta reformular la pregunta.", "error")
            if final.tipo == "respuesta" and not any(
                entry["resultado"].get("estado") in {"ok", "sin_datos"} for entry in trace
            ):
                return finish("No pude respaldar esa respuesta con los datos de Prolog. "
                              "Intenta reformular la pregunta.", "error")
            return finish(final.texto, final.tipo, original=output)

        if len(calls) > MAX_TOOLS - used:
            return finish("Alcancé el límite de consultas. Divide la pregunta en partes.", "limite")
        contents.extend(output)
        for call in calls:
            used += 1
            try:
                arguments = json.loads(call.arguments)
            except ValueError:
                arguments = call.arguments
            if on_tool_call is not None:
                on_tool_call({"numero": used, "herramienta": call.name,
                              "argumentos": deepcopy(arguments)})
            try:
                if call.name != "consultar_mundiales":
                    raise ValueError("Herramienta desconocida")
                query = Query.model_validate_json(call.arguments)
            except ValidationError as exc:
                result = {"estado": "consulta_invalida", "detalle": exc.errors(
                    include_url=False, include_input=False, include_context=False)}
            except ValueError as exc:
                result = {"estado": "consulta_invalida", "detalle": str(exc)}
            else:
                result = await execute({"modo": "consulta", "argumentos": query.model_dump()})
            trace.append({"herramienta": call.name, "argumentos": arguments, "resultado": result})
            contents.append({"type": "function_call_output", "call_id": call.call_id,
                             "output": json.dumps(result, ensure_ascii=False)})
    return finish("Alcancé el límite de consultas.", "limite")
