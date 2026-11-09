# MundialBot - Proyecto 2

Chatbot de Copas del Mundo FIFA con modo Prolog y modo LLM. El LLM consulta el
dataset completo: masculinos 1930–2022 y femeninos 1991–2019. El modo determinista
conserva las preguntas y reglas originales sobre los masculinos.

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
servidor; “Limpiar” elimina esa sesión. Las respuestas muestran Markdown. Cada
llamada a Prolog aparece en tiempo real con una descripción breve; al desplegarla
se muestran la consulta y sus resultados como tablas o listas. Al terminar la
respuesta, las llamadas quedan colapsadas con su estado y duración. Recargar la
página inicia un chat nuevo; reiniciar el backend borra todas las sesiones.

Las consultas se muestran con sangría, saltos de línea y colores de sintaxis.
Este formato solo afecta la presentación; el código enviado a Prolog conserva
su contenido original. Consulta y resultados tienen altura máxima y scroll.

En la terminal del servidor se registra cada pregunta, sesión, modelo, estado y
duración. Las tool calls aparecen con Rich al recibirlas, antes de ejecutarse, y
la respuesta final se imprime como Markdown. El identificador de cada solicitud
permite distinguir los logs de conversaciones simultáneas.

El modo Prolog funciona sin clave de OpenAI. El modo LLM requiere la configuración
descrita abajo. La documentación interactiva de la API está en **/docs**.

- `POST /api/chat`: recibe `modo` (`prolog` o `llm`), `pregunta` y `sesion` opcional.
  Devuelve `respuesta`, `respuesta_html`, `estado`, `sesion` y `traza`.
- `DELETE /api/sesiones/{sid}`: borra el contexto LLM de una conversación.
- `POST /api/chat/stream`: recibe el mismo cuerpo que `/api/chat` y envía eventos
  NDJSON, uno por línea: `tool_inicio`, `tool_fin`, `respuesta` o `error`, con su
  contenido en `datos`. La web usa esta ruta para mostrar las llamadas en vivo.
  Los errores durante el stream se informan en el evento `error` mediante
  `status` y `detail`; al desconectarse el navegador se cancela el turno pendiente.

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
`descripcion` (acción breve en español, hasta 100 caracteres), `consulta` (código
Prolog) y `limite` (1–100 soluciones, por defecto 50). La descripción solo sirve
como título para la interfaz; no modifica la consulta. Devuelve
las variables de cada solución y señala si el resultado está truncado. Los límites
de soluciones se aplican después de calcular las agregaciones.

Las consultas se ejecutan directamente con Janus en el mismo proceso de Python,
sin sandbox ni lista de operaciones permitidas. `prolog/consultas.pl` ejecuta el
objetivo y convierte sus resultados a JSON. Se conserva un límite de 30 segundos
por consulta, incluida la conversión a JSON, para evitar esperas largas. Las
respuestas demasiado grandes (más de 60.000 caracteres o estructuras excesivas)
devuelven `limite` con instrucciones para reducir la salida. Las variables con
`_` inicial se omiten antes de recopilar soluciones: las listas intermedias deben
usar esos nombres para que no se repitan en cada fila. Cancelar la espera Python no detiene el
hilo Prolog: la consulta termina por sí misma o al agotar ese límite.

El conocimiento se carga una vez y ambos modos comparten la misma base en memoria.
Los cambios hechos por una consulta persisten durante la ejecución. Reiniciar la
CLI recarga los archivos Prolog.

El turno completo tiene un máximo de 30 llamadas y 90 segundos. Los errores de
consulta se devuelven al modelo para que los corrija; los fallos técnicos no se
interpretan como ausencia de datos. El conocimiento general del modelo puede
ayudar a clasificar o interpretar los datos deportivos obtenidos de Prolog.

Si se agota el tiempo del turno o de OpenAI (incluidos HTTP 408/504), se guarda la
pregunta junto con las llamadas y resultados recibidos. La respuesta lleva estado
`timeout` y conserva la sesión: se puede escribir **continúa** tanto en la web
como en la CLI. El agente recibe el contexto y reutiliza los resultados disponibles.
Las llamadas interrumpidas o todavía no ejecutadas quedan identificadas como tales,
sin inventar resultados. Estos turnos también cuentan dentro de los diez turnos de
memoria; reiniciar el servidor o limpiar la conversación elimina ese contexto.

