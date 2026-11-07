"""Chat por terminal: python -m backend.cli [--modelo ID]."""

import argparse
import asyncio
import json
import os
from collections import deque
from pathlib import Path

from dotenv import dotenv_values
from openai import AsyncOpenAI, APIStatusError, APIConnectionError, APITimeoutError
from rich.console import Console
from rich.markdown import Markdown
from rich.panel import Panel
from rich.syntax import Syntax
from rich.text import Text

from .agent import DEFAULT_MODEL, REASONING_EFFORT, run_turn
from .knowledge import KnowledgeError

ROOT = Path(__file__).resolve().parents[1]
REQUEST_TIMEOUT = 60
console = Console(markup=False, highlight=False)


def imprimir_tool_call(event):
    """Mostrar la llamada al recibirla, antes de esperar su resultado."""
    argumentos = json.dumps(event["argumentos"], ensure_ascii=False, indent=2)
    console.print(Panel(
        Syntax(argumentos, "json", word_wrap=True, background_color="default"),
        title=Text(f"Tool {event['numero']} · {event['herramienta']}"),
        title_align="left", border_style="dim", padding=(0, 1),
    ))


def mensaje_error_api(code):
    mensajes = {
        400: "OpenAI no aceptó la solicitud (400). Revisa el formato y la configuración del modelo.",
        401: "OpenAI no pudo autenticar la solicitud (401). Revisa la clave configurada.",
        403: "OpenAI denegó el acceso (403). Revisa los permisos del proyecto y la clave.",
        404: "OpenAI no encontró el recurso (404). Revisa el identificador del modelo y su disponibilidad.",
        429: "Se alcanzó un límite de solicitudes o cuota de OpenAI (429). Revisa los límites en la plataforma de OpenAI antes de reintentar.",
        500: "OpenAI tuvo un error interno (500). Puedes volver a intentarlo.",
        503: "OpenAI no está disponible temporalmente (503). Puedes volver a intentarlo más tarde.",
        504: "OpenAI agotó el tiempo de espera (504). Puedes volver a intentarlo; este error no indica una clave inválida.",
    }
    return mensajes.get(code, f"La solicitud a OpenAI falló (código {code}).")


async def conversar(client, model, reasoning_effort=REASONING_EFFORT):
    turnos = deque(maxlen=10)
    console.print(f"MundialBot · {model} · {reasoning_effort}", style="bold green")
    console.print("/limpiar borra el contexto · /salir termina", style="dim")
    while True:
        try:
            pregunta = input("Tú> ").strip()
        except EOFError:
            console.print()
            return
        if pregunta.lower() in {"/salir", "salir"}:
            return
        if pregunta.lower() == "/limpiar":
            turnos.clear()
            console.print("Conversación limpiada.", style="dim")
            continue
        if not pregunta:
            continue
        if len(pregunta) > 500:
            console.print("La pregunta debe tener como máximo 500 caracteres.", style="yellow")
            continue
        historial = [mensaje for turno in turnos for mensaje in turno]
        try:
            resultado, turno, _ = await run_turn(
                client, model, historial, pregunta, on_tool_call=imprimir_tool_call,
                reasoning_effort=reasoning_effort)
        except TimeoutError:
            console.print("La consulta tardó demasiado. Puedes volver a intentarlo.", style="red")
            continue
        except KnowledgeError:
            console.print("No se pudo consultar Prolog. Comprueba su instalación y los archivos de conocimiento.", style="red")
            continue
        except APITimeoutError:
            console.print("OpenAI agotó el tiempo de espera. Puedes volver a intentarlo.", style="red")
            continue
        except APIConnectionError:
            console.print("No se pudo conectar con OpenAI. Revisa la conexión e intenta nuevamente.", style="red")
            continue
        except APIStatusError as exc:
            console.print(mensaje_error_api(exc.status_code), style="red")
            continue
        except Exception as exc:
            # No imprimir excepciones completas del proveedor ni credenciales.
            console.print(f"No se pudo completar la consulta ({type(exc).__name__}). Puedes volver a intentarlo.", style="red")
            continue
        turnos.append(turno)
        console.print("Bot", style="bold green")
        console.print(Markdown(resultado["respuesta"]))
        console.print()


async def _main(model, key, reasoning_effort=REASONING_EFFORT):
    client = AsyncOpenAI(api_key=key, timeout=REQUEST_TIMEOUT, max_retries=0)
    try:
        await conversar(client, model, reasoning_effort)
    finally:
        await client.close()


def main():
    parser = argparse.ArgumentParser(description="Conversa con MundialBot usando OpenAI y Prolog.")
    parser.add_argument("--modelo",
                        help=f"Reemplaza OPENAI_MODEL; por defecto {DEFAULT_MODEL}.")
    args = parser.parse_args()
    # La configuración local tiene prioridad sobre el entorno heredado.
    # Solo lectura: no se modifica .env ni el entorno del proceso.
    config = dotenv_values(ROOT / ".env")
    key = config.get("OPENAI_API_KEY") or os.getenv("OPENAI_API_KEY")
    model = args.modelo or config.get("OPENAI_MODEL") or os.getenv("OPENAI_MODEL") or DEFAULT_MODEL
    effort = config.get("OPENAI_REASONING_EFFORT") or os.getenv("OPENAI_REASONING_EFFORT") or REASONING_EFFORT
    if not key:
        parser.error("Falta OPENAI_API_KEY en el entorno o en .env.")
    try:
        asyncio.run(_main(model, key, effort))
    except KeyboardInterrupt:
        console.print("\nConversación terminada.", style="dim")


if __name__ == "__main__":
    main()
