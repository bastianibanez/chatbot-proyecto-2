"""Loop de OpenAI Responses con contexto explícito y presupuesto acotado."""

import asyncio
import json
from copy import deepcopy
from pathlib import Path
from time import perf_counter

from openai import APITimeoutError, APIStatusError
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
                        "Cada consulta tiene 30 segundos, incluida su conversión a JSON, y devuelve "
                        "hasta limite soluciones y 60000 caracteres. Resultados excesivos: limite; "
                        "corrige devolviendo solo variables finales y usando _ en las intermedias. "
                        "No hay sandbox ni lista de operaciones permitidas."),
        "parameters": Query.model_json_schema(),
        # Mantener limite opcional y validar los argumentos localmente con Pydantic.
        "strict": False,
    }


class _Turn:
    """Estado del turno, conservado también si expira una espera."""

    def __init__(self, previous, question):
        self.contents = deepcopy(previous)
        self.start = len(self.contents)
        self.contents.append({"role": "user", "content": question})
        self.trace = []
        self.used = 0

    def finish(self, text, status, original=None):
        self.contents.extend(original if original is not None else [
            {"role": "assistant", "content": text}])
        return ({"respuesta": text, "estado": status, "consultas": self.used},
                self.contents[self.start:], self.trace)

    def timeout(self):
        # Responses exige un resultado por cada call_id, incluso si un lote quedó
        # interrumpido antes de ejecutar todas sus llamadas.
        current = self.contents[self.start:]
        answered = {item["call_id"] for item in current if item.get("type") == "function_call_output"}
        for item in current:
            if item.get("type") == "function_call" and item["call_id"] not in answered:
                self.contents.append({"type": "function_call_output", "call_id": item["call_id"],
                    "output": json.dumps({"estado": "no_ejecutada", "detalle":
                        "El turno agotó su tiempo antes de ejecutar esta llamada. No hay resultado."})})
        return self.finish(
            "Se agotó el tiempo de este turno. Conservé la pregunta, las consultas y sus "
            "resultados disponibles. Escribe **continúa** para retomar desde ahí.", "timeout")


def _hay_evidencia(contents):
    for item in contents:
        if item.get("type") == "function_call_output":
            try:
                result = json.loads(item["output"])
            except (ValueError, TypeError):
                continue
            if isinstance(result, dict) and result.get("estado") in {"ok", "sin_datos"}:
                return True
    return False


async def run_turn(client, model, previous, question, execute=prolog, *, timeout=TURN_TIMEOUT,
                   on_tool_call=None, on_tool_result=None, reasoning_effort=REASONING_EFFORT):
    """Devolver (resultado, turno_completo, traza), sin modificar previous.

    Un timeout devuelve el turno parcial con estado timeout y protocolo completo,
    listo para conservarlo en la conversación. Otros fallos técnicos se propagan.
    Los callbacks notifican el inicio y resultado de cada llamada.
    """
    if not isinstance(question, str) or not question.strip():
        raise ValueError("La pregunta debe ser un texto no vacío")
    turn = _Turn(previous, question)
    try:
        async with asyncio.timeout(timeout):
            return await _run_turn(client, model, turn, execute, on_tool_call,
                                   on_tool_result, reasoning_effort)
    except (TimeoutError, APITimeoutError):
        return turn.timeout()
    except APIStatusError as exc:
        if exc.status_code not in {408, 504}:
            raise
        return turn.timeout()


async def _run_turn(client, model, turn, execute, on_tool_call, on_tool_result, reasoning_effort):
    contents = turn.contents
    trace = turn.trace
    finish = turn.finish
    herramienta = crear_herramienta()

    for _ in range(MAX_TOOLS + 1):
        response = await client.responses.create(
            model=model,
            instructions=PROMPT.replace("{max_tools}", str(MAX_TOOLS)),
            reasoning={"effort": reasoning_effort},
            input=contents,
            tools=[herramienta],
            tool_choice="auto" if turn.used < MAX_TOOLS else "none",
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
            if final.tipo == "respuesta" and not _hay_evidencia(contents):
                return finish("No pude respaldar esa respuesta con los datos de Prolog. "
                              "Intenta reformular la pregunta.", "error")
            return finish(final.texto, final.tipo, original=output)

        if len(calls) > MAX_TOOLS - turn.used:
            return finish("Alcancé el límite de consultas. Divide la pregunta en partes.", "limite")
        contents.extend(output)
        for call in calls:
            turn.used += 1
            started = perf_counter()
            try:
                arguments = json.loads(call.arguments)
            except ValueError:
                arguments = call.arguments
            if on_tool_call is not None:
                on_tool_call({"numero": turn.used, "herramienta": call.name,
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
                try:
                    result = await execute({"modo": "consulta", "argumentos": query.model_dump()})
                except (Exception, asyncio.CancelledError) as exc:
                    interrupted = isinstance(exc, (asyncio.CancelledError, TimeoutError, APITimeoutError))
                    result = {"estado": "interrumpida" if interrupted else "error", "detalle":
                        "Se dejó de esperar esta consulta y no se recibió su resultado. "
                        "Podría seguir ejecutándose en Prolog; no asumas éxito ni ausencia de datos."
                        if interrupted else "No se pudo ejecutar la consulta Prolog."}
                    entry = {"numero": turn.used, "herramienta": call.name,
                             "argumentos": deepcopy(arguments), "resultado": result,
                             "duracion_ms": round((perf_counter() - started) * 1000)}
                    trace.append(entry)
                    contents.append({"type": "function_call_output", "call_id": call.call_id,
                                     "output": json.dumps(result, ensure_ascii=False)})
                    if on_tool_result is not None:
                        on_tool_result(deepcopy(entry))
                    raise
            entry = {"numero": turn.used, "herramienta": call.name, "argumentos": arguments,
                     "resultado": result, "duracion_ms": round((perf_counter() - started) * 1000)}
            trace.append(entry)
            if on_tool_result is not None:
                on_tool_result(deepcopy(entry))
            contents.append({"type": "function_call_output", "call_id": call.call_id,
                             "output": json.dumps(result, ensure_ascii=False)})
    return finish("Alcancé el límite de consultas.", "limite")
