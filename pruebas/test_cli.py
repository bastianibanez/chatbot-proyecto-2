"""Interacción de terminal sin conexiones externas."""

import asyncio
from io import StringIO

import httpx
import pytest

from backend import cli


def test_markdown_y_tool_calls_se_muestran_en_orden(monkeypatch):
    output = StringIO()
    monkeypatch.setattr(cli, "console", cli.Console(file=output, width=100, color_system=None))
    entradas = iter(["Campeón 2022", "/salir"])
    monkeypatch.setattr("builtins.input", lambda _: next(entradas))
    async def turno(client, model, history, question, *, on_tool_call, reasoning_effort="medium"):
        on_tool_call({"numero": 1, "herramienta": "consultar_mundiales",
                      "argumentos": {"consulta": "member(E, [argentina, brasil])", "limite": 5}})
        assert "consultar_mundiales" in output.getvalue()  # Visible antes de la respuesta.
        return {"respuesta": "**Campeón:** Argentina\n\n- Ganó en **2022**."}, [], []
    monkeypatch.setattr(cli, "run_turn", turno)
    asyncio.run(cli.conversar(None, "simulado"))
    text = output.getvalue()
    assert "Tool 1 · consultar_mundiales" in text
    assert "[argentina, brasil]" in text
    assert '"limite": 5' in text
    assert "Campeón: Argentina" in text
    assert "**" not in text
    assert text.index("consultar_mundiales") < text.index("Campeón: Argentina")


def test_modelo_predeterminado_y_esfuerzo(monkeypatch):
    monkeypatch.setattr("sys.argv", ["cli"])
    monkeypatch.setattr(cli, "dotenv_values", lambda _: {})
    monkeypatch.setenv("OPENAI_API_KEY", "clave-simulada")
    monkeypatch.setenv("GEMINI_MODEL", "modelo-anterior")
    monkeypatch.delenv("OPENAI_MODEL", raising=False)
    monkeypatch.delenv("OPENAI_REASONING_EFFORT", raising=False)
    captured = {}
    async def main(model, key, reasoning_effort):
        captured.update(model=model, key=key, effort=reasoning_effort)
    monkeypatch.setattr(cli, "_main", main)
    cli.main()
    assert captured == {"model": "gpt-6.1-sol", "key": "clave-simulada", "effort": "medium"}
    assert cli.REASONING_EFFORT == "medium"


def test_clave_local_tiene_prioridad_sin_modificar_entorno(monkeypatch):
    monkeypatch.setattr("sys.argv", ["cli"])
    monkeypatch.setenv("OPENAI_API_KEY", "clave-heredada")
    monkeypatch.setattr(cli, "dotenv_values", lambda _: {"OPENAI_API_KEY": "clave-local"})
    async def main(model, key, reasoning_effort):
        assert key == "clave-local"
        assert cli.os.getenv("OPENAI_API_KEY") == "clave-heredada"
    monkeypatch.setattr(cli, "_main", main)
    cli.main()


@pytest.mark.parametrize("args,expected", [([], "modelo-local"), (["--modelo", "modelo-cli"], "modelo-cli")])
def test_config_local_y_override_de_modelo(monkeypatch, args, expected):
    monkeypatch.setattr("sys.argv", ["cli", *args])
    monkeypatch.setenv("OPENAI_MODEL", "modelo-entorno")
    monkeypatch.setenv("OPENAI_REASONING_EFFORT", "low")
    monkeypatch.setattr(cli, "dotenv_values", lambda _: {
        "OPENAI_API_KEY": "clave-local", "OPENAI_MODEL": "modelo-local",
        "OPENAI_REASONING_EFFORT": "high"})
    async def main(model, key, reasoning_effort):
        assert (model, key, reasoning_effort) == (expected, "clave-local", "high")
    monkeypatch.setattr(cli, "_main", main)
    cli.main()


@pytest.mark.parametrize("error", [cli.APITimeoutError, cli.APIConnectionError])
def test_error_de_transporte_permite_continuar(monkeypatch, capsys, error):
    entradas = iter(["Primera", "Segunda", "/salir"])
    monkeypatch.setattr("builtins.input", lambda _: next(entradas))
    async def turno(client, model, history, question, *, on_tool_call=None, reasoning_effort="medium"):
        if question == "Primera":
            raise error(request=httpx.Request("POST", "https://api.openai.com/v1/responses"))
        assert history == []
        return {"respuesta": "Recuperado"}, [], []
    monkeypatch.setattr(cli, "run_turn", turno)
    asyncio.run(cli.conversar(None, "gpt-6.1-sol"))
    assert "Recuperado" in capsys.readouterr().out


