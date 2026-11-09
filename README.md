# MundialBot - Proyecto 2

Chatbot de Copas del Mundo FIFA masculinas (1930–2022), con modo Prolog y modo LLM.

## Ejecutar la web y la API

Requiere Python 3.11 o superior, SWI-Prolog compatible con Janus y las dependencias
instaladas en el entorno virtual. Desde la raíz del proyecto, con el venv activado:

```sh
python -m pip install -r requirements.txt
python -m uvicorn backend.main:app --host 127.0.0.1 --port 8000
```

Abrir **http://127.0.0.1:8000**. El mismo servidor entrega la web y la API; no hace
falta iniciar otro servidor ni abrir el HTML directamente. La API lee el `.env`
del proyecto. Para detenerla: Ctrl+C. Usar un solo worker para conservar sesiones
en memoria. En Windows también se puede ejecutar `./iniciar.ps1` desde PowerShell.

El selector permite alternar entre **Prolog** y **LLM**. Cada modo conserva sus
mensajes por separado en la página. El LLM mantiene diez turnos de contexto en el
servidor; “Limpiar” elimina esa sesión. Las respuestas muestran Markdown y las
consultas a Prolog se pueden desplegar al terminar cada respuesta. Recargar la
página inicia un chat nuevo; reiniciar el backend borra todas las sesiones.

En la terminal del servidor se registra cada pregunta, sesión, modelo, estado y
duración. Las tool calls aparecen con Rich al recibirlas, antes de ejecutarse, y
la respuesta final se imprime como Markdown. El identificador de cada solicitud
permite distinguir los logs de conversaciones simultáneas.

El modo Prolog funciona sin clave de OpenAI. El modo LLM requiere la configuración
descrita abajo. La documentación interactiva de la API está en **/docs**.

- `POST /api/chat`: recibe `modo` (`prolog` o `llm`), `pregunta` y `sesion` opcional.
  Devuelve `respuesta`, `respuesta_html`, `estado`, `sesion` y `traza`.
- `DELETE /api/sesiones/{sid}`: borra el contexto LLM de una conversación.

Ejemplo de primera pregunta; usar la `sesion` devuelta para los seguimientos:

```json
{"modo":"llm","pregunta":"¿Quién fue campeón en 2022?"}
```

## Usar el chatbot en terminal

```powershell
swipl -q -s prolog/chatbot.pl -g chat -t halt
```

Escribir `salir` para terminar.

## Conversar con GPT-6.1 Sol desde Python

Requiere Python 3.11 o superior, SWI-Prolog en PATH y las dependencias de
`requirements.txt`. Configurar `OPENAI_API_KEY` en el entorno o
en el archivo local `.env`, que no se versiona. La configuración del `.env`
del proyecto tiene prioridad sobre una clave heredada del entorno. Configuración:

```dotenv
OPENAI_MODEL=gpt-6.1-sol
OPENAI_REASONING_EFFORT=medium
```

Agregar también `OPENAI_API_KEY` con la clave de la cuenta. Modelo y esfuerzo se
leen del `.env`, luego del entorno y finalmente de los valores predeterminados.

```sh
python -m pip install -r requirements.txt
python -m backend.cli
```

La CLI conserva los últimos diez turnos. `/limpiar` borra el contexto y `/salir`
termina. El modelo predeterminado es `gpt-6.1-sol`, con razonamiento `medium`,
usando Responses API. Se puede elegir otro modelo compatible mediante
`--modelo IDENTIFICADOR`, que tiene prioridad sobre `OPENAI_MODEL`.

Las respuestas se renderizan con Rich para mostrar Markdown (listas, tablas,
negritas y bloques de código). Cada llamada a herramientas se imprime al recibirla,
con su número, nombre y argumentos JSON, antes de ejecutarla.

El asistente recibe el esquema de hechos y reglas y escribe consultas Prolog
para responder, incluyendo agregaciones y rankings. La herramienta recibe
`consulta` (código Prolog) y `limite` (1–100 soluciones, por defecto 50). Devuelve
las variables de cada solución y señala si el resultado está truncado. Los límites
de soluciones se aplican después de calcular las agregaciones.