```sh
python -m pytest pruebas -q
```

La integración de OpenAI está disponible por CLI y por la API web. `backend/esquema.txt` describe los hechos y reglas al modelo;
es documentación, no una restricción sobre las consultas que puede ejecutar.

## Dataset completo

Se incluyen las 27 tablas originales, sus 410 columnas (sumadas entre tablas) y
81.200 registros. Hay 30 torneos, 1.248 partidos y 10.401 jugadores y jugadoras.
Además de goles y premios, están disponibles plantillas, apariciones, tarjetas,
sustituciones, tandas de penales, entrenadores, árbitros, estadios y clasificaciones.
Los CSV están fijados a una revisión de la fuente con hashes en `data/fuente.json`.

Para verificar/descargar los originales y regenerar todos los hechos:

```sh
python scripts/descargar_datos.py
python scripts/csv_a_prolog.py
```

La conversión conserva todas las filas y columnas en `prolog/kb/dataset/` y mantiene
las seis vistas originales en `prolog/kb/`. `registro/2` permite consultar cualquier
tabla con un dict parcial; cada variable recibe el valor de esa columna:

```prolog
% Convocados argentinos de 2022, incluidos jugadores sin goles ni premios.
registro(squads, _{tournament_id:"WC-2022", team_name:"Argentina",
                  given_name:Nombre, family_name:Apellido}).

% Partidos jugados por Messi en 2022.
registro(players, _{family_name:"Messi", player_id:_Jugador}),
aggregate_all(count, registro(player_appearances,
  _{player_id:_Jugador, tournament_id:"WC-2022"}), Partidos).

% Campeona del Mundial femenino de 2019.
registro(tournaments, _{tournament_id:"WC-2019", winner:Campeona}).

% Explorar las tablas y columnas disponibles.
tabla_dataset(Tabla, Columnas, CantidadFilas).
```

En el dataset completo los IDs y textos son strings, los nombres están en inglés
y las banderas son 0/1. No mezclar esos IDs con los átomos de las vistas originales
(`argentina`, `lionel_messi`, etc.). Una variable libre como segundo argumento de
`registro/2` devuelve la fila completa. El agente recibe el catálogo generado con
todos los campos, tipos y torneos presentes en cada tabla.

La cobertura varía por tabla: las apariciones individuales empiezan en 1970.
Una convocatoria no prueba que el jugador haya entrado a la cancha y la ausencia
de filas en un período sin cobertura no prueba que no haya participado. Los
marcadores de datos ausentes se conservan tal como vienen de la fuente.

## Estructura

| Archivo/carpeta | Función |
|---|---|
| `data/raw/`, `data/manual/` | Datos |
| `scripts/csv_a_prolog.py` | Conversión de CSV a hechos |
| `scripts/descargar_datos.py`, `data/fuente.json` | Descarga reproducible y hashes de la fuente |
| `data/codebook/` | Diccionario oficial de tablas y variables |
| `prolog/kb/` | Hechos generados: no editar a mano |
| `prolog/kb/dataset/`, `prolog/dataset.pl` | Dataset completo, catálogo y consulta por columnas |
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

El formateador visual se puede verificar con Node: `node --test pruebas/test_prolog_format.cjs`.

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
- Alcance: masculinos 1930–2022 y femeninos 1991–2019; no completa torneos posteriores.
- Alemania Occidental y Alemania son entidades diferentes, siguiendo los hechos originales. Consultar cada nombre expresamente; sus títulos no se fusionan.
- La vista original `jugador/3` contiene goleadores y premiados masculinos; todos los jugadores y plantillas están disponibles mediante `registro/2`.
- Los autogoles se excluyen del total personal; la tanda de penales se separa del marcador.
- En 1950 se explica el grupo final en lugar de inventar una final única.
- La API se ejecuta localmente con un solo worker. GitHub Pages no ejecuta Python ni Prolog.


