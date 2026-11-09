"""Consultas Prolog directas, resultados y errores; no requieren OpenAI."""

import asyncio
import re

import pytest
from pydantic import ValidationError

from backend.contracts import Query
from backend import knowledge


def consultar(texto, **kwargs):
    return knowledge.ejecutar(Query(consulta=texto, **kwargs))


@pytest.mark.parametrize('consulta,esperado', [
    ('campeon(2022, Equipo)', {'Equipo': 'argentina'}),
    ('subcampeon(2014, Equipo)', {'Equipo': 'argentina'}),
    ('tercero(1962, Equipo)', {'Equipo': 'chile'}),
    ('cantidad_titulos(brasil, N)', {'N': 5}),
    ('cantidad_titulos(chile, N)', {'N': 0}),
    ('cantidad_titulos(alemania_occidental, N)', {'N': 3}),
    ('cantidad_partidos(2022, N)', {'N': 64}),
    ('goles_torneo(2022, N)', {'N': 172}),
    ('goleadores(2022, Jugadores, Goles)', {'Jugadores': ['kylian_mbappe'], 'Goles': 8}),
    ('aggregate_all(count, torneo(_, _), N)', {'N': 22}),
    ('equipo(japon, Nombre, _)', {'Nombre': 'Japón'}),
    ('campeon(2022, _E).', {}),
])
def test_consultas_reales(consulta, esperado):
    assert consultar(consulta) == {'estado': 'ok', 'resultados': [esperado], 'truncado': False}


def test_sedes_completas_y_truncamiento():
    completo = consultar('sede(Anio, _E), equipo(_E, Nombre, _)')
    assert completo['estado'] == 'ok'
    assert len(completo['resultados']) == 23  # 22 torneos, 2002 tuvo dos sedes.
    assert not completo['truncado']
    parcial = consultar('sede(Anio, Equipo)', limite=2)
    assert len(parcial['resultados']) == 2
    assert parcial['truncado']
    exacto = consultar('member(N, [1,2])', limite=2)
    assert not exacto['truncado']


def test_top_historico_calculado_antes_del_limite():
    result = consultar(r'''
        findall(_G-_Nombre, (jugador(_J, _Nombre, _),
          aggregate_all(count, (gol(_, _J, _, _, _Tipo), _Tipo \= autogol), _G)), _Pares),
        keysort(_Pares, _Asc), reverse(_Asc, _Desc),
        nth1(Puesto, _Desc, Goles-Nombre), Puesto =< 5
    ''', limite=5)
    assert result['estado'] == 'ok'
    assert not result['truncado']
    rows = result['resultados']
    assert [(r['Nombre'], r['Goles']) for r in rows[:3]] == [
        ('Miroslav Klose', 16), ('Ronaldo', 15), ('Gerd Müller', 14)]
    assert {(r['Nombre'], r['Goles']) for r in rows[3:]} == {
        ('Just Fontaine', 13), ('Lionel Messi', 13)}


def test_empates_y_agregacion_de_goleadores_por_edicion():
    result = consultar('goleadores(1962, _Js, Goles), member(_J, _Js), jugador(_J, Nombre, _)')
    assert len(result['resultados']) == 6
    assert all(r['Goles'] == 4 for r in result['resultados'])
    all_years = consultar('torneo(Anio, _), goleadores(Anio, Jugadores, Goles)')
    assert len(all_years['resultados']) == 22
    assert not all_years['truncado']


def test_colecciones_compuestos_y_variables_libres():
    result = consultar('findall(A-E, sede(A,E), Pares)')
    assert result['resultados'][0]['Pares'][0] == {'functor': '-', 'argumentos': [1930, 'uruguay']}
    assert result['resultados'][0]['A'] is None
    result = consultar('setof(A, N^torneo(A,N), Anios)')
    assert result['resultados'][0]['Anios'] == [1930, 1934, 1938, *range(1950, 2023, 4)]


@pytest.mark.parametrize('consulta', [
    'campeon(1942, Equipo)', 'campeon(2022, brasil)',
    'premio(2022, premio_inexistente, Jugador)',
])
def test_ausencia_de_resultados_no_es_error(consulta):
    assert consultar(consulta) == {'estado': 'sin_datos', 'resultados': [], 'truncado': False}


def test_consultas_libres_sin_lista_de_operaciones():
    result = consultar('call(user:campeon(2022, Equipo))')
    assert result['resultados'] == [{'Equipo': 'argentina'}]
    result = consultar("setup_call_cleanup(assertz(prueba_consulta_libre(ok)), "
                       "call(prueba_consulta_libre(Valor)), retractall(prueba_consulta_libre(_)))")
    assert result['resultados'] == [{'Valor': 'ok'}]
    assert consultar('prueba_consulta_libre(_)')['estado'] == 'sin_datos'


@pytest.mark.parametrize('consulta', ['no_existe(X)', 'campeon(', '?- campeon(2022,E)', 'X is Y+1'])
def test_errores_corregibles(consulta):
    result = consultar(consulta)
    assert result['estado'] == 'consulta_invalida'
    assert result['detalle']
    assert consultar('campeon(2022, E)')['resultados'] == [{'E': 'argentina'}]


@pytest.mark.parametrize('payload', [
    {'consulta': ' '}, {'consulta': 12}, {'consulta': 'x'*6001},
    {'consulta': 'true', 'anio': 2022}, {'consulta': 'true', 'limite': 101},
    {'consulta': 'true', 'limite': 0}, {'consulta': 'true', 'limite': '2'},
])
def test_contrato(payload):
    with pytest.raises(ValidationError):
        Query.model_validate(payload)


def test_resultado_ciclico_informa_error_de_conversion():
    assert consultar('X = [a|X]')['estado'] == 'consulta_invalida'


def test_tiempo_agregado_acotado():
    result = consultar('aggregate_all(count, between(1,1000000000,_), N)')
    assert result['estado'] == 'limite'


def test_esquema_describe_hechos_y_reglas():
    schema = knowledge.esquema()
    assert 'partido_lugar(' in schema
    assert 'goles_jugador(' in schema
    assert 'aggregate_all/3' in schema


def test_esquema_cubre_todos_los_hechos_y_reglas_actuales():
    schema = knowledge.esquema().splitlines()
    nombres = {s.split('(', 1)[0] for s in schema}
    for path in (knowledge.ROOT / 'prolog/kb').glob('*.pl'):
        declarados = re.findall(r':- dynamic\((\w+)/\d+\)', path.read_text())
        assert set(declarados) <= nombres
    reglas = (knowledge.ROOT / 'prolog/reglas.pl').read_text()
    declarados = re.findall(r'^(\w+)\([^\n]*?\)\s*:-', reglas, re.M)
    assert set(declarados) <= nombres


def test_modos_async():
    async def run():
        return await asyncio.gather(
            knowledge.prolog({'modo': 'consulta', 'argumentos': {'consulta': 'campeon(2022,E)'}}),
            knowledge.prolog({'modo': 'prolog', 'pregunta': '¿Quién fue campeón en 2022?'}))
    estructurada, original = asyncio.run(run())
    assert estructurada['resultados'] == [{'E': 'argentina'}]
    assert 'Argentina' in original['respuesta']


def test_fallo_tecnico_no_es_sin_datos(monkeypatch):
    def fallo(*args, **kwargs):
        raise knowledge.janus.PrologError('fallo técnico')
    monkeypatch.setattr(knowledge.janus, 'query_once', fallo)
    with pytest.raises(knowledge.KnowledgeError):
        consultar('true')