Las consultas se ejecutan directamente con Janus en el mismo proceso de Python,
sin sandbox ni lista de operaciones permitidas. `prolog/consultas.pl` ejecuta el
objetivo y convierte sus resultados a JSON. Se conserva un límite de 3 segundos
por consulta para evitar esperas largas. Cancelar la espera Python no detiene el
hilo Prolog: la consulta termina por sí misma o al agotar ese límite.

El conocimiento se carga una vez y ambos modos comparten la misma base en memoria.
Los cambios hechos por una consulta persisten durante la ejecución. Reiniciar la
CLI recarga los archivos Prolog.

El turno completo tiene un máximo de 30 llamadas y 90 segundos. Los errores de
consulta se devuelven al modelo para que los corrija; los fallos técnicos no se
interpretan como ausencia de datos. El conocimiento general del modelo puede
ayudar a clasificar o interpretar los datos deportivos obtenidos de Prolog.

```sh
python -m pytest pruebas -q
```

La integración de OpenAI está disponible por CLI y por la API web. `backend/esquema.txt` describe los hechos y reglas al modelo;
es documentación, no una restricción sobre las consultas que puede ejecutar.

## Estructura

| Archivo/carpeta | Función |
|---|---|
| `data/raw/`, `data/manual/` | Datos |
| `scripts/csv_a_prolog.py` | Conversión de CSV a hechos |
| `prolog/kb/` | Hechos generados: no editar a mano |
| `prolog/kb_manual.pl` | Incorporaciones o correcciones manuales |
| `prolog/cargar.pl` | Carga hechos y reglas |
| `prolog/reglas.pl` | Inferencias y consultas derivadas |
| `prolog/chatbot.pl` | Reconocimiento de preguntas y respuestas |
| `prolog/servidor.pl` | Servidor web y endpoint POST `/api/chat` |
| `prolog/consultas.pl` | Ejecución directa y conversión de resultados a JSON |
| `backend/esquema.txt` | Descripción de hechos y reglas para el modelo |
| `backend/main.py` | API FastAPI, sesiones en memoria y frontend |
| `backend/` | Contratos, herramienta Prolog, loop OpenAI y CLI |
| `web/` | HTML, CSS y JavaScript |
| `pruebas/` | 20 consultas, respuestas guardadas y pruebas de reglas |
| `informe/` | Informe PDF |

## Comprobar funcionamiento

```powershell
python pruebas/ejecutar.py
swipl -q -s pruebas/reglas_tests.pl -g run_tests -t halt
```

Las primeras pruebas guardan las respuestas reales en `pruebas/resultados.json`. Los resultados incluidos corresponden a la verificación realizada antes de preparar el informe.

## Ejemplos de consultas

```prolog
?- campeon(2022, Equipo).
?- anfitrion_campeon(Anio, Equipo).
?- cantidad_titulos(brasil, N).
?- participa(chile, 1962).
?- ganador_partido(m_2022_64, Equipo).
?- goleadores(2014, Jugadores, Goles).
```

El bot reconoce campeones, subcampeones, terceros, sedes, equipos, partidos, goles, títulos, años de campeonato, participaciones, anfitriones campeones, premios, goleadores y finales. Los ejemplos de la web y `pruebas/casos.json` muestran formulaciones admitidas.

## Limitaciones del chatbot determinista y los datos

- Reconocimiento por patrones: no entiende cualquier frase ni conserva contexto entre preguntas. Escribir una pregunta completa cada vez.
- Alcance 1930-2022: no completa datos de 2026 ni torneos inexistentes.
- Alemania Occidental y Alemania son entidades diferentes, siguiendo los hechos originales. Consultar cada nombre expresamente; sus títulos no se fusionan.
- Jugadores: la base contiene goleadores y premiados, no todas las plantillas.
- Los autogoles se excluyen del total personal; la tanda de penales se separa del marcador.
- En 1950 se explica el grupo final en lugar de inventar una final única.
- La API se ejecuta localmente con un solo worker. GitHub Pages no ejecuta Python ni Prolog.


