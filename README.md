# MundialBot - Proyecto 2, primera entrega

Chatbot de Copas del Mundo FIFA masculinas (1930-2022). 

## Requisitos

- SWI-Prolog 9 o superior, con sus bibliotecas estándar HTTP y JSON.
- Navegador moderno.
- Python 3.9 o superior solo para regenerar datos o ejecutar las 20 pruebas.

## Ejecutar en Windows / terminal de VS Code

1. Instalar SWI-Prolog desde https://www.swi-prolog.org/ e incluirlo en PATH.
2. Extraer el ZIP y abrir la carpeta `chatbot-mundiales` en VS Code.
3. En la terminal PowerShell de esa carpeta:

```powershell
swipl -q -s prolog/servidor.pl -g iniciar
```

Si Windows no reconoce `swipl`, usar:

```powershell
& 'C:\Program Files\swipl\bin\swipl.exe' -q -s prolog/servidor.pl -g iniciar
```

4. Abrir **http://localhost:8000**. Mantener la terminal abierta. No abrir el HTML con doble clic ni con Live Server, porque la web necesita el servidor Prolog.
5. Para detenerlo: Ctrl+C y luego `a` si SWI-Prolog muestra su menú de interrupción.

También se incluye `iniciar.ps1` como atajo. Si PowerShell bloquea el script, usar el comando anterior sin cambiar políticas de ejecución.

En Linux/macOS se utiliza el mismo comando `swipl`. Otro puerto: `swipl -q -s prolog/servidor.pl -g 'iniciar(8080)'`.

## Usar el chatbot en terminal

```powershell
swipl -q -s prolog/chatbot.pl -g chat -t halt
```

Escribir `salir` para terminar.

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

## Limitaciones

- Reconocimiento por patrones: no entiende cualquier frase ni conserva contexto entre preguntas. Escribir una pregunta completa cada vez.
- Alcance 1930-2022: no completa datos de 2026 ni torneos inexistentes.
- Alemania Occidental y Alemania son entidades diferentes, siguiendo los hechos originales. Consultar cada nombre expresamente; sus títulos no se fusionan.
- Jugadores: la base contiene goleadores y premiados, no todas las plantillas.
- Los autogoles se excluyen del total personal; la tanda de penales se separa del marcador.
- En 1950 se explica el grupo final en lugar de inventar una final única.
- El servidor se ejecuta localmente. GitHub Pages no ejecuta Prolog.


