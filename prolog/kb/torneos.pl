% =============================================================
% ARCHIVO GENERADO por scripts/csv_a_prolog.py. NO EDITAR A MANO.
% Fuente: Fjelstul World Cup Database v1.2.0, (c) 2023 Joshua C.
% Fjelstul, Ph.D., CC-BY-SA 4.0. Ver data/raw/FUENTE.md.
% =============================================================
% Torneos, sedes y posiciones finales (1° a 4°).
:- dynamic(torneo/2).
:- dynamic(sede/2).
:- dynamic(posicion_final/3).

% torneo(Anio, CantidadEquipos).
torneo(1930, 13).
torneo(1934, 16).
torneo(1938, 15).
torneo(1950, 13).
torneo(1954, 16).
torneo(1958, 16).
torneo(1962, 16).
torneo(1966, 16).
torneo(1970, 16).
torneo(1974, 16).
torneo(1978, 16).
torneo(1982, 24).
torneo(1986, 24).
torneo(1990, 24).
torneo(1994, 24).
torneo(1998, 32).
torneo(2002, 32).
torneo(2006, 32).
torneo(2010, 32).
torneo(2014, 32).
torneo(2018, 32).
torneo(2022, 32).

% sede(Anio, Equipo): el país anfitrión. 2002 tiene dos.
sede(1930, uruguay).
sede(1934, italia).
sede(1938, francia).
sede(1950, brasil).
sede(1954, suiza).
sede(1958, suecia).
sede(1962, chile).
sede(1966, inglaterra).
sede(1970, mexico).
sede(1974, alemania_occidental).
sede(1978, argentina).
sede(1982, espana).
sede(1986, mexico).
sede(1990, italia).
sede(1994, estados_unidos).
sede(1998, francia).
sede(2002, corea_del_sur).
sede(2002, japon).
sede(2006, alemania).
sede(2010, sudafrica).
sede(2014, brasil).
sede(2018, rusia).
sede(2022, catar).

% posicion_final(Anio, Posicion, Equipo).
posicion_final(1930, 1, uruguay).
posicion_final(1930, 2, argentina).
posicion_final(1930, 3, estados_unidos).
posicion_final(1930, 4, yugoslavia).
posicion_final(1934, 1, italia).
posicion_final(1934, 2, checoslovaquia).
posicion_final(1934, 3, alemania).
posicion_final(1934, 4, austria).
posicion_final(1938, 1, italia).
posicion_final(1938, 2, hungria).
posicion_final(1938, 3, brasil).
posicion_final(1938, 4, suecia).
posicion_final(1950, 1, uruguay).
posicion_final(1950, 2, brasil).
posicion_final(1950, 3, suecia).
posicion_final(1950, 4, espana).
posicion_final(1954, 1, alemania_occidental).
posicion_final(1954, 2, hungria).
posicion_final(1954, 3, austria).
posicion_final(1954, 4, uruguay).
posicion_final(1958, 1, brasil).
posicion_final(1958, 2, suecia).
posicion_final(1958, 3, francia).
posicion_final(1958, 4, alemania_occidental).
posicion_final(1962, 1, brasil).
posicion_final(1962, 2, checoslovaquia).
posicion_final(1962, 3, chile).
posicion_final(1962, 4, yugoslavia).
posicion_final(1966, 1, inglaterra).
posicion_final(1966, 2, alemania_occidental).
posicion_final(1966, 3, portugal).
posicion_final(1966, 4, union_sovietica).
posicion_final(1970, 1, brasil).
posicion_final(1970, 2, italia).
posicion_final(1970, 3, alemania_occidental).
posicion_final(1970, 4, uruguay).
posicion_final(1974, 1, alemania_occidental).
posicion_final(1974, 2, paises_bajos).
posicion_final(1974, 3, polonia).
posicion_final(1974, 4, brasil).
posicion_final(1978, 1, argentina).
posicion_final(1978, 2, paises_bajos).
posicion_final(1978, 3, brasil).
posicion_final(1978, 4, italia).
posicion_final(1982, 1, italia).
posicion_final(1982, 2, alemania_occidental).
posicion_final(1982, 3, polonia).
posicion_final(1982, 4, francia).
posicion_final(1986, 1, argentina).
posicion_final(1986, 2, alemania_occidental).
posicion_final(1986, 3, francia).
posicion_final(1986, 4, belgica).
posicion_final(1990, 1, alemania_occidental).
posicion_final(1990, 2, argentina).
posicion_final(1990, 3, italia).
posicion_final(1990, 4, inglaterra).
posicion_final(1994, 1, brasil).
posicion_final(1994, 2, italia).
posicion_final(1994, 3, suecia).
posicion_final(1994, 4, bulgaria).
posicion_final(1998, 1, francia).
posicion_final(1998, 2, brasil).
posicion_final(1998, 3, croacia).
posicion_final(1998, 4, paises_bajos).
posicion_final(2002, 1, brasil).
posicion_final(2002, 2, alemania).
posicion_final(2002, 3, turquia).
posicion_final(2002, 4, corea_del_sur).
posicion_final(2006, 1, italia).
posicion_final(2006, 2, francia).
posicion_final(2006, 3, alemania).
posicion_final(2006, 4, portugal).
posicion_final(2010, 1, espana).
posicion_final(2010, 2, paises_bajos).
posicion_final(2010, 3, alemania).
posicion_final(2010, 4, uruguay).
posicion_final(2014, 1, alemania).
posicion_final(2014, 2, argentina).
posicion_final(2014, 3, paises_bajos).
posicion_final(2014, 4, brasil).
posicion_final(2018, 1, francia).
posicion_final(2018, 2, croacia).
posicion_final(2018, 3, belgica).
posicion_final(2018, 4, inglaterra).
posicion_final(2022, 1, argentina).
posicion_final(2022, 2, francia).
posicion_final(2022, 3, croacia).
posicion_final(2022, 4, marruecos).
