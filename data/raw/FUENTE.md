# Fuente de los datos

Los CSV de esta carpeta provienen de **The Fjelstul World Cup Database v1.2.0**.

- Autor: Joshua C. Fjelstul, Ph.D.
- © 2023 Joshua C. Fjelstul, Ph.D.
- Repositorio: https://www.github.com/jfjelstul/worldcup (carpeta `data-csv/`)
- Licencia: CC-BY-SA 4.0, https://creativecommons.org/licenses/by-sa/4.0/legalcode

Cita: Fjelstul, Joshua C. "The Fjelstul World Cup Database v.1.2.0." July 19, 2023.
https://www.github.com/jfjelstul/worldcup.

## Archivos usados

Las **27 tablas completas** de `data-csv/`, sin modificar filas ni columnas.
El diccionario oficial (`datasets.csv` y `variables.csv`) está en `data/codebook/`.

La descarga está fijada al commit `35a8667f518b07469182ae16d35574dd0e7a00fb`.
`data/fuente.json` registra las rutas originales y hashes Git SHA-1; el script
`python scripts/descargar_datos.py` verifica o descarga esa misma versión.

Cobertura de esta versión: 22 torneos masculinos (1930–2022), 8 femeninos
(1991–2019), 10.401 jugadores y jugadoras, y 81.200 filas entre las 27 tablas.
Algunas tablas tienen menor cobertura histórica: las apariciones individuales,
tarjetas y sustituciones comienzan en 1970. No se agregan datos de otros años
que no estén presentes en la fuente.

