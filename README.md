# Proyecto 2 - Fundamentos de la Inteligencia artificial

Este proyecto implementa un chatbot. Se divide en dos entregas. En la primera se debe definir un área del conocimiento, modelar esta información en una base de concimientos y luego crear un chatbot en prolog que pueda responder preguntas utilizando lógica de primer orden.
En la segunda entrega se reemplaza la lógica de primer orden por un llm

## Dominio

Copas del Mundo FIFA masculinas, 1930–2022: torneos, sedes, selecciones,
partidos, goles, jugadores y premios.

## Estructura

```
data/raw/                 CSV de la Fjelstul World Cup Database (ver FUENTE.md)
data/manual/              traducciones al español (equipos_es.csv)
scripts/csv_a_prolog.py   convierte los CSV en hechos Prolog
prolog/cargar.pl          punto de entrada: carga toda la base de conocimiento
prolog/kb/                hechos GENERADOS (no editar a mano)
prolog/kb_manual.pl       hechos agregados a mano
```

## Requisitos

- SWI-Prolog 9 o superior
- Python 3.9 o superior (solo biblioteca estándar)

## Uso

Regenerar la base de conocimiento desde los CSV:

```sh
python3 scripts/csv_a_prolog.py
```

Cargar la base en Prolog y consultar:

```sh
swipl prolog/cargar.pl
?- posicion_final(1986, 1, Campeon).
?- partido(Id, 2022, final, Local, Visita, GL, GV).
```

## Base de conocimiento

| Predicado | Significado |
|---|---|
| `torneo(Anio, CantidadEquipos)` | Mundial disputado ese año |
| `sede(Anio, Equipo)` | país anfitrión (2002 tiene dos) |
| `posicion_final(Anio, Posicion, Equipo)` | 1° a 4° lugar |
| `equipo(Equipo, Nombre, Confederacion)` | selección |
| `partido(Id, Anio, Fase, Local, Visita, GolesL, GolesV)` | goles incluyen alargue |
| `partido_grupo/2`, `partido_fecha/2`, `partido_lugar/3` | datos del partido |
| `alargue(Id)`, `penales(Id, PL, PV)` | definición del partido |
| `repetido(Id)`, `repeticion(Id)` | empates que se volvieron a jugar (1934–1938) |
| `gol(Partido, Jugador, Equipo, Minuto, Tipo)` | `Tipo`: `normal`, `penal`, `autogol` |
| `jugador(Jugador, Nombre, Posicion)` | goleadores y premiados |
| `premio(Anio, Premio, Jugador)` | balón, bota y guante de oro, etc. |


## Datos

The Fjelstul World Cup Database v1.2.0, © 2023 Joshua C. Fjelstul, Ph.D.,
licencia [CC-BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/legalcode).
Detalle de modificaciones en `data/raw/FUENTE.md`.
