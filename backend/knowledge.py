"""Acceso directo a Prolog mediante Janus para ambos modos del chatbot."""

import asyncio
import json
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
from threading import Lock

import janus_swi as janus

from .contracts import Query

ROOT = Path(__file__).resolve().parents[1]
POOL = ThreadPoolExecutor(max_workers=1, thread_name_prefix="prolog")
_LOCK = Lock()
_loaded = False


class KnowledgeError(RuntimeError):
    """Fallo técnico al cargar o consultar Prolog; no implica falta de datos."""


def _consultar(goal: str, bindings: dict) -> dict:
    global _loaded
    with _LOCK:
        try:
            if not _loaded:
                janus.consult(str(ROOT / "prolog/consultas.pl"))
                _loaded = True
            return janus.query_once(goal, bindings)
        except janus.PrologError as exc:
            raise KnowledgeError("Falló la carga o ejecución de Prolog") from exc


def ejecutar(query: Query) -> dict:
    resultado = _consultar("consultar_json(Consulta, Limite, JSON)",
                          {"Consulta": query.consulta, "Limite": query.limite})
    return json.loads(resultado["JSON"])


def esquema() -> str:
    return Path(__file__).with_name("esquema.txt").read_text(encoding="utf-8")


def _execute(payload: dict) -> dict:
    if payload.get("modo") == "consulta":
        return ejecutar(Query.model_validate(payload["argumentos"]))
    if payload.get("modo") == "prolog":
        pregunta = payload.get("pregunta")
        if not isinstance(pregunta, str) or not pregunta.strip():
            raise ValueError("La pregunta debe ser un texto no vacío")
        resultado = _consultar(
            "atom_string(Pregunta, P), responder(P, R)", {"Pregunta": pregunta})
        if not resultado["truth"]:
            raise KnowledgeError("El reconocedor Prolog no devolvió resultado")
        return resultado["R"]
    raise ValueError("Modo de consulta no soportado")


async def prolog(payload: dict) -> dict:
    return await asyncio.get_running_loop().run_in_executor(POOL, _execute, payload)