def test_contexto_y_limpieza(monkeypatch):
    entradas = iter(["Hola", "Seguimiento", "/limpiar", "Nueva", "/salir"])
    monkeypatch.setattr("builtins.input", lambda _: next(entradas))
    historiales = []
    async def turno(client, model, history, question, *, on_tool_call=None, reasoning_effort="medium"):
        historiales.append(list(history))
        return {"respuesta": "Listo"}, [question], []
    monkeypatch.setattr(cli, "run_turn", turno)
    asyncio.run(cli.conversar(None, "simulado"))
    assert historiales == [[], ["Hola"], []]


def test_maximo_diez_turnos_completos(monkeypatch):
    entradas = iter([str(i) for i in range(12)] + ["/salir"])
    monkeypatch.setattr("builtins.input", lambda _: next(entradas))
    historiales = []
    async def turno(client, model, history, question, *, on_tool_call=None, reasoning_effort="medium"):
        historiales.append(list(history))
        return {"respuesta": "Listo"}, [question, "respuesta"], []
    monkeypatch.setattr(cli, "run_turn", turno)
    asyncio.run(cli.conversar(None, "simulado"))
    assert len(historiales[-1]) == 20
    assert historiales[-1][0] == "1"


def test_fallo_no_se_guarda_y_eof_sale(monkeypatch):
    entradas = iter(["Fallará", "Nueva"])
    def leer(_):
        try:
            return next(entradas)
        except StopIteration:
            raise EOFError
    monkeypatch.setattr("builtins.input", leer)
    historiales = []
    async def turno(client, model, history, question, *, on_tool_call=None, reasoning_effort="medium"):
        historiales.append(list(history))
        if question == "Fallará":
            raise TimeoutError
        return {"respuesta": "Listo"}, [question], []
    monkeypatch.setattr(cli, "run_turn", turno)
    asyncio.run(cli.conversar(None, "simulado"))
    assert historiales == [[], []]


def test_504_informa_timeout_y_permite_reintentar(monkeypatch, capsys):
    entradas = iter(["Primera", "Segunda", "/salir"])
    monkeypatch.setattr("builtins.input", lambda _: next(entradas))
    historiales = []
    async def turno(client, model, history, question, *, on_tool_call=None, reasoning_effort="medium"):
        historiales.append(list(history))
        if question == "Primera":
            raise cli.APIStatusError("deadline", response=httpx.Response(504,
                request=httpx.Request("POST", "https://api.openai.com/v1/responses")), body={})
        return {"respuesta": "Respuesta correcta"}, [question], []
    monkeypatch.setattr(cli, "run_turn", turno)
    asyncio.run(cli.conversar(None, "simulado"))
    output = capsys.readouterr().out
    assert "agotó el tiempo de espera (504)" in output
    assert "Revisa el modelo, la clave y la cuota" not in output
    assert "Respuesta correcta" in output
    assert historiales == [[], []]


def test_mensajes_distinguen_cuota_y_disponibilidad():
    assert "cuota" in cli.mensaje_error_api(429)
    assert "denegó el acceso" in cli.mensaje_error_api(403)
    assert "modelo" in cli.mensaje_error_api(404)
    assert "temporalmente" in cli.mensaje_error_api(503)
    assert "código 418" in cli.mensaje_error_api(418)


def test_configuracion_timeout_y_cierre(monkeypatch):
    captured = {}
    class FakeClient:
        def __init__(self, **kwargs):
            captured.update(kwargs)
        async def close(self):
            captured["closed"] = True
    async def conversar(client, model, reasoning_effort):
        pass
    monkeypatch.setattr(cli, "AsyncOpenAI", FakeClient)
    monkeypatch.setattr(cli, "conversar", conversar)
    asyncio.run(cli._main("simulado", "clave-simulada"))
    assert captured["timeout"] == 60
    assert captured["max_retries"] == 0
    assert captured["closed"]


def test_cli_preserva_resultados_tras_timeout_del_proveedor(monkeypatch, capsys):
    from pruebas.test_agent import client_for, response, call, final
    timeout = cli.APITimeoutError(request=httpx.Request('POST', 'https://example.test/responses'))
    client, models = client_for(response(call()), timeout, final())
    entradas = iter(['Campeón 2022', 'continúa', '/salir'])
    monkeypatch.setattr('builtins.input', lambda _: next(entradas))
    asyncio.run(cli.conversar(client, 'simulado'))
    output = capsys.readouterr().out
    assert 'Conservé la pregunta' in output
    assert 'Argentina fue campeón' in output
    assert any(item.get('type') == 'function_call_output' for item in models.requests[-1]['input'])
