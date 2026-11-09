"""API local y frontend de MundialBot: python -m uvicorn backend.main:app."""

import asyncio
import json
import logging
import os
from collections import deque
from contextlib import asynccontextmanager, suppress
from dataclasses import dataclass, field
from pathlib import Path
from time import perf_counter
from uuid import uuid4

from dotenv import dotenv_values
from fastapi import FastAPI, HTTPException
from fastapi.staticfiles import StaticFiles
from fastapi.responses import StreamingResponse
from markdown_it import MarkdownIt
from openai import AsyncOpenAI, APIConnectionError, APIStatusError, APITimeoutError
from rich.markdown import Markdown

from .agent import DEFAULT_MODEL, REASONING_EFFORT, run_turn
from .cli import console, imprimir_tool_call
from .contracts import ChatRequest
from .knowledge import KnowledgeError, prolog

ROOT = Path(__file__).resolve().parents[1]
markdown = MarkdownIt("commonmark", {"html": False}).enable("table").disable("image")
logger = logging.getLogger("uvicorn.error")


@dataclass
class Session:
    turns: deque = field(default_factory=lambda: deque(maxlen=10))
    lock: asyncio.Lock = field(default_factory=asyncio.Lock)


@asynccontextmanager
async def lifespan(app):
    config = dotenv_values(ROOT / ".env")
    key = config.get("OPENAI_API_KEY") or os.getenv("OPENAI_API_KEY")
    app.state.model = config.get("OPENAI_MODEL") or os.getenv("OPENAI_MODEL") or DEFAULT_MODEL
    app.state.effort = config.get("OPENAI_REASONING_EFFORT") or os.getenv("OPENAI_REASONING_EFFORT") or REASONING_EFFORT
    app.state.client = AsyncOpenAI(api_key=key, timeout=60, max_retries=0) if key else None
    app.state.sessions = {}
    try:
        yield
    finally:
        if app.state.client:
            await app.state.client.close()


app = FastAPI(title="MundialBot", lifespan=lifespan)


def respuesta_web(result):
    # El HTML se genera aquí con etiquetas HTML de entrada deshabilitadas.
    return {**result, "respuesta_html": markdown.render(result["respuesta"])}


@app.post("/api/chat")
async def chat(req: ChatRequest):
    return await ejecutar_chat(req)


@app.post("/api/chat/stream")
async def chat_stream(req: ChatRequest):
    async def eventos():
        queue = asyncio.Queue()

        async def producir():
            try:
                result = await ejecutar_chat(req, lambda tipo, data: queue.put_nowait(
                    {"tipo": tipo, "datos": data}))
                queue.put_nowait({"tipo": "respuesta", "datos": result})
            except HTTPException as exc:
                queue.put_nowait({"tipo": "error", "datos": {
                    "status": exc.status_code, "detail": exc.detail}})
            except Exception:
                logger.exception("Error inesperado durante el chat")
                queue.put_nowait({"tipo": "error", "datos": {
                    "status": 500, "detail": "No se pudo completar la respuesta. Intenta nuevamente."}})
            finally:
                queue.put_nowait(None)

        task = asyncio.create_task(producir())
        try:
            while (event := await queue.get()) is not None:
                yield json.dumps(event, ensure_ascii=False) + "\n"
        finally:
            task.cancel()
            with suppress(asyncio.CancelledError):
                await task

    return StreamingResponse(eventos(), media_type="application/x-ndjson",
                             headers={"Cache-Control": "no-cache", "X-Accel-Buffering": "no"})


async def ejecutar_chat(req: ChatRequest, emitir=None):
    request_id = uuid4().hex[:8]
    started = perf_counter()
    logger.info("[%s] %s | pregunta=%r", request_id, req.modo, req.pregunta)

    def finalizar(result):
        logger.info("[%s] estado=%s | consultas=%s | %.2f s", request_id,
                    result["estado"], result.get("consultas", 0), perf_counter() - started)
        console.print(f"[{request_id}] Bot", style="bold green")
        console.print(Markdown(result["respuesta"]))
        return respuesta_web(result)

    def tool_call(event):
        imprimir_tool_call({**event, "prefijo": request_id})
        if emitir:
            emitir("tool_inicio", event)

    def tool_result(event):
        if emitir:
            emitir("tool_fin", event)

    try:
        if req.modo == "prolog":
            result = await prolog({"modo": "prolog", "pregunta": req.pregunta})
            return finalizar({**result, "sesion": None, "traza": []})
        if app.state.client is None:
            raise HTTPException(503, "Falta configurar OPENAI_API_KEY en el backend.")

        if req.sesion:
            session = app.state.sessions.get(req.sesion)
            if session is None:
                raise HTTPException(410, "La conversación ya no existe. Envía nuevamente tu pregunta para iniciar otra.")
            sid = req.sesion
        else:
            sid, session = str(uuid4()), Session()
        if session.lock.locked():
            raise HTTPException(409, "Ya hay una pregunta en curso en esta conversación.")
        async with session.lock:
            logger.info("[%s] sesion=%s | modelo=%s | reasoning=%s", request_id,
                        sid, app.state.model, app.state.effort)
            history = [item for turn in session.turns for item in turn]
            result, turn, trace = await run_turn(
                app.state.client, app.state.model, history, req.pregunta,
                reasoning_effort=app.state.effort, on_tool_call=tool_call,
                on_tool_result=tool_result)
            session.turns.append(turn)
            app.state.sessions[sid] = session
            return finalizar({**result, "sesion": sid, "traza": trace})
    except HTTPException as exc:
        logger.warning("[%s] HTTP %s | %s", request_id, exc.status_code, exc.detail)
        raise
    except (TimeoutError, APITimeoutError):
        logger.warning("[%s] Timeout tras %.2f s", request_id, perf_counter() - started)
        raise HTTPException(504, "La consulta tardó demasiado. Puedes volver a intentarlo.") from None
    except APIStatusError as exc:
        logger.warning("[%s] OpenAI HTTP %s", request_id, exc.status_code)
        detail = ("Se alcanzó la cuota de OpenAI. Intenta más tarde o revisa tu cuota."
                  if exc.status_code == 429 else
                  f"OpenAI rechazó la solicitud ({exc.status_code}). Revisa la clave, el modelo y el acceso del proyecto.")
        raise HTTPException(429 if exc.status_code == 429 else 502, detail) from None
    except APIConnectionError:
        logger.warning("[%s] Error de conexión con OpenAI", request_id)
        raise HTTPException(502, "No se pudo conectar con OpenAI. Puedes volver a intentarlo.") from None
    except KnowledgeError:
        logger.warning("[%s] Error al consultar Prolog", request_id)
        raise HTTPException(502, "No se pudo consultar Prolog. Revisa su instalación y los archivos de conocimiento.") from None


@app.delete("/api/sesiones/{sid}")
async def limpiar(sid: str):
    session = app.state.sessions.get(sid)
    if session and session.lock.locked():
        raise HTTPException(409, "Espera a que termine la pregunta para limpiar la conversación.")
    app.state.sessions.pop(sid, None)
    logger.info("Sesión limpiada: %s", sid)
    return {"ok": True}


# Las rutas API se registran antes del frontend.
app.mount("/", StaticFiles(directory=ROOT / "web", html=True), name="web")
