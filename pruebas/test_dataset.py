"""Integridad de la fuente completa, conversión y consultas entre tablas."""

import csv
import json
import pytest

from backend.contracts import Query
from backend.knowledge import ROOT, ejecutar, esquema
from scripts.csv_a_prolog import convertir_dataset
from scripts.descargar_datos import git_sha

TABLAS = sorted(path.stem for path in (ROOT / "data/raw").glob("*.csv"))


def filas(tabla):
    with (ROOT / "data/raw" / f"{tabla}.csv").open(encoding="utf-8", newline="") as archivo:
        return list(csv.DictReader(archivo))


def consultar(consulta):
    resultado = ejecutar(Query(consulta=consulta))
    assert resultado["estado"] == "ok", resultado
    return resultado["resultados"]


def test_descarga_coincide_con_revision_fijada():
    fuente = json.loads((ROOT / "data/fuente.json").read_text())
    assert len(TABLAS) == 27
    assert len(fuente["archivos"]) == 29  # 27 tablas y dos diccionarios.
    for archivo in fuente["archivos"]:
        assert git_sha((ROOT / archivo["destino"]).read_bytes()) == archivo["sha1"]


@pytest.mark.parametrize("tabla", TABLAS)
def test_todas_las_filas_y_columnas_se_cargan(tabla):
    originales = filas(tabla)
    conteo = consultar(f"aggregate_all(count, registro({tabla}, _Fila), Total)")
    assert conteo == [{"Total": len(originales)}]
    catalogo = consultar(f"tabla_dataset({tabla}, Columnas, Total)")[0]
    assert catalogo["Columnas"] == list(originales[0])
    assert catalogo["Total"] == len(originales)
    with (ROOT / "data/codebook/variables.csv").open(encoding="utf-8") as archivo:
        tipos = {v["variable"]: v["type"] for v in csv.DictReader(archivo) if v["dataset"] == tabla}
    for fila in [originales[0], originales[len(originales)//2], originales[-1]]:
        esperada = {}
        for columna, valor in fila.items():
            try:
                esperada[columna] = int(valor) if tipos[columna] in {"integer", "boolean"} else valor
            except ValueError:
                esperada[columna] = valor
        recibida = consultar(f'registro({tabla}, Fila), get_dict(key_id,Fila,{fila["key_id"]})')
        assert recibida == [{"Fila": esperada}]


def test_convocados_incluye_jugadores_sin_goles_y_apariciones_distinguen_banquillo():
    assert consultar('aggregate_all(count, registro(squads, '
                     '_{tournament_id:"WC-2022",team_name:"Argentina"}), Total)') == [{"Total": 26}]
    # Rulli fue convocado pero no disputó partidos en 2022.
    assert consultar('registro(squads, _{tournament_id:"WC-2022",family_name:"Rulli",player_id:_J}), '
                     'aggregate_all(count, registro(player_appearances, '
                     '_{tournament_id:"WC-2022",player_id:_J}), Partidos)') == [{"Partidos": 0}]
    assert consultar('registro(players, _{family_name:"Messi",player_id:_J}), '
                     'aggregate_all(count, registro(player_appearances, '
                     '_{tournament_id:"WC-2022",player_id:_J}), Partidos)') == [{"Partidos": 7}]


def test_competiciones_separadas_y_vistas_originales_compatibles():
    assert consultar('registro(tournaments, _{tournament_id:"WC-2019",winner:Campeona})') == [
        {"Campeona": "United States"}]
    assert consultar('registro(tournaments, _{tournament_id:"WC-2022",winner:Campeon})') == [
        {"Campeon": "Argentina"}]
    assert consultar('campeon(2022, Equipo)') == [{"Equipo": "argentina"}]
    assert consultar('aggregate_all(count, registro(players, _{female:1}), Total)') == [{"Total": 1919}]
    assert consultar('aggregate_all(count, registro(players, _{female:0}), Total)') == [{"Total": 8482}]


@pytest.mark.parametrize("tabla,filtros", [
    ("bookings", {'tournament_id': 'WC-2022', 'yellow_card': 1}),
    ("substitutions", {'tournament_id': 'WC-2022', 'coming_on': 1}),
    ("penalty_kicks", {'tournament_id': 'WC-2022', 'converted': 1}),
    ("manager_appointments", {'tournament_id': 'WC-2022'}),
    ("referee_appearances", {'tournament_id': 'WC-2022'}),
])
def test_nuevas_consultas_coinciden_con_csv(tabla, filtros):
    esperadas = [r for r in filas(tabla) if all(r[k] == str(v) for k,v in filtros.items())]
    campos = ','.join(f'{k}: {json.dumps(v)}' for k,v in filtros.items())
    assert consultar(f'aggregate_all(count, registro({tabla}, _{{{campos}}}), Total)') == [
        {"Total": len(esperadas)}]


def test_catalogo_del_agente_incluye_todas_las_tablas_y_cobertura():
    texto = esquema()
    for tabla in TABLAS:
        assert f"{tabla} (" in texto
        for campo in filas(tabla)[0]:
            assert f"{campo}:" in texto
    assert 'registro(Tabla, Filtros)' in texto
    assert 'Torneos presentes:' in texto
    assert 'WC-2019' in texto


def test_regeneracion_reproducible(tmp_path):
    total = convertir_dataset(ROOT / "data/raw", ROOT / "data/codebook", tmp_path)
    assert total == 81200
    existentes = ROOT / "prolog/kb/dataset"
    nuevos = tmp_path / "dataset"
    assert {p.name for p in existentes.iterdir()} == {p.name for p in nuevos.iterdir()}
    for path in existentes.iterdir():
        assert path.read_bytes() == (nuevos / path.name).read_bytes()
