% =============================================================
% ARCHIVO GENERADO por scripts/csv_a_prolog.py. NO EDITAR A MANO.
% Fuente: Fjelstul World Cup Database v1.2.0, (c) 2023 Joshua C.
% Fjelstul, Ph.D., CC-BY-SA 4.0. Ver data/raw/FUENTE.md.
% =============================================================
% Partidos. Los goles incluyen el alargue; los penales van aparte.
:- dynamic(partido/7).
:- dynamic(partido_grupo/2).
:- dynamic(partido_fecha/2).
:- dynamic(partido_lugar/3).
:- dynamic(alargue/1).
:- dynamic(penales/3).
:- dynamic(repetido/1).
:- dynamic(repeticion/1).

% partido(Id, Anio, Fase, Local, Visita, GolesLocal, GolesVisita).
partido(m_1930_01, 1930, fase_grupos, francia, mexico, 4, 1).
partido(m_1930_02, 1930, fase_grupos, estados_unidos, belgica, 3, 0).
partido(m_1930_03, 1930, fase_grupos, yugoslavia, brasil, 2, 1).
partido(m_1930_04, 1930, fase_grupos, rumania, peru, 3, 1).
partido(m_1930_05, 1930, fase_grupos, argentina, francia, 1, 0).
partido(m_1930_06, 1930, fase_grupos, chile, mexico, 3, 0).
partido(m_1930_07, 1930, fase_grupos, yugoslavia, bolivia, 4, 0).
partido(m_1930_08, 1930, fase_grupos, estados_unidos, paraguay, 3, 0).
partido(m_1930_09, 1930, fase_grupos, uruguay, peru, 1, 0).
partido(m_1930_10, 1930, fase_grupos, chile, francia, 1, 0).
partido(m_1930_11, 1930, fase_grupos, argentina, mexico, 6, 3).
partido(m_1930_12, 1930, fase_grupos, brasil, bolivia, 4, 0).
partido(m_1930_13, 1930, fase_grupos, paraguay, belgica, 1, 0).
partido(m_1930_14, 1930, fase_grupos, uruguay, rumania, 4, 0).
partido(m_1930_15, 1930, fase_grupos, argentina, chile, 3, 1).
partido(m_1930_16, 1930, semifinal, argentina, estados_unidos, 6, 1).
partido(m_1930_17, 1930, semifinal, uruguay, yugoslavia, 6, 1).
partido(m_1930_18, 1930, final, uruguay, argentina, 4, 2).
partido(m_1934_01, 1934, octavos, austria, francia, 3, 2).
partido(m_1934_02, 1934, octavos, checoslovaquia, rumania, 2, 1).
partido(m_1934_03, 1934, octavos, alemania, belgica, 5, 2).
partido(m_1934_04, 1934, octavos, hungria, egipto, 4, 2).
partido(m_1934_05, 1934, octavos, italia, estados_unidos, 7, 1).
partido(m_1934_06, 1934, octavos, espana, brasil, 3, 1).
partido(m_1934_07, 1934, octavos, suecia, argentina, 3, 2).
partido(m_1934_08, 1934, octavos, suiza, paises_bajos, 3, 2).
partido(m_1934_09, 1934, cuartos, austria, hungria, 2, 1).
partido(m_1934_10, 1934, cuartos, checoslovaquia, suiza, 3, 2).
partido(m_1934_11, 1934, cuartos, alemania, suecia, 2, 1).
partido(m_1934_12, 1934, cuartos, italia, espana, 1, 1).
partido(m_1934_13, 1934, cuartos, italia, espana, 1, 0).
partido(m_1934_14, 1934, semifinal, checoslovaquia, alemania, 3, 1).
partido(m_1934_15, 1934, semifinal, italia, austria, 1, 0).
partido(m_1934_16, 1934, tercer_puesto, alemania, austria, 3, 2).
partido(m_1934_17, 1934, final, italia, checoslovaquia, 2, 1).
partido(m_1938_01, 1938, octavos, suiza, alemania, 1, 1).
partido(m_1938_02, 1938, octavos, cuba, rumania, 3, 3).
partido(m_1938_03, 1938, octavos, francia, belgica, 3, 1).
partido(m_1938_04, 1938, octavos, hungria, indias_orientales_neerlandesas, 6, 0).
partido(m_1938_05, 1938, octavos, italia, noruega, 2, 1).
partido(m_1938_06, 1938, octavos, brasil, polonia, 6, 5).
partido(m_1938_07, 1938, octavos, checoslovaquia, paises_bajos, 3, 0).
partido(m_1938_08, 1938, octavos, cuba, rumania, 2, 1).
partido(m_1938_09, 1938, octavos, suiza, alemania, 4, 2).
partido(m_1938_10, 1938, cuartos, brasil, checoslovaquia, 1, 1).
partido(m_1938_11, 1938, cuartos, hungria, suiza, 2, 0).
partido(m_1938_12, 1938, cuartos, italia, francia, 3, 1).
partido(m_1938_13, 1938, cuartos, suecia, cuba, 8, 0).
partido(m_1938_14, 1938, cuartos, brasil, checoslovaquia, 2, 1).
partido(m_1938_15, 1938, semifinal, hungria, suecia, 5, 1).
partido(m_1938_16, 1938, semifinal, italia, brasil, 2, 1).
partido(m_1938_17, 1938, tercer_puesto, brasil, suecia, 4, 2).
partido(m_1938_18, 1938, final, italia, hungria, 4, 2).
partido(m_1950_01, 1950, fase_grupos, brasil, mexico, 4, 0).
partido(m_1950_02, 1950, fase_grupos, yugoslavia, suiza, 3, 0).
partido(m_1950_03, 1950, fase_grupos, inglaterra, chile, 2, 0).
partido(m_1950_04, 1950, fase_grupos, espana, estados_unidos, 3, 1).
partido(m_1950_05, 1950, fase_grupos, suecia, italia, 3, 2).
partido(m_1950_06, 1950, fase_grupos, brasil, suiza, 2, 2).
partido(m_1950_07, 1950, fase_grupos, yugoslavia, mexico, 4, 1).
partido(m_1950_08, 1950, fase_grupos, espana, chile, 2, 0).
partido(m_1950_09, 1950, fase_grupos, estados_unidos, inglaterra, 1, 0).
partido(m_1950_10, 1950, fase_grupos, suecia, paraguay, 2, 2).
partido(m_1950_11, 1950, fase_grupos, brasil, yugoslavia, 2, 0).
partido(m_1950_12, 1950, fase_grupos, chile, estados_unidos, 5, 2).
partido(m_1950_13, 1950, fase_grupos, espana, inglaterra, 1, 0).
partido(m_1950_14, 1950, fase_grupos, italia, paraguay, 2, 0).
partido(m_1950_15, 1950, fase_grupos, uruguay, bolivia, 8, 0).
partido(m_1950_16, 1950, fase_grupos, suiza, mexico, 2, 1).
partido(m_1950_17, 1950, ronda_final, brasil, suecia, 7, 1).
partido(m_1950_18, 1950, ronda_final, uruguay, espana, 2, 2).
partido(m_1950_19, 1950, ronda_final, brasil, espana, 6, 1).
partido(m_1950_20, 1950, ronda_final, uruguay, suecia, 3, 2).
partido(m_1950_21, 1950, ronda_final, suecia, espana, 3, 1).
partido(m_1950_22, 1950, ronda_final, uruguay, brasil, 2, 1).
partido(m_1954_01, 1954, fase_grupos, brasil, mexico, 5, 0).
partido(m_1954_02, 1954, fase_grupos, yugoslavia, francia, 1, 0).
partido(m_1954_03, 1954, fase_grupos, austria, escocia, 1, 0).
partido(m_1954_04, 1954, fase_grupos, uruguay, checoslovaquia, 2, 0).
partido(m_1954_05, 1954, fase_grupos, suiza, italia, 2, 1).
partido(m_1954_06, 1954, fase_grupos, hungria, corea_del_sur, 9, 0).
partido(m_1954_07, 1954, fase_grupos, alemania_occidental, turquia, 4, 1).
partido(m_1954_08, 1954, fase_grupos, inglaterra, belgica, 4, 4).
partido(m_1954_09, 1954, fase_grupos, uruguay, escocia, 7, 0).
partido(m_1954_10, 1954, fase_grupos, brasil, yugoslavia, 1, 1).
partido(m_1954_11, 1954, fase_grupos, austria, checoslovaquia, 5, 0).
partido(m_1954_12, 1954, fase_grupos, francia, mexico, 3, 2).
partido(m_1954_13, 1954, fase_grupos, hungria, alemania_occidental, 8, 3).
partido(m_1954_14, 1954, fase_grupos, turquia, corea_del_sur, 7, 0).
partido(m_1954_15, 1954, fase_grupos, italia, belgica, 4, 1).
partido(m_1954_16, 1954, fase_grupos, inglaterra, suiza, 2, 0).
partido(m_1954_17, 1954, fase_grupos, alemania_occidental, turquia, 7, 2).
partido(m_1954_18, 1954, fase_grupos, suiza, italia, 4, 1).
partido(m_1954_19, 1954, cuartos, austria, suiza, 7, 5).
partido(m_1954_20, 1954, cuartos, uruguay, inglaterra, 4, 2).
partido(m_1954_21, 1954, cuartos, hungria, brasil, 4, 2).
partido(m_1954_22, 1954, cuartos, alemania_occidental, yugoslavia, 2, 0).
partido(m_1954_23, 1954, semifinal, hungria, uruguay, 4, 2).
partido(m_1954_24, 1954, semifinal, alemania_occidental, austria, 6, 1).
partido(m_1954_25, 1954, tercer_puesto, austria, uruguay, 3, 1).
partido(m_1954_26, 1954, final, alemania_occidental, hungria, 3, 2).
partido(m_1958_01, 1958, fase_grupos, suecia, mexico, 3, 0).
partido(m_1958_02, 1958, fase_grupos, argentina, alemania_occidental, 1, 3).
partido(m_1958_03, 1958, fase_grupos, irlanda_del_norte, checoslovaquia, 1, 0).
partido(m_1958_04, 1958, fase_grupos, francia, paraguay, 7, 3).
partido(m_1958_05, 1958, fase_grupos, yugoslavia, escocia, 1, 1).
partido(m_1958_06, 1958, fase_grupos, hungria, gales, 1, 1).
partido(m_1958_07, 1958, fase_grupos, brasil, austria, 3, 0).
partido(m_1958_08, 1958, fase_grupos, union_sovietica, inglaterra, 2, 2).
partido(m_1958_09, 1958, fase_grupos, argentina, irlanda_del_norte, 3, 1).
partido(m_1958_10, 1958, fase_grupos, alemania_occidental, checoslovaquia, 2, 2).
partido(m_1958_11, 1958, fase_grupos, paraguay, escocia, 3, 2).
partido(m_1958_12, 1958, fase_grupos, yugoslavia, francia, 3, 2).
partido(m_1958_13, 1958, fase_grupos, mexico, gales, 1, 1).
partido(m_1958_14, 1958, fase_grupos, brasil, inglaterra, 0, 0).
partido(m_1958_15, 1958, fase_grupos, union_sovietica, austria, 2, 0).
partido(m_1958_16, 1958, fase_grupos, suecia, hungria, 2, 1).
partido(m_1958_17, 1958, fase_grupos, suecia, gales, 0, 0).
partido(m_1958_18, 1958, fase_grupos, checoslovaquia, argentina, 6, 1).
partido(m_1958_19, 1958, fase_grupos, alemania_occidental, irlanda_del_norte, 2, 2).
partido(m_1958_20, 1958, fase_grupos, francia, escocia, 2, 1).
partido(m_1958_21, 1958, fase_grupos, paraguay, yugoslavia, 3, 3).
partido(m_1958_22, 1958, fase_grupos, hungria, mexico, 4, 0).
partido(m_1958_23, 1958, fase_grupos, brasil, union_sovietica, 2, 0).
partido(m_1958_24, 1958, fase_grupos, inglaterra, austria, 2, 2).
partido(m_1958_25, 1958, fase_grupos, irlanda_del_norte, checoslovaquia, 2, 1).
partido(m_1958_26, 1958, fase_grupos, gales, hungria, 2, 1).
partido(m_1958_27, 1958, fase_grupos, union_sovietica, inglaterra, 1, 0).
partido(m_1958_28, 1958, cuartos, brasil, gales, 1, 0).
partido(m_1958_29, 1958, cuartos, francia, irlanda_del_norte, 4, 0).
partido(m_1958_30, 1958, cuartos, suecia, union_sovietica, 2, 0).
partido(m_1958_31, 1958, cuartos, alemania_occidental, yugoslavia, 1, 0).
partido(m_1958_32, 1958, semifinal, brasil, francia, 5, 2).
partido(m_1958_33, 1958, semifinal, suecia, alemania_occidental, 3, 1).
partido(m_1958_34, 1958, tercer_puesto, francia, alemania_occidental, 6, 3).
partido(m_1958_35, 1958, final, brasil, suecia, 5, 2).
partido(m_1962_01, 1962, fase_grupos, uruguay, colombia, 2, 1).
partido(m_1962_02, 1962, fase_grupos, chile, suiza, 3, 1).
partido(m_1962_03, 1962, fase_grupos, brasil, mexico, 2, 0).
partido(m_1962_04, 1962, fase_grupos, argentina, bulgaria, 1, 0).
partido(m_1962_05, 1962, fase_grupos, union_sovietica, yugoslavia, 2, 0).
partido(m_1962_06, 1962, fase_grupos, alemania_occidental, italia, 0, 0).
partido(m_1962_07, 1962, fase_grupos, checoslovaquia, espana, 1, 0).
partido(m_1962_08, 1962, fase_grupos, hungria, inglaterra, 2, 1).
partido(m_1962_09, 1962, fase_grupos, yugoslavia, uruguay, 3, 1).
partido(m_1962_10, 1962, fase_grupos, chile, italia, 2, 0).
partido(m_1962_11, 1962, fase_grupos, brasil, checoslovaquia, 0, 0).
partido(m_1962_12, 1962, fase_grupos, inglaterra, argentina, 3, 1).
partido(m_1962_13, 1962, fase_grupos, union_sovietica, colombia, 4, 4).
partido(m_1962_14, 1962, fase_grupos, alemania_occidental, suiza, 2, 1).
partido(m_1962_15, 1962, fase_grupos, espana, mexico, 1, 0).
partido(m_1962_16, 1962, fase_grupos, hungria, bulgaria, 6, 1).
partido(m_1962_17, 1962, fase_grupos, union_sovietica, uruguay, 2, 1).
partido(m_1962_18, 1962, fase_grupos, alemania_occidental, chile, 2, 0).
partido(m_1962_19, 1962, fase_grupos, brasil, espana, 2, 1).
partido(m_1962_20, 1962, fase_grupos, hungria, argentina, 0, 0).
partido(m_1962_21, 1962, fase_grupos, yugoslavia, colombia, 5, 0).
partido(m_1962_22, 1962, fase_grupos, italia, suiza, 3, 0).
partido(m_1962_23, 1962, fase_grupos, mexico, checoslovaquia, 3, 1).
partido(m_1962_24, 1962, fase_grupos, inglaterra, bulgaria, 0, 0).
partido(m_1962_25, 1962, cuartos, brasil, inglaterra, 3, 1).
partido(m_1962_26, 1962, cuartos, chile, union_sovietica, 2, 1).
partido(m_1962_27, 1962, cuartos, checoslovaquia, hungria, 1, 0).
partido(m_1962_28, 1962, cuartos, yugoslavia, alemania_occidental, 1, 0).
partido(m_1962_29, 1962, semifinal, brasil, chile, 4, 2).
partido(m_1962_30, 1962, semifinal, checoslovaquia, yugoslavia, 3, 1).
partido(m_1962_31, 1962, tercer_puesto, chile, yugoslavia, 1, 0).
partido(m_1962_32, 1962, final, brasil, checoslovaquia, 3, 1).
partido(m_1966_01, 1966, fase_grupos, inglaterra, uruguay, 0, 0).
partido(m_1966_02, 1966, fase_grupos, alemania_occidental, suiza, 5, 0).
partido(m_1966_03, 1966, fase_grupos, brasil, bulgaria, 2, 0).
partido(m_1966_04, 1966, fase_grupos, union_sovietica, corea_del_norte, 3, 0).
partido(m_1966_05, 1966, fase_grupos, francia, mexico, 1, 1).
partido(m_1966_06, 1966, fase_grupos, argentina, espana, 2, 1).
partido(m_1966_07, 1966, fase_grupos, portugal, hungria, 3, 1).
partido(m_1966_08, 1966, fase_grupos, italia, chile, 2, 0).
partido(m_1966_09, 1966, fase_grupos, uruguay, francia, 2, 1).
partido(m_1966_10, 1966, fase_grupos, espana, suiza, 2, 1).
partido(m_1966_11, 1966, fase_grupos, hungria, brasil, 3, 1).
partido(m_1966_12, 1966, fase_grupos, chile, corea_del_norte, 1, 1).
partido(m_1966_13, 1966, fase_grupos, argentina, alemania_occidental, 0, 0).
partido(m_1966_14, 1966, fase_grupos, portugal, bulgaria, 3, 0).
partido(m_1966_15, 1966, fase_grupos, union_sovietica, italia, 1, 0).
partido(m_1966_16, 1966, fase_grupos, inglaterra, mexico, 2, 0).
partido(m_1966_17, 1966, fase_grupos, mexico, uruguay, 0, 0).
partido(m_1966_18, 1966, fase_grupos, argentina, suiza, 2, 0).
partido(m_1966_19, 1966, fase_grupos, portugal, brasil, 3, 1).
partido(m_1966_20, 1966, fase_grupos, corea_del_norte, italia, 1, 0).
partido(m_1966_21, 1966, fase_grupos, inglaterra, francia, 2, 0).
partido(m_1966_22, 1966, fase_grupos, alemania_occidental, espana, 2, 1).
partido(m_1966_23, 1966, fase_grupos, hungria, bulgaria, 3, 1).
partido(m_1966_24, 1966, fase_grupos, union_sovietica, chile, 2, 1).
partido(m_1966_25, 1966, cuartos, inglaterra, argentina, 1, 0).
partido(m_1966_26, 1966, cuartos, portugal, corea_del_norte, 5, 3).
partido(m_1966_27, 1966, cuartos, union_sovietica, hungria, 2, 1).
partido(m_1966_28, 1966, cuartos, alemania_occidental, uruguay, 4, 0).
partido(m_1966_29, 1966, semifinal, alemania_occidental, union_sovietica, 2, 1).
partido(m_1966_30, 1966, semifinal, inglaterra, portugal, 2, 1).
partido(m_1966_31, 1966, tercer_puesto, portugal, union_sovietica, 2, 1).
partido(m_1966_32, 1966, final, inglaterra, alemania_occidental, 4, 2).
partido(m_1970_01, 1970, fase_grupos, mexico, union_sovietica, 0, 0).
partido(m_1970_02, 1970, fase_grupos, uruguay, israel, 2, 0).
partido(m_1970_03, 1970, fase_grupos, inglaterra, rumania, 1, 0).
partido(m_1970_04, 1970, fase_grupos, peru, bulgaria, 3, 2).
partido(m_1970_05, 1970, fase_grupos, belgica, el_salvador, 3, 0).
partido(m_1970_06, 1970, fase_grupos, italia, suecia, 1, 0).
partido(m_1970_07, 1970, fase_grupos, brasil, checoslovaquia, 4, 1).
partido(m_1970_08, 1970, fase_grupos, alemania_occidental, marruecos, 2, 1).
partido(m_1970_09, 1970, fase_grupos, union_sovietica, belgica, 4, 1).
partido(m_1970_10, 1970, fase_grupos, uruguay, italia, 0, 0).
partido(m_1970_11, 1970, fase_grupos, rumania, checoslovaquia, 2, 1).
partido(m_1970_12, 1970, fase_grupos, peru, marruecos, 3, 0).
partido(m_1970_13, 1970, fase_grupos, mexico, el_salvador, 4, 0).
partido(m_1970_14, 1970, fase_grupos, suecia, israel, 1, 1).
partido(m_1970_15, 1970, fase_grupos, brasil, inglaterra, 1, 0).
partido(m_1970_16, 1970, fase_grupos, alemania_occidental, bulgaria, 5, 2).
partido(m_1970_17, 1970, fase_grupos, union_sovietica, el_salvador, 2, 0).
partido(m_1970_18, 1970, fase_grupos, suecia, uruguay, 1, 0).
partido(m_1970_19, 1970, fase_grupos, brasil, rumania, 3, 2).
partido(m_1970_20, 1970, fase_grupos, alemania_occidental, peru, 3, 1).
partido(m_1970_21, 1970, fase_grupos, mexico, belgica, 1, 0).
partido(m_1970_22, 1970, fase_grupos, italia, israel, 0, 0).
partido(m_1970_23, 1970, fase_grupos, inglaterra, checoslovaquia, 1, 0).
partido(m_1970_24, 1970, fase_grupos, bulgaria, marruecos, 1, 1).
partido(m_1970_25, 1970, cuartos, brasil, peru, 4, 2).
partido(m_1970_26, 1970, cuartos, italia, mexico, 4, 1).
partido(m_1970_27, 1970, cuartos, union_sovietica, uruguay, 0, 1).
partido(m_1970_28, 1970, cuartos, alemania_occidental, inglaterra, 3, 2).
partido(m_1970_29, 1970, semifinal, brasil, uruguay, 3, 1).
partido(m_1970_30, 1970, semifinal, italia, alemania_occidental, 4, 3).
partido(m_1970_31, 1970, tercer_puesto, alemania_occidental, uruguay, 1, 0).
partido(m_1970_32, 1970, final, brasil, italia, 4, 1).
partido(m_1974_01, 1974, fase_grupos, brasil, yugoslavia, 0, 0).
partido(m_1974_02, 1974, fase_grupos, alemania_occidental, chile, 1, 0).
partido(m_1974_03, 1974, fase_grupos, alemania_oriental, australia, 2, 0).
partido(m_1974_04, 1974, fase_grupos, zaire, escocia, 0, 2).
partido(m_1974_05, 1974, fase_grupos, suecia, bulgaria, 0, 0).
partido(m_1974_06, 1974, fase_grupos, uruguay, paises_bajos, 0, 2).
partido(m_1974_07, 1974, fase_grupos, italia, haiti, 3, 1).
partido(m_1974_08, 1974, fase_grupos, polonia, argentina, 3, 2).
partido(m_1974_09, 1974, fase_grupos, australia, alemania_occidental, 0, 3).
partido(m_1974_10, 1974, fase_grupos, chile, alemania_oriental, 1, 1).
partido(m_1974_11, 1974, fase_grupos, escocia, brasil, 0, 0).
partido(m_1974_12, 1974, fase_grupos, yugoslavia, zaire, 9, 0).
partido(m_1974_13, 1974, fase_grupos, bulgaria, uruguay, 1, 1).
partido(m_1974_14, 1974, fase_grupos, paises_bajos, suecia, 0, 0).
partido(m_1974_15, 1974, fase_grupos, argentina, italia, 1, 1).
partido(m_1974_16, 1974, fase_grupos, haiti, polonia, 0, 7).
partido(m_1974_17, 1974, fase_grupos, australia, chile, 0, 0).
partido(m_1974_18, 1974, fase_grupos, escocia, yugoslavia, 1, 1).
partido(m_1974_19, 1974, fase_grupos, zaire, brasil, 0, 3).
partido(m_1974_20, 1974, fase_grupos, alemania_oriental, alemania_occidental, 1, 0).
partido(m_1974_21, 1974, fase_grupos, bulgaria, paises_bajos, 1, 4).
partido(m_1974_22, 1974, fase_grupos, suecia, uruguay, 3, 0).
partido(m_1974_23, 1974, fase_grupos, argentina, haiti, 4, 1).
partido(m_1974_24, 1974, fase_grupos, polonia, italia, 2, 1).
partido(m_1974_25, 1974, segunda_fase_grupos, yugoslavia, alemania_occidental, 0, 2).
partido(m_1974_26, 1974, segunda_fase_grupos, brasil, alemania_oriental, 1, 0).
partido(m_1974_27, 1974, segunda_fase_grupos, paises_bajos, argentina, 4, 0).
partido(m_1974_28, 1974, segunda_fase_grupos, suecia, polonia, 0, 1).
partido(m_1974_29, 1974, segunda_fase_grupos, argentina, brasil, 1, 2).
partido(m_1974_30, 1974, segunda_fase_grupos, alemania_oriental, paises_bajos, 0, 2).
partido(m_1974_31, 1974, segunda_fase_grupos, polonia, yugoslavia, 2, 1).
partido(m_1974_32, 1974, segunda_fase_grupos, alemania_occidental, suecia, 4, 2).
partido(m_1974_33, 1974, segunda_fase_grupos, polonia, alemania_occidental, 0, 1).
partido(m_1974_34, 1974, segunda_fase_grupos, argentina, alemania_oriental, 1, 1).
partido(m_1974_35, 1974, segunda_fase_grupos, paises_bajos, brasil, 2, 0).
partido(m_1974_36, 1974, segunda_fase_grupos, suecia, yugoslavia, 2, 1).
partido(m_1974_37, 1974, tercer_puesto, brasil, polonia, 0, 1).
partido(m_1974_38, 1974, final, paises_bajos, alemania_occidental, 1, 2).
partido(m_1978_01, 1978, fase_grupos, alemania_occidental, polonia, 0, 0).
partido(m_1978_02, 1978, fase_grupos, italia, francia, 2, 1).
partido(m_1978_03, 1978, fase_grupos, tunez, mexico, 3, 1).
partido(m_1978_04, 1978, fase_grupos, argentina, hungria, 2, 1).
partido(m_1978_05, 1978, fase_grupos, austria, espana, 2, 1).
partido(m_1978_06, 1978, fase_grupos, brasil, suecia, 1, 1).
partido(m_1978_07, 1978, fase_grupos, paises_bajos, iran, 3, 0).
partido(m_1978_08, 1978, fase_grupos, peru, escocia, 3, 1).
partido(m_1978_09, 1978, fase_grupos, italia, hungria, 3, 1).
partido(m_1978_10, 1978, fase_grupos, polonia, tunez, 1, 0).
partido(m_1978_11, 1978, fase_grupos, alemania_occidental, mexico, 6, 0).
partido(m_1978_12, 1978, fase_grupos, argentina, francia, 2, 1).
partido(m_1978_13, 1978, fase_grupos, austria, suecia, 1, 0).
partido(m_1978_14, 1978, fase_grupos, brasil, espana, 0, 0).
partido(m_1978_15, 1978, fase_grupos, paises_bajos, peru, 0, 0).
partido(m_1978_16, 1978, fase_grupos, escocia, iran, 1, 1).
partido(m_1978_17, 1978, fase_grupos, francia, hungria, 3, 1).
partido(m_1978_18, 1978, fase_grupos, polonia, mexico, 3, 1).
partido(m_1978_19, 1978, fase_grupos, alemania_occidental, tunez, 0, 0).
partido(m_1978_20, 1978, fase_grupos, argentina, italia, 0, 1).
partido(m_1978_21, 1978, fase_grupos, brasil, austria, 1, 0).
partido(m_1978_22, 1978, fase_grupos, espana, suecia, 1, 0).
partido(m_1978_23, 1978, fase_grupos, peru, iran, 4, 1).
partido(m_1978_24, 1978, fase_grupos, escocia, paises_bajos, 3, 2).
partido(m_1978_25, 1978, segunda_fase_grupos, austria, paises_bajos, 1, 5).
partido(m_1978_26, 1978, segunda_fase_grupos, italia, alemania_occidental, 0, 0).
partido(m_1978_27, 1978, segunda_fase_grupos, brasil, peru, 3, 0).
partido(m_1978_28, 1978, segunda_fase_grupos, argentina, polonia, 2, 0).
partido(m_1978_29, 1978, segunda_fase_grupos, peru, polonia, 0, 1).
partido(m_1978_30, 1978, segunda_fase_grupos, italia, austria, 1, 0).
partido(m_1978_31, 1978, segunda_fase_grupos, paises_bajos, alemania_occidental, 2, 2).
partido(m_1978_32, 1978, segunda_fase_grupos, argentina, brasil, 0, 0).
partido(m_1978_33, 1978, segunda_fase_grupos, austria, alemania_occidental, 3, 2).
partido(m_1978_34, 1978, segunda_fase_grupos, italia, paises_bajos, 1, 2).
partido(m_1978_35, 1978, segunda_fase_grupos, brasil, polonia, 3, 1).
partido(m_1978_36, 1978, segunda_fase_grupos, argentina, peru, 6, 0).
partido(m_1978_37, 1978, tercer_puesto, brasil, italia, 2, 1).
partido(m_1978_38, 1978, final, argentina, paises_bajos, 3, 1).
partido(m_1982_01, 1982, fase_grupos, argentina, belgica, 0, 1).
partido(m_1982_02, 1982, fase_grupos, italia, polonia, 0, 0).
partido(m_1982_03, 1982, fase_grupos, brasil, union_sovietica, 2, 1).
partido(m_1982_04, 1982, fase_grupos, peru, camerun, 0, 0).
partido(m_1982_05, 1982, fase_grupos, hungria, el_salvador, 10, 1).
partido(m_1982_06, 1982, fase_grupos, escocia, nueva_zelanda, 5, 2).
partido(m_1982_07, 1982, fase_grupos, alemania_occidental, argelia, 1, 2).
partido(m_1982_08, 1982, fase_grupos, inglaterra, francia, 3, 1).
partido(m_1982_09, 1982, fase_grupos, espana, honduras, 1, 1).
partido(m_1982_10, 1982, fase_grupos, chile, austria, 0, 1).
partido(m_1982_11, 1982, fase_grupos, checoslovaquia, kuwait, 1, 1).
partido(m_1982_12, 1982, fase_grupos, yugoslavia, irlanda_del_norte, 0, 0).
partido(m_1982_13, 1982, fase_grupos, italia, peru, 1, 1).
partido(m_1982_14, 1982, fase_grupos, argentina, hungria, 4, 1).
partido(m_1982_15, 1982, fase_grupos, brasil, escocia, 4, 1).
partido(m_1982_16, 1982, fase_grupos, polonia, camerun, 0, 0).
partido(m_1982_17, 1982, fase_grupos, belgica, el_salvador, 1, 0).
partido(m_1982_18, 1982, fase_grupos, union_sovietica, nueva_zelanda, 3, 0).
partido(m_1982_19, 1982, fase_grupos, alemania_occidental, chile, 4, 1).
partido(m_1982_20, 1982, fase_grupos, inglaterra, checoslovaquia, 2, 0).
partido(m_1982_21, 1982, fase_grupos, espana, yugoslavia, 2, 1).
partido(m_1982_22, 1982, fase_grupos, argelia, austria, 0, 2).
partido(m_1982_23, 1982, fase_grupos, francia, kuwait, 4, 1).
partido(m_1982_24, 1982, fase_grupos, honduras, irlanda_del_norte, 1, 1).
partido(m_1982_25, 1982, fase_grupos, polonia, peru, 5, 1).
partido(m_1982_26, 1982, fase_grupos, belgica, hungria, 1, 1).
partido(m_1982_27, 1982, fase_grupos, union_sovietica, escocia, 2, 2).
partido(m_1982_28, 1982, fase_grupos, italia, camerun, 1, 1).
partido(m_1982_29, 1982, fase_grupos, argentina, el_salvador, 2, 0).
partido(m_1982_30, 1982, fase_grupos, brasil, nueva_zelanda, 4, 0).
partido(m_1982_31, 1982, fase_grupos, argelia, chile, 3, 2).
partido(m_1982_32, 1982, fase_grupos, francia, checoslovaquia, 1, 1).
partido(m_1982_33, 1982, fase_grupos, honduras, yugoslavia, 0, 1).
partido(m_1982_34, 1982, fase_grupos, alemania_occidental, austria, 1, 0).
partido(m_1982_35, 1982, fase_grupos, inglaterra, kuwait, 1, 0).
partido(m_1982_36, 1982, fase_grupos, espana, irlanda_del_norte, 0, 1).
partido(m_1982_37, 1982, segunda_fase_grupos, austria, francia, 0, 1).
partido(m_1982_38, 1982, segunda_fase_grupos, polonia, belgica, 3, 0).
partido(m_1982_39, 1982, segunda_fase_grupos, italia, argentina, 2, 1).
partido(m_1982_40, 1982, segunda_fase_grupos, alemania_occidental, inglaterra, 0, 0).
partido(m_1982_41, 1982, segunda_fase_grupos, austria, irlanda_del_norte, 2, 2).
partido(m_1982_42, 1982, segunda_fase_grupos, belgica, union_sovietica, 0, 1).
partido(m_1982_43, 1982, segunda_fase_grupos, argentina, brasil, 1, 3).
partido(m_1982_44, 1982, segunda_fase_grupos, alemania_occidental, espana, 2, 1).
partido(m_1982_45, 1982, segunda_fase_grupos, francia, irlanda_del_norte, 4, 1).
partido(m_1982_46, 1982, segunda_fase_grupos, union_sovietica, polonia, 0, 0).
partido(m_1982_47, 1982, segunda_fase_grupos, italia, brasil, 3, 2).
partido(m_1982_48, 1982, segunda_fase_grupos, espana, inglaterra, 0, 0).
partido(m_1982_49, 1982, semifinal, polonia, italia, 0, 2).
partido(m_1982_50, 1982, semifinal, alemania_occidental, francia, 3, 3).
partido(m_1982_51, 1982, tercer_puesto, polonia, francia, 3, 2).
partido(m_1982_52, 1982, final, italia, alemania_occidental, 3, 1).
partido(m_1986_01, 1986, fase_grupos, bulgaria, italia, 1, 1).
partido(m_1986_02, 1986, fase_grupos, espana, brasil, 0, 1).
partido(m_1986_03, 1986, fase_grupos, canada, francia, 0, 1).
partido(m_1986_04, 1986, fase_grupos, argentina, corea_del_sur, 3, 1).
partido(m_1986_05, 1986, fase_grupos, union_sovietica, hungria, 6, 0).
partido(m_1986_06, 1986, fase_grupos, marruecos, polonia, 0, 0).
partido(m_1986_07, 1986, fase_grupos, belgica, mexico, 1, 2).
partido(m_1986_08, 1986, fase_grupos, argelia, irlanda_del_norte, 1, 1).
partido(m_1986_09, 1986, fase_grupos, portugal, inglaterra, 1, 0).
partido(m_1986_10, 1986, fase_grupos, paraguay, irak, 1, 0).
partido(m_1986_11, 1986, fase_grupos, uruguay, alemania_occidental, 1, 1).
partido(m_1986_12, 1986, fase_grupos, escocia, dinamarca, 0, 1).
partido(m_1986_13, 1986, fase_grupos, italia, argentina, 1, 1).
partido(m_1986_14, 1986, fase_grupos, francia, union_sovietica, 1, 1).
partido(m_1986_15, 1986, fase_grupos, corea_del_sur, bulgaria, 1, 1).
partido(m_1986_16, 1986, fase_grupos, hungria, canada, 2, 0).
partido(m_1986_17, 1986, fase_grupos, brasil, argelia, 1, 0).
partido(m_1986_18, 1986, fase_grupos, inglaterra, marruecos, 0, 0).
partido(m_1986_19, 1986, fase_grupos, mexico, paraguay, 1, 1).
partido(m_1986_20, 1986, fase_grupos, irlanda_del_norte, espana, 1, 2).
partido(m_1986_21, 1986, fase_grupos, polonia, portugal, 1, 0).
partido(m_1986_22, 1986, fase_grupos, irak, belgica, 1, 2).
partido(m_1986_23, 1986, fase_grupos, alemania_occidental, escocia, 2, 1).
partido(m_1986_24, 1986, fase_grupos, dinamarca, uruguay, 6, 1).
partido(m_1986_25, 1986, fase_grupos, hungria, francia, 0, 3).
partido(m_1986_26, 1986, fase_grupos, union_sovietica, canada, 2, 0).
partido(m_1986_27, 1986, fase_grupos, argentina, bulgaria, 2, 0).
partido(m_1986_28, 1986, fase_grupos, corea_del_sur, italia, 2, 3).
partido(m_1986_29, 1986, fase_grupos, irak, mexico, 0, 1).
partido(m_1986_30, 1986, fase_grupos, paraguay, belgica, 2, 2).
partido(m_1986_31, 1986, fase_grupos, inglaterra, polonia, 3, 0).
partido(m_1986_32, 1986, fase_grupos, portugal, marruecos, 1, 3).
partido(m_1986_33, 1986, fase_grupos, argelia, espana, 0, 3).
partido(m_1986_34, 1986, fase_grupos, irlanda_del_norte, brasil, 0, 3).
partido(m_1986_35, 1986, fase_grupos, dinamarca, alemania_occidental, 2, 0).
partido(m_1986_36, 1986, fase_grupos, escocia, uruguay, 0, 0).
partido(m_1986_37, 1986, octavos, mexico, bulgaria, 2, 0).
partido(m_1986_38, 1986, octavos, union_sovietica, belgica, 3, 4).
partido(m_1986_39, 1986, octavos, brasil, polonia, 4, 0).
partido(m_1986_40, 1986, octavos, argentina, uruguay, 1, 0).
partido(m_1986_41, 1986, octavos, italia, francia, 0, 2).
partido(m_1986_42, 1986, octavos, marruecos, alemania_occidental, 0, 1).
partido(m_1986_43, 1986, octavos, inglaterra, paraguay, 3, 0).
partido(m_1986_44, 1986, octavos, dinamarca, espana, 1, 5).
partido(m_1986_45, 1986, cuartos, brasil, francia, 1, 1).
partido(m_1986_46, 1986, cuartos, alemania_occidental, mexico, 0, 0).
partido(m_1986_47, 1986, cuartos, argentina, inglaterra, 2, 1).
partido(m_1986_48, 1986, cuartos, espana, belgica, 1, 1).
partido(m_1986_49, 1986, semifinal, francia, alemania_occidental, 0, 2).
partido(m_1986_50, 1986, semifinal, argentina, belgica, 2, 0).
partido(m_1986_51, 1986, tercer_puesto, belgica, francia, 2, 4).
partido(m_1986_52, 1986, final, argentina, alemania_occidental, 3, 2).
partido(m_1990_01, 1990, fase_grupos, argentina, camerun, 0, 1).
partido(m_1990_02, 1990, fase_grupos, union_sovietica, rumania, 0, 2).
partido(m_1990_03, 1990, fase_grupos, emiratos_arabes_unidos, colombia, 0, 2).
partido(m_1990_04, 1990, fase_grupos, italia, austria, 1, 0).
partido(m_1990_05, 1990, fase_grupos, estados_unidos, checoslovaquia, 1, 5).
partido(m_1990_06, 1990, fase_grupos, brasil, suecia, 2, 1).
partido(m_1990_07, 1990, fase_grupos, alemania_occidental, yugoslavia, 4, 1).
partido(m_1990_08, 1990, fase_grupos, costa_rica, escocia, 1, 0).
partido(m_1990_09, 1990, fase_grupos, inglaterra, irlanda, 1, 1).
partido(m_1990_10, 1990, fase_grupos, belgica, corea_del_sur, 2, 0).
partido(m_1990_11, 1990, fase_grupos, paises_bajos, egipto, 1, 1).
partido(m_1990_12, 1990, fase_grupos, uruguay, espana, 0, 0).
partido(m_1990_13, 1990, fase_grupos, argentina, union_sovietica, 2, 0).
partido(m_1990_14, 1990, fase_grupos, camerun, rumania, 2, 1).
partido(m_1990_15, 1990, fase_grupos, yugoslavia, colombia, 1, 0).
partido(m_1990_16, 1990, fase_grupos, italia, estados_unidos, 1, 0).
partido(m_1990_17, 1990, fase_grupos, austria, checoslovaquia, 0, 1).
partido(m_1990_18, 1990, fase_grupos, alemania_occidental, emiratos_arabes_unidos, 5, 1).
partido(m_1990_19, 1990, fase_grupos, brasil, costa_rica, 1, 0).
partido(m_1990_20, 1990, fase_grupos, suecia, escocia, 1, 2).
partido(m_1990_21, 1990, fase_grupos, inglaterra, paises_bajos, 0, 0).
partido(m_1990_22, 1990, fase_grupos, irlanda, egipto, 0, 0).
partido(m_1990_23, 1990, fase_grupos, belgica, uruguay, 3, 1).
partido(m_1990_24, 1990, fase_grupos, corea_del_sur, espana, 1, 3).
partido(m_1990_25, 1990, fase_grupos, argentina, rumania, 1, 1).
partido(m_1990_26, 1990, fase_grupos, camerun, union_sovietica, 0, 4).
partido(m_1990_27, 1990, fase_grupos, alemania_occidental, colombia, 1, 1).
partido(m_1990_28, 1990, fase_grupos, yugoslavia, emiratos_arabes_unidos, 4, 1).
partido(m_1990_29, 1990, fase_grupos, austria, estados_unidos, 2, 1).
partido(m_1990_30, 1990, fase_grupos, italia, checoslovaquia, 2, 0).
partido(m_1990_31, 1990, fase_grupos, brasil, escocia, 1, 0).
partido(m_1990_32, 1990, fase_grupos, suecia, costa_rica, 1, 2).
partido(m_1990_33, 1990, fase_grupos, belgica, espana, 1, 2).
partido(m_1990_34, 1990, fase_grupos, corea_del_sur, uruguay, 0, 1).
partido(m_1990_35, 1990, fase_grupos, inglaterra, egipto, 1, 0).
partido(m_1990_36, 1990, fase_grupos, irlanda, paises_bajos, 1, 1).
partido(m_1990_37, 1990, octavos, camerun, colombia, 2, 1).
partido(m_1990_38, 1990, octavos, checoslovaquia, costa_rica, 4, 1).
partido(m_1990_39, 1990, octavos, brasil, argentina, 0, 1).
partido(m_1990_40, 1990, octavos, alemania_occidental, paises_bajos, 2, 1).
partido(m_1990_41, 1990, octavos, irlanda, rumania, 0, 0).
partido(m_1990_42, 1990, octavos, italia, uruguay, 2, 0).
partido(m_1990_43, 1990, octavos, espana, yugoslavia, 1, 2).
partido(m_1990_44, 1990, octavos, inglaterra, belgica, 1, 0).
partido(m_1990_45, 1990, cuartos, argentina, yugoslavia, 0, 0).
partido(m_1990_46, 1990, cuartos, irlanda, italia, 0, 1).
partido(m_1990_47, 1990, cuartos, checoslovaquia, alemania_occidental, 0, 1).
partido(m_1990_48, 1990, cuartos, camerun, inglaterra, 2, 3).
partido(m_1990_49, 1990, semifinal, argentina, italia, 1, 1).
partido(m_1990_50, 1990, semifinal, alemania_occidental, inglaterra, 1, 1).
partido(m_1990_51, 1990, tercer_puesto, italia, inglaterra, 2, 1).
partido(m_1990_52, 1990, final, alemania_occidental, argentina, 1, 0).
partido(m_1994_01, 1994, fase_grupos, alemania, bolivia, 1, 0).
partido(m_1994_02, 1994, fase_grupos, espana, corea_del_sur, 2, 2).
partido(m_1994_03, 1994, fase_grupos, estados_unidos, suiza, 1, 1).
partido(m_1994_04, 1994, fase_grupos, italia, irlanda, 0, 1).
partido(m_1994_05, 1994, fase_grupos, colombia, rumania, 1, 3).
partido(m_1994_06, 1994, fase_grupos, belgica, marruecos, 1, 0).
partido(m_1994_07, 1994, fase_grupos, noruega, mexico, 1, 0).
partido(m_1994_08, 1994, fase_grupos, camerun, suecia, 2, 2).
partido(m_1994_09, 1994, fase_grupos, brasil, rusia, 2, 0).
partido(m_1994_10, 1994, fase_grupos, paises_bajos, arabia_saudita, 2, 1).
partido(m_1994_11, 1994, fase_grupos, argentina, grecia, 4, 0).
partido(m_1994_12, 1994, fase_grupos, alemania, espana, 1, 1).
partido(m_1994_13, 1994, fase_grupos, nigeria, bulgaria, 3, 0).
partido(m_1994_14, 1994, fase_grupos, rumania, suiza, 1, 4).
partido(m_1994_15, 1994, fase_grupos, estados_unidos, colombia, 2, 1).
partido(m_1994_16, 1994, fase_grupos, italia, noruega, 1, 0).
partido(m_1994_17, 1994, fase_grupos, corea_del_sur, bolivia, 0, 0).
partido(m_1994_18, 1994, fase_grupos, mexico, irlanda, 2, 1).
partido(m_1994_19, 1994, fase_grupos, brasil, camerun, 3, 0).
partido(m_1994_20, 1994, fase_grupos, suecia, rusia, 3, 1).
partido(m_1994_21, 1994, fase_grupos, belgica, paises_bajos, 1, 0).
partido(m_1994_22, 1994, fase_grupos, arabia_saudita, marruecos, 2, 1).
partido(m_1994_23, 1994, fase_grupos, argentina, nigeria, 2, 1).
partido(m_1994_24, 1994, fase_grupos, bulgaria, grecia, 4, 0).
partido(m_1994_25, 1994, fase_grupos, suiza, colombia, 0, 2).
partido(m_1994_26, 1994, fase_grupos, estados_unidos, rumania, 0, 1).
partido(m_1994_27, 1994, fase_grupos, bolivia, espana, 1, 3).
partido(m_1994_28, 1994, fase_grupos, alemania, corea_del_sur, 3, 2).
partido(m_1994_29, 1994, fase_grupos, italia, mexico, 1, 1).
partido(m_1994_30, 1994, fase_grupos, irlanda, noruega, 0, 0).
partido(m_1994_31, 1994, fase_grupos, rusia, camerun, 6, 1).
partido(m_1994_32, 1994, fase_grupos, brasil, suecia, 1, 1).
partido(m_1994_33, 1994, fase_grupos, belgica, arabia_saudita, 0, 1).
partido(m_1994_34, 1994, fase_grupos, marruecos, paises_bajos, 1, 2).
partido(m_1994_35, 1994, fase_grupos, argentina, bulgaria, 0, 2).
partido(m_1994_36, 1994, fase_grupos, grecia, nigeria, 0, 2).
partido(m_1994_37, 1994, octavos, alemania, belgica, 3, 2).
partido(m_1994_38, 1994, octavos, espana, suiza, 3, 0).
partido(m_1994_39, 1994, octavos, arabia_saudita, suecia, 1, 3).
partido(m_1994_40, 1994, octavos, rumania, argentina, 3, 2).
partido(m_1994_41, 1994, octavos, paises_bajos, irlanda, 2, 0).
partido(m_1994_42, 1994, octavos, brasil, estados_unidos, 1, 0).
partido(m_1994_43, 1994, octavos, nigeria, italia, 1, 2).
partido(m_1994_44, 1994, octavos, mexico, bulgaria, 1, 1).
partido(m_1994_45, 1994, cuartos, italia, espana, 2, 1).
partido(m_1994_46, 1994, cuartos, paises_bajos, brasil, 2, 3).
partido(m_1994_47, 1994, cuartos, bulgaria, alemania, 2, 1).
partido(m_1994_48, 1994, cuartos, rumania, suecia, 2, 2).
partido(m_1994_49, 1994, semifinal, bulgaria, italia, 1, 2).
partido(m_1994_50, 1994, semifinal, suecia, brasil, 0, 1).
partido(m_1994_51, 1994, tercer_puesto, suecia, bulgaria, 4, 0).
partido(m_1994_52, 1994, final, brasil, italia, 0, 0).
partido(m_1998_01, 1998, fase_grupos, brasil, escocia, 2, 1).
partido(m_1998_02, 1998, fase_grupos, marruecos, noruega, 2, 2).
partido(m_1998_03, 1998, fase_grupos, italia, chile, 2, 2).
partido(m_1998_04, 1998, fase_grupos, camerun, austria, 1, 1).
partido(m_1998_05, 1998, fase_grupos, paraguay, bulgaria, 0, 0).
partido(m_1998_06, 1998, fase_grupos, arabia_saudita, dinamarca, 0, 1).
partido(m_1998_07, 1998, fase_grupos, francia, sudafrica, 3, 0).
partido(m_1998_08, 1998, fase_grupos, espana, nigeria, 2, 3).
partido(m_1998_09, 1998, fase_grupos, corea_del_sur, mexico, 1, 3).
partido(m_1998_10, 1998, fase_grupos, paises_bajos, belgica, 0, 0).
partido(m_1998_11, 1998, fase_grupos, argentina, japon, 1, 0).
partido(m_1998_12, 1998, fase_grupos, yugoslavia, iran, 1, 0).
partido(m_1998_13, 1998, fase_grupos, jamaica, croacia, 1, 3).
partido(m_1998_14, 1998, fase_grupos, inglaterra, tunez, 2, 0).
partido(m_1998_15, 1998, fase_grupos, rumania, colombia, 1, 0).
partido(m_1998_16, 1998, fase_grupos, alemania, estados_unidos, 2, 0).
partido(m_1998_17, 1998, fase_grupos, escocia, noruega, 1, 1).
partido(m_1998_18, 1998, fase_grupos, brasil, marruecos, 3, 0).
partido(m_1998_19, 1998, fase_grupos, chile, austria, 1, 1).
partido(m_1998_20, 1998, fase_grupos, italia, camerun, 3, 0).
partido(m_1998_21, 1998, fase_grupos, sudafrica, dinamarca, 1, 1).
partido(m_1998_22, 1998, fase_grupos, francia, arabia_saudita, 4, 0).
partido(m_1998_23, 1998, fase_grupos, nigeria, bulgaria, 1, 0).
partido(m_1998_24, 1998, fase_grupos, espana, paraguay, 0, 0).
partido(m_1998_25, 1998, fase_grupos, japon, croacia, 0, 1).
partido(m_1998_26, 1998, fase_grupos, belgica, mexico, 2, 2).
partido(m_1998_27, 1998, fase_grupos, paises_bajos, corea_del_sur, 5, 0).
partido(m_1998_28, 1998, fase_grupos, alemania, yugoslavia, 2, 2).
partido(m_1998_29, 1998, fase_grupos, argentina, jamaica, 5, 0).
partido(m_1998_30, 1998, fase_grupos, estados_unidos, iran, 1, 2).
partido(m_1998_31, 1998, fase_grupos, colombia, tunez, 1, 0).
partido(m_1998_32, 1998, fase_grupos, rumania, inglaterra, 2, 1).
partido(m_1998_33, 1998, fase_grupos, chile, camerun, 1, 1).
partido(m_1998_34, 1998, fase_grupos, italia, austria, 2, 1).
partido(m_1998_35, 1998, fase_grupos, brasil, noruega, 1, 2).
partido(m_1998_36, 1998, fase_grupos, escocia, marruecos, 0, 3).
partido(m_1998_37, 1998, fase_grupos, francia, dinamarca, 2, 1).
partido(m_1998_38, 1998, fase_grupos, sudafrica, arabia_saudita, 2, 2).
partido(m_1998_39, 1998, fase_grupos, nigeria, paraguay, 1, 3).
partido(m_1998_40, 1998, fase_grupos, espana, bulgaria, 6, 1).
partido(m_1998_41, 1998, fase_grupos, belgica, corea_del_sur, 1, 1).
partido(m_1998_42, 1998, fase_grupos, paises_bajos, mexico, 2, 2).
partido(m_1998_43, 1998, fase_grupos, alemania, iran, 2, 0).
partido(m_1998_44, 1998, fase_grupos, estados_unidos, yugoslavia, 0, 1).
partido(m_1998_45, 1998, fase_grupos, argentina, croacia, 1, 0).
partido(m_1998_46, 1998, fase_grupos, japon, jamaica, 1, 2).
partido(m_1998_47, 1998, fase_grupos, colombia, inglaterra, 0, 2).
partido(m_1998_48, 1998, fase_grupos, rumania, tunez, 1, 1).
partido(m_1998_49, 1998, octavos, italia, noruega, 1, 0).
partido(m_1998_50, 1998, octavos, brasil, chile, 4, 1).
partido(m_1998_51, 1998, octavos, francia, paraguay, 1, 0).
partido(m_1998_52, 1998, octavos, nigeria, dinamarca, 1, 4).
partido(m_1998_53, 1998, octavos, alemania, mexico, 2, 1).
partido(m_1998_54, 1998, octavos, paises_bajos, yugoslavia, 2, 1).
partido(m_1998_55, 1998, octavos, rumania, croacia, 0, 1).
partido(m_1998_56, 1998, octavos, argentina, inglaterra, 2, 2).
partido(m_1998_57, 1998, cuartos, italia, francia, 0, 0).
partido(m_1998_58, 1998, cuartos, brasil, dinamarca, 3, 2).
partido(m_1998_59, 1998, cuartos, paises_bajos, argentina, 2, 1).
partido(m_1998_60, 1998, cuartos, alemania, croacia, 0, 3).
partido(m_1998_61, 1998, semifinal, brasil, paises_bajos, 1, 1).
partido(m_1998_62, 1998, semifinal, francia, croacia, 2, 1).
partido(m_1998_63, 1998, tercer_puesto, paises_bajos, croacia, 1, 2).
partido(m_1998_64, 1998, final, brasil, francia, 0, 3).
partido(m_2002_01, 2002, fase_grupos, francia, senegal, 0, 1).
partido(m_2002_02, 2002, fase_grupos, irlanda, camerun, 1, 1).
partido(m_2002_03, 2002, fase_grupos, uruguay, dinamarca, 1, 2).
partido(m_2002_04, 2002, fase_grupos, alemania, arabia_saudita, 8, 0).
partido(m_2002_05, 2002, fase_grupos, argentina, nigeria, 1, 0).
partido(m_2002_06, 2002, fase_grupos, paraguay, sudafrica, 2, 2).
partido(m_2002_07, 2002, fase_grupos, inglaterra, suecia, 1, 1).
partido(m_2002_08, 2002, fase_grupos, espana, eslovenia, 3, 1).
partido(m_2002_09, 2002, fase_grupos, croacia, mexico, 0, 1).
partido(m_2002_10, 2002, fase_grupos, brasil, turquia, 2, 1).
partido(m_2002_11, 2002, fase_grupos, italia, ecuador, 2, 0).
partido(m_2002_12, 2002, fase_grupos, china, costa_rica, 0, 2).
partido(m_2002_13, 2002, fase_grupos, japon, belgica, 2, 2).
partido(m_2002_14, 2002, fase_grupos, corea_del_sur, polonia, 2, 0).
partido(m_2002_15, 2002, fase_grupos, rusia, tunez, 2, 0).
partido(m_2002_16, 2002, fase_grupos, estados_unidos, portugal, 3, 2).
partido(m_2002_17, 2002, fase_grupos, alemania, irlanda, 1, 1).
partido(m_2002_18, 2002, fase_grupos, dinamarca, senegal, 1, 1).
partido(m_2002_19, 2002, fase_grupos, camerun, arabia_saudita, 1, 0).
partido(m_2002_20, 2002, fase_grupos, francia, uruguay, 0, 0).
partido(m_2002_21, 2002, fase_grupos, suecia, nigeria, 2, 1).
partido(m_2002_22, 2002, fase_grupos, espana, paraguay, 3, 1).
partido(m_2002_23, 2002, fase_grupos, argentina, inglaterra, 0, 1).
partido(m_2002_24, 2002, fase_grupos, sudafrica, eslovenia, 1, 0).
partido(m_2002_25, 2002, fase_grupos, italia, croacia, 1, 2).
partido(m_2002_26, 2002, fase_grupos, brasil, china, 4, 0).
partido(m_2002_27, 2002, fase_grupos, mexico, ecuador, 2, 1).
partido(m_2002_28, 2002, fase_grupos, costa_rica, turquia, 1, 1).
partido(m_2002_29, 2002, fase_grupos, japon, rusia, 1, 0).
partido(m_2002_30, 2002, fase_grupos, corea_del_sur, estados_unidos, 1, 1).
partido(m_2002_31, 2002, fase_grupos, tunez, belgica, 1, 1).
partido(m_2002_32, 2002, fase_grupos, portugal, polonia, 4, 0).
partido(m_2002_33, 2002, fase_grupos, dinamarca, francia, 2, 0).
partido(m_2002_34, 2002, fase_grupos, senegal, uruguay, 3, 3).
partido(m_2002_35, 2002, fase_grupos, camerun, alemania, 0, 2).
partido(m_2002_36, 2002, fase_grupos, arabia_saudita, irlanda, 0, 3).
partido(m_2002_37, 2002, fase_grupos, nigeria, inglaterra, 0, 0).
partido(m_2002_38, 2002, fase_grupos, suecia, argentina, 1, 1).
partido(m_2002_39, 2002, fase_grupos, eslovenia, paraguay, 1, 3).
partido(m_2002_40, 2002, fase_grupos, sudafrica, espana, 2, 3).
partido(m_2002_41, 2002, fase_grupos, costa_rica, brasil, 2, 5).
partido(m_2002_42, 2002, fase_grupos, turquia, china, 3, 0).
partido(m_2002_43, 2002, fase_grupos, ecuador, croacia, 1, 0).
partido(m_2002_44, 2002, fase_grupos, mexico, italia, 1, 1).
partido(m_2002_45, 2002, fase_grupos, belgica, rusia, 3, 2).
partido(m_2002_46, 2002, fase_grupos, tunez, japon, 0, 2).
partido(m_2002_47, 2002, fase_grupos, polonia, estados_unidos, 3, 1).
partido(m_2002_48, 2002, fase_grupos, portugal, corea_del_sur, 0, 1).
partido(m_2002_49, 2002, octavos, alemania, paraguay, 1, 0).
partido(m_2002_50, 2002, octavos, dinamarca, inglaterra, 0, 3).
partido(m_2002_51, 2002, octavos, suecia, senegal, 1, 2).
partido(m_2002_52, 2002, octavos, espana, irlanda, 1, 1).
partido(m_2002_53, 2002, octavos, mexico, estados_unidos, 0, 2).
partido(m_2002_54, 2002, octavos, brasil, belgica, 2, 0).
partido(m_2002_55, 2002, octavos, japon, turquia, 0, 1).
partido(m_2002_56, 2002, octavos, corea_del_sur, italia, 2, 1).
partido(m_2002_57, 2002, cuartos, inglaterra, brasil, 1, 2).
partido(m_2002_58, 2002, cuartos, alemania, estados_unidos, 1, 0).
partido(m_2002_59, 2002, cuartos, espana, corea_del_sur, 0, 0).
partido(m_2002_60, 2002, cuartos, senegal, turquia, 0, 1).
partido(m_2002_61, 2002, semifinal, alemania, corea_del_sur, 1, 0).
partido(m_2002_62, 2002, semifinal, brasil, turquia, 1, 0).
partido(m_2002_63, 2002, tercer_puesto, corea_del_sur, turquia, 2, 3).
partido(m_2002_64, 2002, final, alemania, brasil, 0, 2).
partido(m_2006_01, 2006, fase_grupos, alemania, costa_rica, 4, 2).
partido(m_2006_02, 2006, fase_grupos, polonia, ecuador, 0, 2).
partido(m_2006_03, 2006, fase_grupos, inglaterra, paraguay, 1, 0).
partido(m_2006_04, 2006, fase_grupos, trinidad_y_tobago, suecia, 0, 0).
partido(m_2006_05, 2006, fase_grupos, argentina, costa_de_marfil, 2, 1).
partido(m_2006_06, 2006, fase_grupos, serbia_y_montenegro, paises_bajos, 0, 1).
partido(m_2006_07, 2006, fase_grupos, mexico, iran, 3, 1).
partido(m_2006_08, 2006, fase_grupos, angola, portugal, 0, 1).
partido(m_2006_09, 2006, fase_grupos, australia, japon, 3, 1).
partido(m_2006_10, 2006, fase_grupos, estados_unidos, republica_checa, 0, 3).
partido(m_2006_11, 2006, fase_grupos, italia, ghana, 2, 0).
partido(m_2006_12, 2006, fase_grupos, corea_del_sur, togo, 2, 1).
partido(m_2006_13, 2006, fase_grupos, francia, suiza, 0, 0).
partido(m_2006_14, 2006, fase_grupos, brasil, croacia, 1, 0).
partido(m_2006_15, 2006, fase_grupos, espana, ucrania, 4, 0).
partido(m_2006_16, 2006, fase_grupos, tunez, arabia_saudita, 2, 2).
partido(m_2006_17, 2006, fase_grupos, alemania, polonia, 1, 0).
partido(m_2006_18, 2006, fase_grupos, ecuador, costa_rica, 3, 0).
partido(m_2006_19, 2006, fase_grupos, inglaterra, trinidad_y_tobago, 2, 0).
partido(m_2006_20, 2006, fase_grupos, suecia, paraguay, 1, 0).
partido(m_2006_21, 2006, fase_grupos, argentina, serbia_y_montenegro, 6, 0).
partido(m_2006_22, 2006, fase_grupos, paises_bajos, costa_de_marfil, 2, 1).
partido(m_2006_23, 2006, fase_grupos, mexico, angola, 0, 0).
partido(m_2006_24, 2006, fase_grupos, portugal, iran, 2, 0).
partido(m_2006_25, 2006, fase_grupos, republica_checa, ghana, 0, 2).
partido(m_2006_26, 2006, fase_grupos, italia, estados_unidos, 1, 1).
partido(m_2006_27, 2006, fase_grupos, japon, croacia, 0, 0).
partido(m_2006_28, 2006, fase_grupos, brasil, australia, 2, 0).
partido(m_2006_29, 2006, fase_grupos, francia, corea_del_sur, 1, 1).
partido(m_2006_30, 2006, fase_grupos, togo, suiza, 0, 2).
partido(m_2006_31, 2006, fase_grupos, arabia_saudita, ucrania, 0, 4).
partido(m_2006_32, 2006, fase_grupos, espana, tunez, 3, 1).
partido(m_2006_33, 2006, fase_grupos, costa_rica, polonia, 1, 2).
partido(m_2006_34, 2006, fase_grupos, ecuador, alemania, 0, 3).
partido(m_2006_35, 2006, fase_grupos, paraguay, trinidad_y_tobago, 2, 0).
partido(m_2006_36, 2006, fase_grupos, suecia, inglaterra, 2, 2).
partido(m_2006_37, 2006, fase_grupos, iran, angola, 1, 1).
partido(m_2006_38, 2006, fase_grupos, portugal, mexico, 2, 1).
partido(m_2006_39, 2006, fase_grupos, costa_de_marfil, serbia_y_montenegro, 3, 2).
partido(m_2006_40, 2006, fase_grupos, paises_bajos, argentina, 0, 0).
partido(m_2006_41, 2006, fase_grupos, republica_checa, italia, 0, 2).
partido(m_2006_42, 2006, fase_grupos, ghana, estados_unidos, 2, 1).
partido(m_2006_43, 2006, fase_grupos, croacia, australia, 2, 2).
partido(m_2006_44, 2006, fase_grupos, japon, brasil, 1, 4).
partido(m_2006_45, 2006, fase_grupos, arabia_saudita, espana, 0, 1).
partido(m_2006_46, 2006, fase_grupos, ucrania, tunez, 1, 0).
partido(m_2006_47, 2006, fase_grupos, suiza, corea_del_sur, 2, 0).
partido(m_2006_48, 2006, fase_grupos, togo, francia, 0, 2).
partido(m_2006_49, 2006, octavos, alemania, suecia, 2, 0).
partido(m_2006_50, 2006, octavos, argentina, mexico, 2, 1).
partido(m_2006_51, 2006, octavos, inglaterra, ecuador, 1, 0).
partido(m_2006_52, 2006, octavos, portugal, paises_bajos, 1, 0).
partido(m_2006_53, 2006, octavos, italia, australia, 1, 0).
partido(m_2006_54, 2006, octavos, suiza, ucrania, 0, 0).
partido(m_2006_55, 2006, octavos, brasil, ghana, 3, 0).
partido(m_2006_56, 2006, octavos, espana, francia, 1, 3).
partido(m_2006_57, 2006, cuartos, alemania, argentina, 1, 1).
partido(m_2006_58, 2006, cuartos, italia, ucrania, 3, 0).
partido(m_2006_59, 2006, cuartos, inglaterra, portugal, 0, 0).
partido(m_2006_60, 2006, cuartos, brasil, francia, 0, 1).
partido(m_2006_61, 2006, semifinal, alemania, italia, 0, 2).
partido(m_2006_62, 2006, semifinal, portugal, francia, 0, 1).
partido(m_2006_63, 2006, tercer_puesto, alemania, portugal, 3, 1).
partido(m_2006_64, 2006, final, italia, francia, 1, 1).
partido(m_2010_01, 2010, fase_grupos, sudafrica, mexico, 1, 1).
partido(m_2010_02, 2010, fase_grupos, uruguay, francia, 0, 0).
partido(m_2010_03, 2010, fase_grupos, corea_del_sur, grecia, 2, 0).
partido(m_2010_04, 2010, fase_grupos, argentina, nigeria, 1, 0).
partido(m_2010_05, 2010, fase_grupos, inglaterra, estados_unidos, 1, 1).
partido(m_2010_06, 2010, fase_grupos, argelia, eslovenia, 0, 1).
partido(m_2010_07, 2010, fase_grupos, serbia, ghana, 0, 1).
partido(m_2010_08, 2010, fase_grupos, alemania, australia, 4, 0).
partido(m_2010_09, 2010, fase_grupos, paises_bajos, dinamarca, 2, 0).
partido(m_2010_10, 2010, fase_grupos, japon, camerun, 1, 0).
partido(m_2010_11, 2010, fase_grupos, italia, paraguay, 1, 1).
partido(m_2010_12, 2010, fase_grupos, nueva_zelanda, eslovaquia, 1, 1).
partido(m_2010_13, 2010, fase_grupos, costa_de_marfil, portugal, 0, 0).
partido(m_2010_14, 2010, fase_grupos, brasil, corea_del_norte, 2, 1).
partido(m_2010_15, 2010, fase_grupos, honduras, chile, 0, 1).
partido(m_2010_16, 2010, fase_grupos, espana, suiza, 0, 1).
partido(m_2010_17, 2010, fase_grupos, sudafrica, uruguay, 0, 3).
partido(m_2010_18, 2010, fase_grupos, argentina, corea_del_sur, 4, 1).
partido(m_2010_19, 2010, fase_grupos, grecia, nigeria, 2, 1).
partido(m_2010_20, 2010, fase_grupos, francia, mexico, 0, 2).
partido(m_2010_21, 2010, fase_grupos, alemania, serbia, 0, 1).
partido(m_2010_22, 2010, fase_grupos, eslovenia, estados_unidos, 2, 2).
partido(m_2010_23, 2010, fase_grupos, inglaterra, argelia, 0, 0).
partido(m_2010_24, 2010, fase_grupos, paises_bajos, japon, 1, 0).
partido(m_2010_25, 2010, fase_grupos, ghana, australia, 1, 1).
partido(m_2010_26, 2010, fase_grupos, camerun, dinamarca, 1, 2).
partido(m_2010_27, 2010, fase_grupos, eslovaquia, paraguay, 0, 2).
partido(m_2010_28, 2010, fase_grupos, italia, nueva_zelanda, 1, 1).
partido(m_2010_29, 2010, fase_grupos, brasil, costa_de_marfil, 3, 1).
partido(m_2010_30, 2010, fase_grupos, portugal, corea_del_norte, 7, 0).
partido(m_2010_31, 2010, fase_grupos, chile, suiza, 1, 0).
partido(m_2010_32, 2010, fase_grupos, espana, honduras, 2, 0).
partido(m_2010_33, 2010, fase_grupos, francia, sudafrica, 1, 2).
partido(m_2010_34, 2010, fase_grupos, mexico, uruguay, 0, 1).
partido(m_2010_35, 2010, fase_grupos, grecia, argentina, 0, 2).
partido(m_2010_36, 2010, fase_grupos, nigeria, corea_del_sur, 2, 2).
partido(m_2010_37, 2010, fase_grupos, eslovenia, inglaterra, 0, 1).
partido(m_2010_38, 2010, fase_grupos, estados_unidos, argelia, 1, 0).
partido(m_2010_39, 2010, fase_grupos, australia, serbia, 2, 1).
partido(m_2010_40, 2010, fase_grupos, ghana, alemania, 0, 1).
partido(m_2010_41, 2010, fase_grupos, paraguay, nueva_zelanda, 0, 0).
partido(m_2010_42, 2010, fase_grupos, eslovaquia, italia, 3, 2).
partido(m_2010_43, 2010, fase_grupos, camerun, paises_bajos, 1, 2).
partido(m_2010_44, 2010, fase_grupos, dinamarca, japon, 1, 3).
partido(m_2010_45, 2010, fase_grupos, corea_del_norte, costa_de_marfil, 0, 3).
partido(m_2010_46, 2010, fase_grupos, portugal, brasil, 0, 0).
partido(m_2010_47, 2010, fase_grupos, chile, espana, 1, 2).
partido(m_2010_48, 2010, fase_grupos, suiza, honduras, 0, 0).
partido(m_2010_49, 2010, octavos, uruguay, corea_del_sur, 2, 1).
partido(m_2010_50, 2010, octavos, estados_unidos, ghana, 1, 2).
partido(m_2010_51, 2010, octavos, alemania, inglaterra, 4, 1).
partido(m_2010_52, 2010, octavos, argentina, mexico, 3, 1).
partido(m_2010_53, 2010, octavos, paises_bajos, eslovaquia, 2, 1).
partido(m_2010_54, 2010, octavos, brasil, chile, 3, 0).
partido(m_2010_55, 2010, octavos, paraguay, japon, 0, 0).
partido(m_2010_56, 2010, octavos, espana, portugal, 1, 0).
partido(m_2010_57, 2010, cuartos, paises_bajos, brasil, 2, 1).
partido(m_2010_58, 2010, cuartos, uruguay, ghana, 1, 1).
partido(m_2010_59, 2010, cuartos, argentina, alemania, 0, 4).
partido(m_2010_60, 2010, cuartos, paraguay, espana, 0, 1).
partido(m_2010_61, 2010, semifinal, uruguay, paises_bajos, 2, 3).
partido(m_2010_62, 2010, semifinal, alemania, espana, 0, 1).
partido(m_2010_63, 2010, tercer_puesto, uruguay, alemania, 2, 3).
partido(m_2010_64, 2010, final, paises_bajos, espana, 0, 1).
partido(m_2014_01, 2014, fase_grupos, brasil, croacia, 3, 1).
partido(m_2014_02, 2014, fase_grupos, mexico, camerun, 1, 0).
partido(m_2014_03, 2014, fase_grupos, espana, paises_bajos, 1, 5).
partido(m_2014_04, 2014, fase_grupos, chile, australia, 3, 1).
partido(m_2014_05, 2014, fase_grupos, colombia, grecia, 3, 0).
partido(m_2014_06, 2014, fase_grupos, uruguay, costa_rica, 1, 3).
partido(m_2014_07, 2014, fase_grupos, inglaterra, italia, 1, 2).
partido(m_2014_08, 2014, fase_grupos, costa_de_marfil, japon, 2, 1).
partido(m_2014_09, 2014, fase_grupos, suiza, ecuador, 2, 1).
partido(m_2014_10, 2014, fase_grupos, francia, honduras, 3, 0).
partido(m_2014_11, 2014, fase_grupos, argentina, bosnia_y_herzegovina, 2, 1).
partido(m_2014_12, 2014, fase_grupos, alemania, portugal, 4, 0).
partido(m_2014_13, 2014, fase_grupos, iran, nigeria, 0, 0).
partido(m_2014_14, 2014, fase_grupos, ghana, estados_unidos, 1, 2).
partido(m_2014_15, 2014, fase_grupos, belgica, argelia, 2, 1).
partido(m_2014_16, 2014, fase_grupos, brasil, mexico, 0, 0).
partido(m_2014_17, 2014, fase_grupos, rusia, corea_del_sur, 1, 1).
partido(m_2014_18, 2014, fase_grupos, australia, paises_bajos, 2, 3).
partido(m_2014_19, 2014, fase_grupos, espana, chile, 0, 2).
partido(m_2014_20, 2014, fase_grupos, camerun, croacia, 0, 4).
partido(m_2014_21, 2014, fase_grupos, colombia, costa_de_marfil, 2, 1).
partido(m_2014_22, 2014, fase_grupos, uruguay, inglaterra, 2, 1).
partido(m_2014_23, 2014, fase_grupos, japon, grecia, 0, 0).
partido(m_2014_24, 2014, fase_grupos, italia, costa_rica, 0, 1).
partido(m_2014_25, 2014, fase_grupos, suiza, francia, 2, 5).
partido(m_2014_26, 2014, fase_grupos, honduras, ecuador, 1, 2).
partido(m_2014_27, 2014, fase_grupos, argentina, iran, 1, 0).
partido(m_2014_28, 2014, fase_grupos, alemania, ghana, 2, 2).
partido(m_2014_29, 2014, fase_grupos, nigeria, bosnia_y_herzegovina, 1, 0).
partido(m_2014_30, 2014, fase_grupos, belgica, rusia, 1, 0).
partido(m_2014_31, 2014, fase_grupos, corea_del_sur, argelia, 2, 4).
partido(m_2014_32, 2014, fase_grupos, estados_unidos, portugal, 2, 2).
partido(m_2014_33, 2014, fase_grupos, australia, espana, 0, 3).
partido(m_2014_34, 2014, fase_grupos, paises_bajos, chile, 2, 0).
partido(m_2014_35, 2014, fase_grupos, camerun, brasil, 1, 4).
partido(m_2014_36, 2014, fase_grupos, croacia, mexico, 1, 3).
partido(m_2014_37, 2014, fase_grupos, costa_rica, inglaterra, 0, 0).
partido(m_2014_38, 2014, fase_grupos, italia, uruguay, 0, 1).
partido(m_2014_39, 2014, fase_grupos, japon, colombia, 1, 4).
partido(m_2014_40, 2014, fase_grupos, grecia, costa_de_marfil, 2, 1).
partido(m_2014_41, 2014, fase_grupos, bosnia_y_herzegovina, iran, 3, 1).
partido(m_2014_42, 2014, fase_grupos, nigeria, argentina, 2, 3).
partido(m_2014_43, 2014, fase_grupos, honduras, suiza, 0, 3).
partido(m_2014_44, 2014, fase_grupos, ecuador, francia, 0, 0).
partido(m_2014_45, 2014, fase_grupos, portugal, ghana, 2, 1).
partido(m_2014_46, 2014, fase_grupos, estados_unidos, alemania, 0, 1).
partido(m_2014_47, 2014, fase_grupos, argelia, rusia, 1, 1).
partido(m_2014_48, 2014, fase_grupos, corea_del_sur, belgica, 0, 1).
partido(m_2014_49, 2014, octavos, brasil, chile, 1, 1).
partido(m_2014_50, 2014, octavos, colombia, uruguay, 2, 0).
partido(m_2014_51, 2014, octavos, paises_bajos, mexico, 2, 1).
partido(m_2014_52, 2014, octavos, costa_rica, grecia, 1, 1).
partido(m_2014_53, 2014, octavos, francia, nigeria, 2, 0).
partido(m_2014_54, 2014, octavos, alemania, argelia, 2, 1).
partido(m_2014_55, 2014, octavos, argentina, suiza, 1, 0).
partido(m_2014_56, 2014, octavos, belgica, estados_unidos, 2, 1).
partido(m_2014_57, 2014, cuartos, francia, alemania, 0, 1).
partido(m_2014_58, 2014, cuartos, brasil, colombia, 2, 1).
partido(m_2014_59, 2014, cuartos, argentina, belgica, 1, 0).
partido(m_2014_60, 2014, cuartos, paises_bajos, costa_rica, 0, 0).
partido(m_2014_61, 2014, semifinal, brasil, alemania, 1, 7).
partido(m_2014_62, 2014, semifinal, paises_bajos, argentina, 0, 0).
partido(m_2014_63, 2014, tercer_puesto, brasil, paises_bajos, 0, 3).
partido(m_2014_64, 2014, final, alemania, argentina, 1, 0).
partido(m_2018_01, 2018, fase_grupos, rusia, arabia_saudita, 5, 0).
partido(m_2018_02, 2018, fase_grupos, egipto, uruguay, 0, 1).
partido(m_2018_03, 2018, fase_grupos, marruecos, iran, 0, 1).
partido(m_2018_04, 2018, fase_grupos, portugal, espana, 3, 3).
partido(m_2018_05, 2018, fase_grupos, francia, australia, 2, 1).
partido(m_2018_06, 2018, fase_grupos, argentina, islandia, 1, 1).
partido(m_2018_07, 2018, fase_grupos, peru, dinamarca, 0, 1).
partido(m_2018_08, 2018, fase_grupos, croacia, nigeria, 2, 0).
partido(m_2018_09, 2018, fase_grupos, costa_rica, serbia, 0, 1).
partido(m_2018_10, 2018, fase_grupos, alemania, mexico, 0, 1).
partido(m_2018_11, 2018, fase_grupos, brasil, suiza, 1, 1).
partido(m_2018_12, 2018, fase_grupos, suecia, corea_del_sur, 1, 0).
partido(m_2018_13, 2018, fase_grupos, belgica, panama, 3, 0).
partido(m_2018_14, 2018, fase_grupos, tunez, inglaterra, 1, 2).
partido(m_2018_15, 2018, fase_grupos, colombia, japon, 1, 2).
partido(m_2018_16, 2018, fase_grupos, polonia, senegal, 1, 2).
partido(m_2018_17, 2018, fase_grupos, rusia, egipto, 3, 1).
partido(m_2018_18, 2018, fase_grupos, portugal, marruecos, 1, 0).
partido(m_2018_19, 2018, fase_grupos, uruguay, arabia_saudita, 1, 0).
partido(m_2018_20, 2018, fase_grupos, iran, espana, 0, 1).
partido(m_2018_21, 2018, fase_grupos, dinamarca, australia, 1, 1).
partido(m_2018_22, 2018, fase_grupos, francia, peru, 1, 0).
partido(m_2018_23, 2018, fase_grupos, argentina, croacia, 0, 3).
partido(m_2018_24, 2018, fase_grupos, brasil, costa_rica, 2, 0).
partido(m_2018_25, 2018, fase_grupos, nigeria, islandia, 2, 0).
partido(m_2018_26, 2018, fase_grupos, serbia, suiza, 1, 2).
partido(m_2018_27, 2018, fase_grupos, belgica, tunez, 5, 2).
partido(m_2018_28, 2018, fase_grupos, corea_del_sur, mexico, 1, 2).
partido(m_2018_29, 2018, fase_grupos, alemania, suecia, 2, 1).
partido(m_2018_30, 2018, fase_grupos, inglaterra, panama, 6, 1).
partido(m_2018_31, 2018, fase_grupos, japon, senegal, 2, 2).
partido(m_2018_32, 2018, fase_grupos, polonia, colombia, 0, 3).
partido(m_2018_33, 2018, fase_grupos, arabia_saudita, egipto, 2, 1).
partido(m_2018_34, 2018, fase_grupos, uruguay, rusia, 3, 0).
partido(m_2018_35, 2018, fase_grupos, espana, marruecos, 2, 2).
partido(m_2018_36, 2018, fase_grupos, iran, portugal, 1, 1).
partido(m_2018_37, 2018, fase_grupos, australia, peru, 0, 2).
partido(m_2018_38, 2018, fase_grupos, dinamarca, francia, 0, 0).
partido(m_2018_39, 2018, fase_grupos, islandia, croacia, 1, 2).
partido(m_2018_40, 2018, fase_grupos, nigeria, argentina, 1, 2).
partido(m_2018_41, 2018, fase_grupos, corea_del_sur, alemania, 2, 0).
partido(m_2018_42, 2018, fase_grupos, mexico, suecia, 0, 3).
partido(m_2018_43, 2018, fase_grupos, serbia, brasil, 0, 2).
partido(m_2018_44, 2018, fase_grupos, suiza, costa_rica, 2, 2).
partido(m_2018_45, 2018, fase_grupos, japon, polonia, 0, 1).
partido(m_2018_46, 2018, fase_grupos, senegal, colombia, 0, 1).
partido(m_2018_47, 2018, fase_grupos, inglaterra, belgica, 0, 1).
partido(m_2018_48, 2018, fase_grupos, panama, tunez, 1, 2).
partido(m_2018_49, 2018, octavos, francia, argentina, 4, 3).
partido(m_2018_50, 2018, octavos, uruguay, portugal, 2, 1).
partido(m_2018_51, 2018, octavos, espana, rusia, 1, 1).
partido(m_2018_52, 2018, octavos, croacia, dinamarca, 1, 1).
partido(m_2018_53, 2018, octavos, brasil, mexico, 2, 0).
partido(m_2018_54, 2018, octavos, belgica, japon, 3, 2).
partido(m_2018_55, 2018, octavos, suecia, suiza, 1, 0).
partido(m_2018_56, 2018, octavos, colombia, inglaterra, 1, 1).
partido(m_2018_57, 2018, cuartos, uruguay, francia, 0, 2).
partido(m_2018_58, 2018, cuartos, brasil, belgica, 1, 2).
partido(m_2018_59, 2018, cuartos, suecia, inglaterra, 0, 2).
partido(m_2018_60, 2018, cuartos, rusia, croacia, 2, 2).
partido(m_2018_61, 2018, semifinal, francia, belgica, 1, 0).
partido(m_2018_62, 2018, semifinal, croacia, inglaterra, 2, 1).
partido(m_2018_63, 2018, tercer_puesto, belgica, inglaterra, 2, 0).
partido(m_2018_64, 2018, final, francia, croacia, 4, 2).
partido(m_2022_01, 2022, fase_grupos, catar, ecuador, 0, 2).
partido(m_2022_02, 2022, fase_grupos, inglaterra, iran, 6, 2).
partido(m_2022_03, 2022, fase_grupos, senegal, paises_bajos, 0, 2).
partido(m_2022_04, 2022, fase_grupos, estados_unidos, gales, 1, 1).
partido(m_2022_05, 2022, fase_grupos, argentina, arabia_saudita, 1, 2).
partido(m_2022_06, 2022, fase_grupos, dinamarca, tunez, 0, 0).
partido(m_2022_07, 2022, fase_grupos, mexico, polonia, 0, 0).
partido(m_2022_08, 2022, fase_grupos, francia, australia, 4, 1).
partido(m_2022_09, 2022, fase_grupos, marruecos, croacia, 0, 0).
partido(m_2022_10, 2022, fase_grupos, alemania, japon, 1, 2).
partido(m_2022_11, 2022, fase_grupos, espana, costa_rica, 7, 0).
partido(m_2022_12, 2022, fase_grupos, belgica, canada, 1, 0).
partido(m_2022_13, 2022, fase_grupos, suiza, camerun, 1, 0).
partido(m_2022_14, 2022, fase_grupos, uruguay, corea_del_sur, 0, 0).
partido(m_2022_15, 2022, fase_grupos, portugal, ghana, 3, 2).
partido(m_2022_16, 2022, fase_grupos, brasil, serbia, 2, 0).
partido(m_2022_17, 2022, fase_grupos, gales, iran, 0, 2).
partido(m_2022_18, 2022, fase_grupos, catar, senegal, 1, 3).
partido(m_2022_19, 2022, fase_grupos, paises_bajos, ecuador, 1, 1).
partido(m_2022_20, 2022, fase_grupos, inglaterra, estados_unidos, 0, 0).
partido(m_2022_21, 2022, fase_grupos, tunez, australia, 0, 1).
partido(m_2022_22, 2022, fase_grupos, polonia, arabia_saudita, 2, 0).
partido(m_2022_23, 2022, fase_grupos, francia, dinamarca, 2, 1).
partido(m_2022_24, 2022, fase_grupos, argentina, mexico, 2, 0).
partido(m_2022_25, 2022, fase_grupos, japon, costa_rica, 0, 1).
partido(m_2022_26, 2022, fase_grupos, belgica, marruecos, 0, 2).
partido(m_2022_27, 2022, fase_grupos, croacia, canada, 4, 1).
partido(m_2022_28, 2022, fase_grupos, espana, alemania, 1, 1).
partido(m_2022_29, 2022, fase_grupos, camerun, serbia, 3, 3).
partido(m_2022_30, 2022, fase_grupos, corea_del_sur, ghana, 2, 3).
partido(m_2022_31, 2022, fase_grupos, brasil, suiza, 1, 0).
partido(m_2022_32, 2022, fase_grupos, portugal, uruguay, 2, 0).
partido(m_2022_33, 2022, fase_grupos, ecuador, senegal, 1, 2).
partido(m_2022_34, 2022, fase_grupos, paises_bajos, catar, 2, 0).
partido(m_2022_35, 2022, fase_grupos, iran, estados_unidos, 0, 1).
partido(m_2022_36, 2022, fase_grupos, gales, inglaterra, 0, 3).
partido(m_2022_37, 2022, fase_grupos, australia, dinamarca, 1, 0).
partido(m_2022_38, 2022, fase_grupos, tunez, francia, 1, 0).
partido(m_2022_39, 2022, fase_grupos, polonia, argentina, 0, 2).
partido(m_2022_40, 2022, fase_grupos, arabia_saudita, mexico, 1, 2).
partido(m_2022_41, 2022, fase_grupos, canada, marruecos, 1, 2).
partido(m_2022_42, 2022, fase_grupos, croacia, belgica, 0, 0).
partido(m_2022_43, 2022, fase_grupos, costa_rica, alemania, 2, 4).
partido(m_2022_44, 2022, fase_grupos, japon, espana, 2, 1).
partido(m_2022_45, 2022, fase_grupos, ghana, uruguay, 0, 2).
partido(m_2022_46, 2022, fase_grupos, corea_del_sur, portugal, 2, 1).
partido(m_2022_47, 2022, fase_grupos, camerun, brasil, 1, 0).
partido(m_2022_48, 2022, fase_grupos, serbia, suiza, 2, 3).
partido(m_2022_49, 2022, octavos, paises_bajos, estados_unidos, 3, 1).
partido(m_2022_50, 2022, octavos, argentina, australia, 2, 1).
partido(m_2022_51, 2022, octavos, francia, polonia, 3, 1).
partido(m_2022_52, 2022, octavos, inglaterra, senegal, 3, 0).
partido(m_2022_53, 2022, octavos, japon, croacia, 1, 1).
partido(m_2022_54, 2022, octavos, brasil, corea_del_sur, 4, 1).
partido(m_2022_55, 2022, octavos, marruecos, espana, 0, 0).
partido(m_2022_56, 2022, octavos, portugal, suiza, 6, 1).
partido(m_2022_57, 2022, cuartos, croacia, brasil, 1, 1).
partido(m_2022_58, 2022, cuartos, paises_bajos, argentina, 2, 2).
partido(m_2022_59, 2022, cuartos, marruecos, portugal, 1, 0).
partido(m_2022_60, 2022, cuartos, inglaterra, francia, 1, 2).
partido(m_2022_61, 2022, semifinal, argentina, croacia, 3, 0).
partido(m_2022_62, 2022, semifinal, francia, marruecos, 2, 0).
partido(m_2022_63, 2022, tercer_puesto, croacia, marruecos, 2, 1).
partido(m_2022_64, 2022, final, argentina, francia, 3, 3).

% partido_grupo(Id, Grupo).
partido_grupo(m_1930_01, group_1).
partido_grupo(m_1930_02, group_4).
partido_grupo(m_1930_03, group_2).
partido_grupo(m_1930_04, group_3).
partido_grupo(m_1930_05, group_1).
partido_grupo(m_1930_06, group_1).
partido_grupo(m_1930_07, group_2).
partido_grupo(m_1930_08, group_4).
partido_grupo(m_1930_09, group_3).
partido_grupo(m_1930_10, group_1).
partido_grupo(m_1930_11, group_1).
partido_grupo(m_1930_12, group_2).
partido_grupo(m_1930_13, group_4).
partido_grupo(m_1930_14, group_3).
partido_grupo(m_1930_15, group_1).
partido_grupo(m_1950_01, group_1).
partido_grupo(m_1950_02, group_1).
partido_grupo(m_1950_03, group_2).
partido_grupo(m_1950_04, group_2).
partido_grupo(m_1950_05, group_3).
partido_grupo(m_1950_06, group_1).
partido_grupo(m_1950_07, group_1).
partido_grupo(m_1950_08, group_2).
partido_grupo(m_1950_09, group_2).
partido_grupo(m_1950_10, group_3).
partido_grupo(m_1950_11, group_1).
partido_grupo(m_1950_12, group_2).
partido_grupo(m_1950_13, group_2).
partido_grupo(m_1950_14, group_3).
partido_grupo(m_1950_15, group_4).
partido_grupo(m_1950_16, group_1).
partido_grupo(m_1954_01, group_1).
partido_grupo(m_1954_02, group_1).
partido_grupo(m_1954_03, group_3).
partido_grupo(m_1954_04, group_3).
partido_grupo(m_1954_05, group_4).
partido_grupo(m_1954_06, group_2).
partido_grupo(m_1954_07, group_2).
partido_grupo(m_1954_08, group_4).
partido_grupo(m_1954_09, group_3).
partido_grupo(m_1954_10, group_1).
partido_grupo(m_1954_11, group_3).
partido_grupo(m_1954_12, group_1).
partido_grupo(m_1954_13, group_2).
partido_grupo(m_1954_14, group_2).
partido_grupo(m_1954_15, group_4).
partido_grupo(m_1954_16, group_4).
partido_grupo(m_1954_17, group_2).
partido_grupo(m_1954_18, group_4).
partido_grupo(m_1958_01, group_3).
partido_grupo(m_1958_02, group_1).
partido_grupo(m_1958_03, group_1).
partido_grupo(m_1958_04, group_2).
partido_grupo(m_1958_05, group_2).
partido_grupo(m_1958_06, group_3).
partido_grupo(m_1958_07, group_4).
partido_grupo(m_1958_08, group_4).
partido_grupo(m_1958_09, group_1).
partido_grupo(m_1958_10, group_1).
partido_grupo(m_1958_11, group_2).
partido_grupo(m_1958_12, group_2).
partido_grupo(m_1958_13, group_3).
partido_grupo(m_1958_14, group_4).
partido_grupo(m_1958_15, group_4).
partido_grupo(m_1958_16, group_3).
partido_grupo(m_1958_17, group_3).
partido_grupo(m_1958_18, group_1).
partido_grupo(m_1958_19, group_1).
partido_grupo(m_1958_20, group_2).
partido_grupo(m_1958_21, group_2).
partido_grupo(m_1958_22, group_3).
partido_grupo(m_1958_23, group_4).
partido_grupo(m_1958_24, group_4).
partido_grupo(m_1958_25, group_1).
partido_grupo(m_1958_26, group_3).
partido_grupo(m_1958_27, group_4).
partido_grupo(m_1962_01, group_1).
partido_grupo(m_1962_02, group_2).
partido_grupo(m_1962_03, group_3).
partido_grupo(m_1962_04, group_4).
partido_grupo(m_1962_05, group_1).
partido_grupo(m_1962_06, group_2).
partido_grupo(m_1962_07, group_3).
partido_grupo(m_1962_08, group_4).
partido_grupo(m_1962_09, group_1).
partido_grupo(m_1962_10, group_2).
partido_grupo(m_1962_11, group_3).
partido_grupo(m_1962_12, group_4).
partido_grupo(m_1962_13, group_1).
partido_grupo(m_1962_14, group_2).
partido_grupo(m_1962_15, group_3).
partido_grupo(m_1962_16, group_4).
partido_grupo(m_1962_17, group_1).
partido_grupo(m_1962_18, group_2).
partido_grupo(m_1962_19, group_3).
partido_grupo(m_1962_20, group_4).
partido_grupo(m_1962_21, group_1).
partido_grupo(m_1962_22, group_2).
partido_grupo(m_1962_23, group_3).
partido_grupo(m_1962_24, group_4).
partido_grupo(m_1966_01, group_1).
partido_grupo(m_1966_02, group_2).
partido_grupo(m_1966_03, group_3).
partido_grupo(m_1966_04, group_4).
partido_grupo(m_1966_05, group_1).
partido_grupo(m_1966_06, group_2).
partido_grupo(m_1966_07, group_3).
partido_grupo(m_1966_08, group_4).
partido_grupo(m_1966_09, group_1).
partido_grupo(m_1966_10, group_2).
partido_grupo(m_1966_11, group_3).
partido_grupo(m_1966_12, group_4).
partido_grupo(m_1966_13, group_2).
partido_grupo(m_1966_14, group_3).
partido_grupo(m_1966_15, group_4).
partido_grupo(m_1966_16, group_1).
partido_grupo(m_1966_17, group_1).
partido_grupo(m_1966_18, group_2).
partido_grupo(m_1966_19, group_3).
partido_grupo(m_1966_20, group_4).
partido_grupo(m_1966_21, group_1).
partido_grupo(m_1966_22, group_2).
partido_grupo(m_1966_23, group_3).
partido_grupo(m_1966_24, group_4).
partido_grupo(m_1970_01, group_1).
partido_grupo(m_1970_02, group_2).
partido_grupo(m_1970_03, group_3).
partido_grupo(m_1970_04, group_4).
partido_grupo(m_1970_05, group_1).
partido_grupo(m_1970_06, group_2).
partido_grupo(m_1970_07, group_3).
partido_grupo(m_1970_08, group_4).
partido_grupo(m_1970_09, group_1).
partido_grupo(m_1970_10, group_2).
partido_grupo(m_1970_11, group_3).
partido_grupo(m_1970_12, group_4).
partido_grupo(m_1970_13, group_1).
partido_grupo(m_1970_14, group_2).
partido_grupo(m_1970_15, group_3).
partido_grupo(m_1970_16, group_4).
partido_grupo(m_1970_17, group_1).
partido_grupo(m_1970_18, group_2).
partido_grupo(m_1970_19, group_3).
partido_grupo(m_1970_20, group_4).
partido_grupo(m_1970_21, group_1).
partido_grupo(m_1970_22, group_2).
partido_grupo(m_1970_23, group_3).
partido_grupo(m_1970_24, group_4).
partido_grupo(m_1974_01, group_2).
partido_grupo(m_1974_02, group_1).
partido_grupo(m_1974_03, group_1).
partido_grupo(m_1974_04, group_2).
partido_grupo(m_1974_05, group_3).
partido_grupo(m_1974_06, group_3).
partido_grupo(m_1974_07, group_4).
partido_grupo(m_1974_08, group_4).
partido_grupo(m_1974_09, group_1).
partido_grupo(m_1974_10, group_1).
partido_grupo(m_1974_11, group_2).
partido_grupo(m_1974_12, group_2).
partido_grupo(m_1974_13, group_3).
partido_grupo(m_1974_14, group_3).
partido_grupo(m_1974_15, group_4).
partido_grupo(m_1974_16, group_4).
partido_grupo(m_1974_17, group_1).
partido_grupo(m_1974_18, group_2).
partido_grupo(m_1974_19, group_2).
partido_grupo(m_1974_20, group_1).
partido_grupo(m_1974_21, group_3).
partido_grupo(m_1974_22, group_3).
partido_grupo(m_1974_23, group_4).
partido_grupo(m_1974_24, group_4).
partido_grupo(m_1974_25, group_b).
partido_grupo(m_1974_26, group_a).
partido_grupo(m_1974_27, group_a).
partido_grupo(m_1974_28, group_b).
partido_grupo(m_1974_29, group_a).
partido_grupo(m_1974_30, group_a).
partido_grupo(m_1974_31, group_b).
partido_grupo(m_1974_32, group_b).
partido_grupo(m_1974_33, group_b).
partido_grupo(m_1974_34, group_a).
partido_grupo(m_1974_35, group_a).
partido_grupo(m_1974_36, group_b).
partido_grupo(m_1978_01, group_2).
partido_grupo(m_1978_02, group_1).
partido_grupo(m_1978_03, group_2).
partido_grupo(m_1978_04, group_1).
partido_grupo(m_1978_05, group_3).
partido_grupo(m_1978_06, group_3).
partido_grupo(m_1978_07, group_4).
partido_grupo(m_1978_08, group_4).
partido_grupo(m_1978_09, group_1).
partido_grupo(m_1978_10, group_2).
partido_grupo(m_1978_11, group_2).
partido_grupo(m_1978_12, group_1).
partido_grupo(m_1978_13, group_3).
partido_grupo(m_1978_14, group_3).
partido_grupo(m_1978_15, group_4).
partido_grupo(m_1978_16, group_4).
partido_grupo(m_1978_17, group_1).
partido_grupo(m_1978_18, group_2).
partido_grupo(m_1978_19, group_2).
partido_grupo(m_1978_20, group_1).
partido_grupo(m_1978_21, group_3).
partido_grupo(m_1978_22, group_3).
partido_grupo(m_1978_23, group_4).
partido_grupo(m_1978_24, group_4).
partido_grupo(m_1978_25, group_a).
partido_grupo(m_1978_26, group_a).
partido_grupo(m_1978_27, group_b).
partido_grupo(m_1978_28, group_b).
partido_grupo(m_1978_29, group_b).
partido_grupo(m_1978_30, group_a).
partido_grupo(m_1978_31, group_a).
partido_grupo(m_1978_32, group_b).
partido_grupo(m_1978_33, group_a).
partido_grupo(m_1978_34, group_a).
partido_grupo(m_1978_35, group_b).
partido_grupo(m_1978_36, group_b).
partido_grupo(m_1982_01, group_3).
partido_grupo(m_1982_02, group_1).
partido_grupo(m_1982_03, group_6).
partido_grupo(m_1982_04, group_1).
partido_grupo(m_1982_05, group_3).
partido_grupo(m_1982_06, group_6).
partido_grupo(m_1982_07, group_2).
partido_grupo(m_1982_08, group_4).
partido_grupo(m_1982_09, group_5).
partido_grupo(m_1982_10, group_2).
partido_grupo(m_1982_11, group_4).
partido_grupo(m_1982_12, group_5).
partido_grupo(m_1982_13, group_1).
partido_grupo(m_1982_14, group_3).
partido_grupo(m_1982_15, group_6).
partido_grupo(m_1982_16, group_1).
partido_grupo(m_1982_17, group_3).
partido_grupo(m_1982_18, group_6).
partido_grupo(m_1982_19, group_2).
partido_grupo(m_1982_20, group_4).
partido_grupo(m_1982_21, group_5).
partido_grupo(m_1982_22, group_2).
partido_grupo(m_1982_23, group_4).
partido_grupo(m_1982_24, group_5).
partido_grupo(m_1982_25, group_1).
partido_grupo(m_1982_26, group_3).
partido_grupo(m_1982_27, group_6).
partido_grupo(m_1982_28, group_1).
partido_grupo(m_1982_29, group_3).
partido_grupo(m_1982_30, group_6).
partido_grupo(m_1982_31, group_2).
partido_grupo(m_1982_32, group_4).
partido_grupo(m_1982_33, group_5).
partido_grupo(m_1982_34, group_2).
partido_grupo(m_1982_35, group_4).
partido_grupo(m_1982_36, group_5).
partido_grupo(m_1982_37, group_4).
partido_grupo(m_1982_38, group_1).
partido_grupo(m_1982_39, group_3).
partido_grupo(m_1982_40, group_2).
partido_grupo(m_1982_41, group_4).
partido_grupo(m_1982_42, group_1).
partido_grupo(m_1982_43, group_3).
partido_grupo(m_1982_44, group_2).
partido_grupo(m_1982_45, group_4).
partido_grupo(m_1982_46, group_1).
partido_grupo(m_1982_47, group_3).
partido_grupo(m_1982_48, group_2).
partido_grupo(m_1986_01, group_a).
partido_grupo(m_1986_02, group_d).
partido_grupo(m_1986_03, group_c).
partido_grupo(m_1986_04, group_a).
partido_grupo(m_1986_05, group_c).
partido_grupo(m_1986_06, group_f).
partido_grupo(m_1986_07, group_b).
partido_grupo(m_1986_08, group_d).
partido_grupo(m_1986_09, group_f).
partido_grupo(m_1986_10, group_b).
partido_grupo(m_1986_11, group_e).
partido_grupo(m_1986_12, group_e).
partido_grupo(m_1986_13, group_a).
partido_grupo(m_1986_14, group_c).
partido_grupo(m_1986_15, group_a).
partido_grupo(m_1986_16, group_c).
partido_grupo(m_1986_17, group_d).
partido_grupo(m_1986_18, group_f).
partido_grupo(m_1986_19, group_b).
partido_grupo(m_1986_20, group_d).
partido_grupo(m_1986_21, group_f).
partido_grupo(m_1986_22, group_b).
partido_grupo(m_1986_23, group_e).
partido_grupo(m_1986_24, group_e).
partido_grupo(m_1986_25, group_c).
partido_grupo(m_1986_26, group_c).
partido_grupo(m_1986_27, group_a).
partido_grupo(m_1986_28, group_a).
partido_grupo(m_1986_29, group_b).
partido_grupo(m_1986_30, group_b).
partido_grupo(m_1986_31, group_f).
partido_grupo(m_1986_32, group_f).
partido_grupo(m_1986_33, group_d).
partido_grupo(m_1986_34, group_d).
partido_grupo(m_1986_35, group_e).
partido_grupo(m_1986_36, group_e).
partido_grupo(m_1990_01, group_b).
partido_grupo(m_1990_02, group_b).
partido_grupo(m_1990_03, group_d).
partido_grupo(m_1990_04, group_a).
partido_grupo(m_1990_05, group_a).
partido_grupo(m_1990_06, group_c).
partido_grupo(m_1990_07, group_d).
partido_grupo(m_1990_08, group_c).
partido_grupo(m_1990_09, group_f).
partido_grupo(m_1990_10, group_e).
partido_grupo(m_1990_11, group_f).
partido_grupo(m_1990_12, group_e).
partido_grupo(m_1990_13, group_b).
partido_grupo(m_1990_14, group_b).
partido_grupo(m_1990_15, group_d).
partido_grupo(m_1990_16, group_a).
partido_grupo(m_1990_17, group_a).
partido_grupo(m_1990_18, group_d).
partido_grupo(m_1990_19, group_c).
partido_grupo(m_1990_20, group_c).
partido_grupo(m_1990_21, group_f).
partido_grupo(m_1990_22, group_f).
partido_grupo(m_1990_23, group_e).
partido_grupo(m_1990_24, group_e).
partido_grupo(m_1990_25, group_b).
partido_grupo(m_1990_26, group_b).
partido_grupo(m_1990_27, group_d).
partido_grupo(m_1990_28, group_d).
partido_grupo(m_1990_29, group_a).
partido_grupo(m_1990_30, group_a).
partido_grupo(m_1990_31, group_c).
partido_grupo(m_1990_32, group_c).
partido_grupo(m_1990_33, group_e).
partido_grupo(m_1990_34, group_e).
partido_grupo(m_1990_35, group_f).
partido_grupo(m_1990_36, group_f).
partido_grupo(m_1994_01, group_c).
partido_grupo(m_1994_02, group_c).
partido_grupo(m_1994_03, group_a).
partido_grupo(m_1994_04, group_e).
partido_grupo(m_1994_05, group_a).
partido_grupo(m_1994_06, group_f).
partido_grupo(m_1994_07, group_e).
partido_grupo(m_1994_08, group_b).
partido_grupo(m_1994_09, group_b).
partido_grupo(m_1994_10, group_f).
partido_grupo(m_1994_11, group_d).
partido_grupo(m_1994_12, group_c).
partido_grupo(m_1994_13, group_d).
partido_grupo(m_1994_14, group_a).
partido_grupo(m_1994_15, group_a).
partido_grupo(m_1994_16, group_e).
partido_grupo(m_1994_17, group_c).
partido_grupo(m_1994_18, group_e).
partido_grupo(m_1994_19, group_b).
partido_grupo(m_1994_20, group_b).
partido_grupo(m_1994_21, group_f).
partido_grupo(m_1994_22, group_f).
partido_grupo(m_1994_23, group_d).
partido_grupo(m_1994_24, group_d).
partido_grupo(m_1994_25, group_a).
partido_grupo(m_1994_26, group_a).
partido_grupo(m_1994_27, group_c).
partido_grupo(m_1994_28, group_c).
partido_grupo(m_1994_29, group_e).
partido_grupo(m_1994_30, group_e).
partido_grupo(m_1994_31, group_b).
partido_grupo(m_1994_32, group_b).
partido_grupo(m_1994_33, group_f).
partido_grupo(m_1994_34, group_f).
partido_grupo(m_1994_35, group_d).
partido_grupo(m_1994_36, group_d).
partido_grupo(m_1998_01, group_a).
partido_grupo(m_1998_02, group_a).
partido_grupo(m_1998_03, group_b).
partido_grupo(m_1998_04, group_b).
partido_grupo(m_1998_05, group_d).
partido_grupo(m_1998_06, group_c).
partido_grupo(m_1998_07, group_c).
partido_grupo(m_1998_08, group_d).
partido_grupo(m_1998_09, group_e).
partido_grupo(m_1998_10, group_e).
partido_grupo(m_1998_11, group_h).
partido_grupo(m_1998_12, group_f).
partido_grupo(m_1998_13, group_h).
partido_grupo(m_1998_14, group_g).
partido_grupo(m_1998_15, group_g).
partido_grupo(m_1998_16, group_f).
partido_grupo(m_1998_17, group_a).
partido_grupo(m_1998_18, group_a).
partido_grupo(m_1998_19, group_b).
partido_grupo(m_1998_20, group_b).
partido_grupo(m_1998_21, group_c).
partido_grupo(m_1998_22, group_c).
partido_grupo(m_1998_23, group_d).
partido_grupo(m_1998_24, group_d).
partido_grupo(m_1998_25, group_h).
partido_grupo(m_1998_26, group_e).
partido_grupo(m_1998_27, group_e).
partido_grupo(m_1998_28, group_f).
partido_grupo(m_1998_29, group_h).
partido_grupo(m_1998_30, group_f).
partido_grupo(m_1998_31, group_g).
partido_grupo(m_1998_32, group_g).
partido_grupo(m_1998_33, group_b).
partido_grupo(m_1998_34, group_b).
partido_grupo(m_1998_35, group_a).
partido_grupo(m_1998_36, group_a).
partido_grupo(m_1998_37, group_c).
partido_grupo(m_1998_38, group_c).
partido_grupo(m_1998_39, group_d).
partido_grupo(m_1998_40, group_d).
partido_grupo(m_1998_41, group_e).
partido_grupo(m_1998_42, group_e).
partido_grupo(m_1998_43, group_f).
partido_grupo(m_1998_44, group_f).
partido_grupo(m_1998_45, group_h).
partido_grupo(m_1998_46, group_h).
partido_grupo(m_1998_47, group_g).
partido_grupo(m_1998_48, group_g).
partido_grupo(m_2002_01, group_a).
partido_grupo(m_2002_02, group_e).
partido_grupo(m_2002_03, group_a).
partido_grupo(m_2002_04, group_e).
partido_grupo(m_2002_05, group_f).
partido_grupo(m_2002_06, group_b).
partido_grupo(m_2002_07, group_f).
partido_grupo(m_2002_08, group_b).
partido_grupo(m_2002_09, group_g).
partido_grupo(m_2002_10, group_c).
partido_grupo(m_2002_11, group_g).
partido_grupo(m_2002_12, group_c).
partido_grupo(m_2002_13, group_h).
partido_grupo(m_2002_14, group_d).
partido_grupo(m_2002_15, group_h).
partido_grupo(m_2002_16, group_d).
partido_grupo(m_2002_17, group_e).
partido_grupo(m_2002_18, group_a).
partido_grupo(m_2002_19, group_e).
partido_grupo(m_2002_20, group_a).
partido_grupo(m_2002_21, group_f).
partido_grupo(m_2002_22, group_b).
partido_grupo(m_2002_23, group_f).
partido_grupo(m_2002_24, group_b).
partido_grupo(m_2002_25, group_g).
partido_grupo(m_2002_26, group_c).
partido_grupo(m_2002_27, group_g).
partido_grupo(m_2002_28, group_c).
partido_grupo(m_2002_29, group_h).
partido_grupo(m_2002_30, group_d).
partido_grupo(m_2002_31, group_h).
partido_grupo(m_2002_32, group_d).
partido_grupo(m_2002_33, group_a).
partido_grupo(m_2002_34, group_a).
partido_grupo(m_2002_35, group_e).
partido_grupo(m_2002_36, group_e).
partido_grupo(m_2002_37, group_f).
partido_grupo(m_2002_38, group_f).
partido_grupo(m_2002_39, group_b).
partido_grupo(m_2002_40, group_b).
partido_grupo(m_2002_41, group_c).
partido_grupo(m_2002_42, group_c).
partido_grupo(m_2002_43, group_g).
partido_grupo(m_2002_44, group_g).
partido_grupo(m_2002_45, group_h).
partido_grupo(m_2002_46, group_h).
partido_grupo(m_2002_47, group_d).
partido_grupo(m_2002_48, group_d).
partido_grupo(m_2006_01, group_a).
partido_grupo(m_2006_02, group_a).
partido_grupo(m_2006_03, group_b).
partido_grupo(m_2006_04, group_b).
partido_grupo(m_2006_05, group_c).
partido_grupo(m_2006_06, group_c).
partido_grupo(m_2006_07, group_d).
partido_grupo(m_2006_08, group_d).
partido_grupo(m_2006_09, group_f).
partido_grupo(m_2006_10, group_e).
partido_grupo(m_2006_11, group_e).
partido_grupo(m_2006_12, group_g).
partido_grupo(m_2006_13, group_g).
partido_grupo(m_2006_14, group_f).
partido_grupo(m_2006_15, group_h).
partido_grupo(m_2006_16, group_h).
partido_grupo(m_2006_17, group_a).
partido_grupo(m_2006_18, group_a).
partido_grupo(m_2006_19, group_b).
partido_grupo(m_2006_20, group_b).
partido_grupo(m_2006_21, group_c).
partido_grupo(m_2006_22, group_c).
partido_grupo(m_2006_23, group_d).
partido_grupo(m_2006_24, group_d).
partido_grupo(m_2006_25, group_e).
partido_grupo(m_2006_26, group_e).
partido_grupo(m_2006_27, group_f).
partido_grupo(m_2006_28, group_f).
partido_grupo(m_2006_29, group_g).
partido_grupo(m_2006_30, group_g).
partido_grupo(m_2006_31, group_h).
partido_grupo(m_2006_32, group_h).
partido_grupo(m_2006_33, group_a).
partido_grupo(m_2006_34, group_a).
partido_grupo(m_2006_35, group_b).
partido_grupo(m_2006_36, group_b).
partido_grupo(m_2006_37, group_d).
partido_grupo(m_2006_38, group_d).
partido_grupo(m_2006_39, group_c).
partido_grupo(m_2006_40, group_c).
partido_grupo(m_2006_41, group_e).
partido_grupo(m_2006_42, group_e).
partido_grupo(m_2006_43, group_f).
partido_grupo(m_2006_44, group_f).
partido_grupo(m_2006_45, group_h).
partido_grupo(m_2006_46, group_h).
partido_grupo(m_2006_47, group_g).
partido_grupo(m_2006_48, group_g).
partido_grupo(m_2010_01, group_a).
partido_grupo(m_2010_02, group_a).
partido_grupo(m_2010_03, group_b).
partido_grupo(m_2010_04, group_b).
partido_grupo(m_2010_05, group_c).
partido_grupo(m_2010_06, group_c).
partido_grupo(m_2010_07, group_d).
partido_grupo(m_2010_08, group_d).
partido_grupo(m_2010_09, group_e).
partido_grupo(m_2010_10, group_e).
partido_grupo(m_2010_11, group_f).
partido_grupo(m_2010_12, group_f).
partido_grupo(m_2010_13, group_g).
partido_grupo(m_2010_14, group_g).
partido_grupo(m_2010_15, group_h).
partido_grupo(m_2010_16, group_h).
partido_grupo(m_2010_17, group_a).
partido_grupo(m_2010_18, group_b).
partido_grupo(m_2010_19, group_b).
partido_grupo(m_2010_20, group_a).
partido_grupo(m_2010_21, group_d).
partido_grupo(m_2010_22, group_c).
partido_grupo(m_2010_23, group_c).
partido_grupo(m_2010_24, group_e).
partido_grupo(m_2010_25, group_d).
partido_grupo(m_2010_26, group_e).
partido_grupo(m_2010_27, group_f).
partido_grupo(m_2010_28, group_f).
partido_grupo(m_2010_29, group_g).
partido_grupo(m_2010_30, group_g).
partido_grupo(m_2010_31, group_h).
partido_grupo(m_2010_32, group_h).
partido_grupo(m_2010_33, group_a).
partido_grupo(m_2010_34, group_a).
partido_grupo(m_2010_35, group_b).
partido_grupo(m_2010_36, group_b).
partido_grupo(m_2010_37, group_c).
partido_grupo(m_2010_38, group_c).
partido_grupo(m_2010_39, group_d).
partido_grupo(m_2010_40, group_d).
partido_grupo(m_2010_41, group_f).
partido_grupo(m_2010_42, group_f).
partido_grupo(m_2010_43, group_e).
partido_grupo(m_2010_44, group_e).
partido_grupo(m_2010_45, group_g).
partido_grupo(m_2010_46, group_g).
partido_grupo(m_2010_47, group_h).
partido_grupo(m_2010_48, group_h).
partido_grupo(m_2014_01, group_a).
partido_grupo(m_2014_02, group_a).
partido_grupo(m_2014_03, group_b).
partido_grupo(m_2014_04, group_b).
partido_grupo(m_2014_05, group_c).
partido_grupo(m_2014_06, group_d).
partido_grupo(m_2014_07, group_d).
partido_grupo(m_2014_08, group_c).
partido_grupo(m_2014_09, group_e).
partido_grupo(m_2014_10, group_e).
partido_grupo(m_2014_11, group_f).
partido_grupo(m_2014_12, group_g).
partido_grupo(m_2014_13, group_f).
partido_grupo(m_2014_14, group_g).
partido_grupo(m_2014_15, group_h).
partido_grupo(m_2014_16, group_a).
partido_grupo(m_2014_17, group_h).
partido_grupo(m_2014_18, group_b).
partido_grupo(m_2014_19, group_b).
partido_grupo(m_2014_20, group_a).
partido_grupo(m_2014_21, group_c).
partido_grupo(m_2014_22, group_d).
partido_grupo(m_2014_23, group_c).
partido_grupo(m_2014_24, group_d).
partido_grupo(m_2014_25, group_e).
partido_grupo(m_2014_26, group_e).
partido_grupo(m_2014_27, group_f).
partido_grupo(m_2014_28, group_g).
partido_grupo(m_2014_29, group_f).
partido_grupo(m_2014_30, group_h).
partido_grupo(m_2014_31, group_h).
partido_grupo(m_2014_32, group_g).
partido_grupo(m_2014_33, group_b).
partido_grupo(m_2014_34, group_b).
partido_grupo(m_2014_35, group_a).
partido_grupo(m_2014_36, group_a).
partido_grupo(m_2014_37, group_d).
partido_grupo(m_2014_38, group_d).
partido_grupo(m_2014_39, group_c).
partido_grupo(m_2014_40, group_c).
partido_grupo(m_2014_41, group_f).
partido_grupo(m_2014_42, group_f).
partido_grupo(m_2014_43, group_e).
partido_grupo(m_2014_44, group_e).
partido_grupo(m_2014_45, group_g).
partido_grupo(m_2014_46, group_g).
partido_grupo(m_2014_47, group_h).
partido_grupo(m_2014_48, group_h).
partido_grupo(m_2018_01, group_a).
partido_grupo(m_2018_02, group_a).
partido_grupo(m_2018_03, group_b).
partido_grupo(m_2018_04, group_b).
partido_grupo(m_2018_05, group_c).
partido_grupo(m_2018_06, group_d).
partido_grupo(m_2018_07, group_c).
partido_grupo(m_2018_08, group_d).
partido_grupo(m_2018_09, group_e).
partido_grupo(m_2018_10, group_f).
partido_grupo(m_2018_11, group_e).
partido_grupo(m_2018_12, group_f).
partido_grupo(m_2018_13, group_g).
partido_grupo(m_2018_14, group_g).
partido_grupo(m_2018_15, group_h).
partido_grupo(m_2018_16, group_h).
partido_grupo(m_2018_17, group_a).
partido_grupo(m_2018_18, group_b).
partido_grupo(m_2018_19, group_a).
partido_grupo(m_2018_20, group_b).
partido_grupo(m_2018_21, group_c).
partido_grupo(m_2018_22, group_c).
partido_grupo(m_2018_23, group_d).
partido_grupo(m_2018_24, group_e).
partido_grupo(m_2018_25, group_d).
partido_grupo(m_2018_26, group_e).
partido_grupo(m_2018_27, group_g).
partido_grupo(m_2018_28, group_f).
partido_grupo(m_2018_29, group_f).
partido_grupo(m_2018_30, group_g).
partido_grupo(m_2018_31, group_h).
partido_grupo(m_2018_32, group_h).
partido_grupo(m_2018_33, group_a).
partido_grupo(m_2018_34, group_a).
partido_grupo(m_2018_35, group_b).
partido_grupo(m_2018_36, group_b).
partido_grupo(m_2018_37, group_c).
partido_grupo(m_2018_38, group_c).
partido_grupo(m_2018_39, group_d).
partido_grupo(m_2018_40, group_d).
partido_grupo(m_2018_41, group_f).
partido_grupo(m_2018_42, group_f).
partido_grupo(m_2018_43, group_e).
partido_grupo(m_2018_44, group_e).
partido_grupo(m_2018_45, group_h).
partido_grupo(m_2018_46, group_h).
partido_grupo(m_2018_47, group_g).
partido_grupo(m_2018_48, group_g).
partido_grupo(m_2022_01, group_a).
partido_grupo(m_2022_02, group_b).
partido_grupo(m_2022_03, group_a).
partido_grupo(m_2022_04, group_b).
partido_grupo(m_2022_05, group_c).
partido_grupo(m_2022_06, group_d).
partido_grupo(m_2022_07, group_c).
partido_grupo(m_2022_08, group_d).
partido_grupo(m_2022_09, group_f).
partido_grupo(m_2022_10, group_e).
partido_grupo(m_2022_11, group_e).
partido_grupo(m_2022_12, group_f).
partido_grupo(m_2022_13, group_g).
partido_grupo(m_2022_14, group_h).
partido_grupo(m_2022_15, group_h).
partido_grupo(m_2022_16, group_g).
partido_grupo(m_2022_17, group_b).
partido_grupo(m_2022_18, group_a).
partido_grupo(m_2022_19, group_a).
partido_grupo(m_2022_20, group_b).
partido_grupo(m_2022_21, group_d).
partido_grupo(m_2022_22, group_c).
partido_grupo(m_2022_23, group_d).
partido_grupo(m_2022_24, group_c).
partido_grupo(m_2022_25, group_e).
partido_grupo(m_2022_26, group_f).
partido_grupo(m_2022_27, group_f).
partido_grupo(m_2022_28, group_e).
partido_grupo(m_2022_29, group_g).
partido_grupo(m_2022_30, group_h).
partido_grupo(m_2022_31, group_g).
partido_grupo(m_2022_32, group_h).
partido_grupo(m_2022_33, group_a).
partido_grupo(m_2022_34, group_a).
partido_grupo(m_2022_35, group_b).
partido_grupo(m_2022_36, group_b).
partido_grupo(m_2022_37, group_d).
partido_grupo(m_2022_38, group_d).
partido_grupo(m_2022_39, group_c).
partido_grupo(m_2022_40, group_c).
partido_grupo(m_2022_41, group_f).
partido_grupo(m_2022_42, group_f).
partido_grupo(m_2022_43, group_e).
partido_grupo(m_2022_44, group_e).
partido_grupo(m_2022_45, group_h).
partido_grupo(m_2022_46, group_h).
partido_grupo(m_2022_47, group_g).
partido_grupo(m_2022_48, group_g).

% partido_fecha(Id, date(A,M,D)).
partido_fecha(m_1930_01, date(1930,7,13)).
partido_fecha(m_1930_02, date(1930,7,13)).
partido_fecha(m_1930_03, date(1930,7,14)).
partido_fecha(m_1930_04, date(1930,7,14)).
partido_fecha(m_1930_05, date(1930,7,15)).
partido_fecha(m_1930_06, date(1930,7,16)).
partido_fecha(m_1930_07, date(1930,7,17)).
partido_fecha(m_1930_08, date(1930,7,17)).
partido_fecha(m_1930_09, date(1930,7,18)).
partido_fecha(m_1930_10, date(1930,7,19)).
partido_fecha(m_1930_11, date(1930,7,19)).
partido_fecha(m_1930_12, date(1930,7,20)).
partido_fecha(m_1930_13, date(1930,7,20)).
partido_fecha(m_1930_14, date(1930,7,21)).
partido_fecha(m_1930_15, date(1930,7,22)).
partido_fecha(m_1930_16, date(1930,7,26)).
partido_fecha(m_1930_17, date(1930,7,27)).
partido_fecha(m_1930_18, date(1930,7,30)).
partido_fecha(m_1934_01, date(1934,5,27)).
partido_fecha(m_1934_02, date(1934,5,27)).
partido_fecha(m_1934_03, date(1934,5,27)).
partido_fecha(m_1934_04, date(1934,5,27)).
partido_fecha(m_1934_05, date(1934,5,27)).
partido_fecha(m_1934_06, date(1934,5,27)).
partido_fecha(m_1934_07, date(1934,5,27)).
partido_fecha(m_1934_08, date(1934,5,27)).
partido_fecha(m_1934_09, date(1934,5,31)).
partido_fecha(m_1934_10, date(1934,5,31)).
partido_fecha(m_1934_11, date(1934,5,31)).
partido_fecha(m_1934_12, date(1934,5,31)).
partido_fecha(m_1934_13, date(1934,6,1)).
partido_fecha(m_1934_14, date(1934,6,3)).
partido_fecha(m_1934_15, date(1934,6,3)).
partido_fecha(m_1934_16, date(1934,6,7)).
partido_fecha(m_1934_17, date(1934,6,10)).
partido_fecha(m_1938_01, date(1938,6,4)).
partido_fecha(m_1938_02, date(1938,6,5)).
partido_fecha(m_1938_03, date(1938,6,5)).
partido_fecha(m_1938_04, date(1938,6,5)).
partido_fecha(m_1938_05, date(1938,6,5)).
partido_fecha(m_1938_06, date(1938,6,5)).
partido_fecha(m_1938_07, date(1938,6,5)).
partido_fecha(m_1938_08, date(1938,6,9)).
partido_fecha(m_1938_09, date(1938,6,9)).
partido_fecha(m_1938_10, date(1938,6,12)).
partido_fecha(m_1938_11, date(1938,6,12)).
partido_fecha(m_1938_12, date(1938,6,12)).
partido_fecha(m_1938_13, date(1938,6,12)).
partido_fecha(m_1938_14, date(1938,6,14)).
partido_fecha(m_1938_15, date(1938,6,16)).
partido_fecha(m_1938_16, date(1938,6,16)).
partido_fecha(m_1938_17, date(1938,6,19)).
partido_fecha(m_1938_18, date(1938,6,19)).
partido_fecha(m_1950_01, date(1950,6,24)).
partido_fecha(m_1950_02, date(1950,6,25)).
partido_fecha(m_1950_03, date(1950,6,25)).
partido_fecha(m_1950_04, date(1950,6,25)).
partido_fecha(m_1950_05, date(1950,6,25)).
partido_fecha(m_1950_06, date(1950,6,28)).
partido_fecha(m_1950_07, date(1950,6,28)).
partido_fecha(m_1950_08, date(1950,6,29)).
partido_fecha(m_1950_09, date(1950,6,29)).
partido_fecha(m_1950_10, date(1950,6,29)).
partido_fecha(m_1950_11, date(1950,7,1)).
partido_fecha(m_1950_12, date(1950,7,2)).
partido_fecha(m_1950_13, date(1950,7,2)).
partido_fecha(m_1950_14, date(1950,7,2)).
partido_fecha(m_1950_15, date(1950,7,2)).
partido_fecha(m_1950_16, date(1950,7,2)).
partido_fecha(m_1950_17, date(1950,7,9)).
partido_fecha(m_1950_18, date(1950,7,9)).
partido_fecha(m_1950_19, date(1950,7,13)).
partido_fecha(m_1950_20, date(1950,7,13)).
partido_fecha(m_1950_21, date(1950,7,16)).
partido_fecha(m_1950_22, date(1950,7,16)).
partido_fecha(m_1954_01, date(1954,6,16)).
partido_fecha(m_1954_02, date(1954,6,16)).
partido_fecha(m_1954_03, date(1954,6,16)).
partido_fecha(m_1954_04, date(1954,6,16)).
partido_fecha(m_1954_05, date(1954,6,17)).
partido_fecha(m_1954_06, date(1954,6,17)).
partido_fecha(m_1954_07, date(1954,6,17)).
partido_fecha(m_1954_08, date(1954,6,17)).
partido_fecha(m_1954_09, date(1954,6,19)).
partido_fecha(m_1954_10, date(1954,6,19)).
partido_fecha(m_1954_11, date(1954,6,19)).
partido_fecha(m_1954_12, date(1954,6,19)).
partido_fecha(m_1954_13, date(1954,6,20)).
partido_fecha(m_1954_14, date(1954,6,20)).
partido_fecha(m_1954_15, date(1954,6,20)).
partido_fecha(m_1954_16, date(1954,6,20)).
partido_fecha(m_1954_17, date(1954,6,23)).
partido_fecha(m_1954_18, date(1954,6,23)).
partido_fecha(m_1954_19, date(1954,6,26)).
partido_fecha(m_1954_20, date(1954,6,26)).
partido_fecha(m_1954_21, date(1954,6,27)).
partido_fecha(m_1954_22, date(1954,6,27)).
partido_fecha(m_1954_23, date(1954,6,30)).
partido_fecha(m_1954_24, date(1954,6,30)).
partido_fecha(m_1954_25, date(1954,7,3)).
partido_fecha(m_1954_26, date(1954,7,4)).
partido_fecha(m_1958_01, date(1958,6,8)).
partido_fecha(m_1958_02, date(1958,6,8)).
partido_fecha(m_1958_03, date(1958,6,8)).
partido_fecha(m_1958_04, date(1958,6,8)).
partido_fecha(m_1958_05, date(1958,6,8)).
partido_fecha(m_1958_06, date(1958,6,8)).
partido_fecha(m_1958_07, date(1958,6,8)).
partido_fecha(m_1958_08, date(1958,6,8)).
partido_fecha(m_1958_09, date(1958,6,11)).
partido_fecha(m_1958_10, date(1958,6,11)).
partido_fecha(m_1958_11, date(1958,6,11)).
partido_fecha(m_1958_12, date(1958,6,11)).
partido_fecha(m_1958_13, date(1958,6,11)).
partido_fecha(m_1958_14, date(1958,6,11)).
partido_fecha(m_1958_15, date(1958,6,11)).
partido_fecha(m_1958_16, date(1958,6,12)).
partido_fecha(m_1958_17, date(1958,6,15)).
partido_fecha(m_1958_18, date(1958,6,15)).
partido_fecha(m_1958_19, date(1958,6,15)).
partido_fecha(m_1958_20, date(1958,6,15)).
partido_fecha(m_1958_21, date(1958,6,15)).
partido_fecha(m_1958_22, date(1958,6,15)).
partido_fecha(m_1958_23, date(1958,6,15)).
partido_fecha(m_1958_24, date(1958,6,15)).
partido_fecha(m_1958_25, date(1958,6,17)).
partido_fecha(m_1958_26, date(1958,6,17)).
partido_fecha(m_1958_27, date(1958,6,17)).
partido_fecha(m_1958_28, date(1958,6,19)).
partido_fecha(m_1958_29, date(1958,6,19)).
partido_fecha(m_1958_30, date(1958,6,19)).
partido_fecha(m_1958_31, date(1958,6,19)).
partido_fecha(m_1958_32, date(1958,6,24)).
partido_fecha(m_1958_33, date(1958,6,24)).
partido_fecha(m_1958_34, date(1958,6,28)).
partido_fecha(m_1958_35, date(1958,6,29)).
partido_fecha(m_1962_01, date(1962,5,30)).
partido_fecha(m_1962_02, date(1962,5,30)).
partido_fecha(m_1962_03, date(1962,5,30)).
partido_fecha(m_1962_04, date(1962,5,30)).
partido_fecha(m_1962_05, date(1962,5,31)).
partido_fecha(m_1962_06, date(1962,5,31)).
partido_fecha(m_1962_07, date(1962,5,31)).
partido_fecha(m_1962_08, date(1962,5,31)).
partido_fecha(m_1962_09, date(1962,6,2)).
partido_fecha(m_1962_10, date(1962,6,2)).
partido_fecha(m_1962_11, date(1962,6,2)).
partido_fecha(m_1962_12, date(1962,6,2)).
partido_fecha(m_1962_13, date(1962,6,3)).
partido_fecha(m_1962_14, date(1962,6,3)).
partido_fecha(m_1962_15, date(1962,6,3)).
partido_fecha(m_1962_16, date(1962,6,3)).
partido_fecha(m_1962_17, date(1962,6,6)).
partido_fecha(m_1962_18, date(1962,6,6)).
partido_fecha(m_1962_19, date(1962,6,6)).
partido_fecha(m_1962_20, date(1962,6,6)).
partido_fecha(m_1962_21, date(1962,6,7)).
partido_fecha(m_1962_22, date(1962,6,7)).
partido_fecha(m_1962_23, date(1962,6,7)).
partido_fecha(m_1962_24, date(1962,6,7)).
partido_fecha(m_1962_25, date(1962,6,10)).
partido_fecha(m_1962_26, date(1962,6,10)).
partido_fecha(m_1962_27, date(1962,6,10)).
partido_fecha(m_1962_28, date(1962,6,10)).
partido_fecha(m_1962_29, date(1962,6,13)).
partido_fecha(m_1962_30, date(1962,6,13)).
partido_fecha(m_1962_31, date(1962,6,16)).
partido_fecha(m_1962_32, date(1962,6,17)).
partido_fecha(m_1966_01, date(1966,7,11)).
partido_fecha(m_1966_02, date(1966,7,12)).
partido_fecha(m_1966_03, date(1966,7,12)).
partido_fecha(m_1966_04, date(1966,7,12)).
partido_fecha(m_1966_05, date(1966,7,13)).
partido_fecha(m_1966_06, date(1966,7,13)).
partido_fecha(m_1966_07, date(1966,7,13)).
partido_fecha(m_1966_08, date(1966,7,13)).
partido_fecha(m_1966_09, date(1966,7,15)).
partido_fecha(m_1966_10, date(1966,7,15)).
partido_fecha(m_1966_11, date(1966,7,15)).
partido_fecha(m_1966_12, date(1966,7,15)).
partido_fecha(m_1966_13, date(1966,7,16)).
partido_fecha(m_1966_14, date(1966,7,16)).
partido_fecha(m_1966_15, date(1966,7,16)).
partido_fecha(m_1966_16, date(1966,7,16)).
partido_fecha(m_1966_17, date(1966,7,19)).
partido_fecha(m_1966_18, date(1966,7,19)).
partido_fecha(m_1966_19, date(1966,7,19)).
partido_fecha(m_1966_20, date(1966,7,19)).
partido_fecha(m_1966_21, date(1966,7,20)).
partido_fecha(m_1966_22, date(1966,7,20)).
partido_fecha(m_1966_23, date(1966,7,20)).
partido_fecha(m_1966_24, date(1966,7,20)).
partido_fecha(m_1966_25, date(1966,7,23)).
partido_fecha(m_1966_26, date(1966,7,23)).
partido_fecha(m_1966_27, date(1966,7,23)).
partido_fecha(m_1966_28, date(1966,7,23)).
partido_fecha(m_1966_29, date(1966,7,25)).
partido_fecha(m_1966_30, date(1966,7,26)).
partido_fecha(m_1966_31, date(1966,7,28)).
partido_fecha(m_1966_32, date(1966,7,30)).
partido_fecha(m_1970_01, date(1970,5,31)).
partido_fecha(m_1970_02, date(1970,6,2)).
partido_fecha(m_1970_03, date(1970,6,2)).
partido_fecha(m_1970_04, date(1970,6,2)).
partido_fecha(m_1970_05, date(1970,6,3)).
partido_fecha(m_1970_06, date(1970,6,3)).
partido_fecha(m_1970_07, date(1970,6,3)).
partido_fecha(m_1970_08, date(1970,6,3)).
partido_fecha(m_1970_09, date(1970,6,6)).
partido_fecha(m_1970_10, date(1970,6,6)).
partido_fecha(m_1970_11, date(1970,6,6)).
partido_fecha(m_1970_12, date(1970,6,6)).
partido_fecha(m_1970_13, date(1970,6,7)).
partido_fecha(m_1970_14, date(1970,6,7)).
partido_fecha(m_1970_15, date(1970,6,7)).
partido_fecha(m_1970_16, date(1970,6,7)).
partido_fecha(m_1970_17, date(1970,6,10)).
partido_fecha(m_1970_18, date(1970,6,10)).
partido_fecha(m_1970_19, date(1970,6,10)).
partido_fecha(m_1970_20, date(1970,6,10)).
partido_fecha(m_1970_21, date(1970,6,11)).
partido_fecha(m_1970_22, date(1970,6,11)).
partido_fecha(m_1970_23, date(1970,6,11)).
partido_fecha(m_1970_24, date(1970,6,11)).
partido_fecha(m_1970_25, date(1970,6,14)).
partido_fecha(m_1970_26, date(1970,6,14)).
partido_fecha(m_1970_27, date(1970,6,14)).
partido_fecha(m_1970_28, date(1970,6,14)).
partido_fecha(m_1970_29, date(1970,6,17)).
partido_fecha(m_1970_30, date(1970,6,17)).
partido_fecha(m_1970_31, date(1970,6,20)).
partido_fecha(m_1970_32, date(1970,6,21)).
partido_fecha(m_1974_01, date(1974,6,13)).
partido_fecha(m_1974_02, date(1974,6,14)).
partido_fecha(m_1974_03, date(1974,6,14)).
partido_fecha(m_1974_04, date(1974,6,14)).
partido_fecha(m_1974_05, date(1974,6,15)).
partido_fecha(m_1974_06, date(1974,6,15)).
partido_fecha(m_1974_07, date(1974,6,15)).
partido_fecha(m_1974_08, date(1974,6,15)).
partido_fecha(m_1974_09, date(1974,6,18)).
partido_fecha(m_1974_10, date(1974,6,18)).
partido_fecha(m_1974_11, date(1974,6,18)).
partido_fecha(m_1974_12, date(1974,6,18)).
partido_fecha(m_1974_13, date(1974,6,19)).
partido_fecha(m_1974_14, date(1974,6,19)).
partido_fecha(m_1974_15, date(1974,6,19)).
partido_fecha(m_1974_16, date(1974,6,19)).
partido_fecha(m_1974_17, date(1974,6,22)).
partido_fecha(m_1974_18, date(1974,6,22)).
partido_fecha(m_1974_19, date(1974,6,22)).
partido_fecha(m_1974_20, date(1974,6,22)).
partido_fecha(m_1974_21, date(1974,6,23)).
partido_fecha(m_1974_22, date(1974,6,23)).
partido_fecha(m_1974_23, date(1974,6,23)).
partido_fecha(m_1974_24, date(1974,6,23)).
partido_fecha(m_1974_25, date(1974,6,26)).
partido_fecha(m_1974_26, date(1974,6,26)).
partido_fecha(m_1974_27, date(1974,6,26)).
partido_fecha(m_1974_28, date(1974,6,26)).
partido_fecha(m_1974_29, date(1974,6,30)).
partido_fecha(m_1974_30, date(1974,6,30)).
partido_fecha(m_1974_31, date(1974,6,30)).
partido_fecha(m_1974_32, date(1974,6,30)).
partido_fecha(m_1974_33, date(1974,7,3)).
partido_fecha(m_1974_34, date(1974,7,3)).
partido_fecha(m_1974_35, date(1974,7,3)).
partido_fecha(m_1974_36, date(1974,7,3)).
partido_fecha(m_1974_37, date(1974,7,6)).
partido_fecha(m_1974_38, date(1974,7,7)).
partido_fecha(m_1978_01, date(1978,6,1)).
partido_fecha(m_1978_02, date(1978,6,2)).
partido_fecha(m_1978_03, date(1978,6,2)).
partido_fecha(m_1978_04, date(1978,6,2)).
partido_fecha(m_1978_05, date(1978,6,3)).
partido_fecha(m_1978_06, date(1978,6,3)).
partido_fecha(m_1978_07, date(1978,6,3)).
partido_fecha(m_1978_08, date(1978,6,3)).
partido_fecha(m_1978_09, date(1978,6,6)).
partido_fecha(m_1978_10, date(1978,6,6)).
partido_fecha(m_1978_11, date(1978,6,6)).
partido_fecha(m_1978_12, date(1978,6,6)).
partido_fecha(m_1978_13, date(1978,6,7)).
partido_fecha(m_1978_14, date(1978,6,7)).
partido_fecha(m_1978_15, date(1978,6,7)).
partido_fecha(m_1978_16, date(1978,6,7)).
partido_fecha(m_1978_17, date(1978,6,10)).
partido_fecha(m_1978_18, date(1978,6,10)).
partido_fecha(m_1978_19, date(1978,6,10)).
partido_fecha(m_1978_20, date(1978,6,10)).
partido_fecha(m_1978_21, date(1978,6,11)).
partido_fecha(m_1978_22, date(1978,6,11)).
partido_fecha(m_1978_23, date(1978,6,11)).
partido_fecha(m_1978_24, date(1978,6,11)).
partido_fecha(m_1978_25, date(1978,6,14)).
partido_fecha(m_1978_26, date(1978,6,14)).
partido_fecha(m_1978_27, date(1978,6,14)).
partido_fecha(m_1978_28, date(1978,6,14)).
partido_fecha(m_1978_29, date(1978,6,18)).
partido_fecha(m_1978_30, date(1978,6,18)).
partido_fecha(m_1978_31, date(1978,6,18)).
partido_fecha(m_1978_32, date(1978,6,18)).
partido_fecha(m_1978_33, date(1978,6,21)).
partido_fecha(m_1978_34, date(1978,6,21)).
partido_fecha(m_1978_35, date(1978,6,21)).
partido_fecha(m_1978_36, date(1978,6,21)).
partido_fecha(m_1978_37, date(1978,6,24)).
partido_fecha(m_1978_38, date(1978,6,25)).
partido_fecha(m_1982_01, date(1982,6,13)).
partido_fecha(m_1982_02, date(1982,6,14)).
partido_fecha(m_1982_03, date(1982,6,14)).
partido_fecha(m_1982_04, date(1982,6,15)).
partido_fecha(m_1982_05, date(1982,6,15)).
partido_fecha(m_1982_06, date(1982,6,15)).
partido_fecha(m_1982_07, date(1982,6,16)).
partido_fecha(m_1982_08, date(1982,6,16)).
partido_fecha(m_1982_09, date(1982,6,16)).
partido_fecha(m_1982_10, date(1982,6,17)).
partido_fecha(m_1982_11, date(1982,6,17)).
partido_fecha(m_1982_12, date(1982,6,17)).
partido_fecha(m_1982_13, date(1982,6,18)).
partido_fecha(m_1982_14, date(1982,6,18)).
partido_fecha(m_1982_15, date(1982,6,18)).
partido_fecha(m_1982_16, date(1982,6,19)).
partido_fecha(m_1982_17, date(1982,6,19)).
partido_fecha(m_1982_18, date(1982,6,19)).
partido_fecha(m_1982_19, date(1982,6,20)).
partido_fecha(m_1982_20, date(1982,6,20)).
partido_fecha(m_1982_21, date(1982,6,20)).
partido_fecha(m_1982_22, date(1982,6,21)).
partido_fecha(m_1982_23, date(1982,6,21)).
partido_fecha(m_1982_24, date(1982,6,21)).
partido_fecha(m_1982_25, date(1982,6,22)).
partido_fecha(m_1982_26, date(1982,6,22)).
partido_fecha(m_1982_27, date(1982,6,22)).
partido_fecha(m_1982_28, date(1982,6,23)).
partido_fecha(m_1982_29, date(1982,6,23)).
partido_fecha(m_1982_30, date(1982,6,23)).
partido_fecha(m_1982_31, date(1982,6,24)).
partido_fecha(m_1982_32, date(1982,6,24)).
partido_fecha(m_1982_33, date(1982,6,24)).
partido_fecha(m_1982_34, date(1982,6,25)).
partido_fecha(m_1982_35, date(1982,6,25)).
partido_fecha(m_1982_36, date(1982,6,25)).
partido_fecha(m_1982_37, date(1982,6,28)).
partido_fecha(m_1982_38, date(1982,6,28)).
partido_fecha(m_1982_39, date(1982,6,29)).
partido_fecha(m_1982_40, date(1982,6,29)).
partido_fecha(m_1982_41, date(1982,7,1)).
partido_fecha(m_1982_42, date(1982,7,1)).
partido_fecha(m_1982_43, date(1982,7,2)).
partido_fecha(m_1982_44, date(1982,7,2)).
partido_fecha(m_1982_45, date(1982,7,4)).
partido_fecha(m_1982_46, date(1982,7,4)).
partido_fecha(m_1982_47, date(1982,7,5)).
partido_fecha(m_1982_48, date(1982,7,5)).
partido_fecha(m_1982_49, date(1982,7,8)).
partido_fecha(m_1982_50, date(1982,7,8)).
partido_fecha(m_1982_51, date(1982,7,10)).
partido_fecha(m_1982_52, date(1982,7,11)).
partido_fecha(m_1986_01, date(1986,5,31)).
partido_fecha(m_1986_02, date(1986,6,1)).
partido_fecha(m_1986_03, date(1986,6,1)).
partido_fecha(m_1986_04, date(1986,6,2)).
partido_fecha(m_1986_05, date(1986,6,2)).
partido_fecha(m_1986_06, date(1986,6,2)).
partido_fecha(m_1986_07, date(1986,6,3)).
partido_fecha(m_1986_08, date(1986,6,3)).
partido_fecha(m_1986_09, date(1986,6,3)).
partido_fecha(m_1986_10, date(1986,6,4)).
partido_fecha(m_1986_11, date(1986,6,4)).
partido_fecha(m_1986_12, date(1986,6,4)).
partido_fecha(m_1986_13, date(1986,6,5)).
partido_fecha(m_1986_14, date(1986,6,5)).
partido_fecha(m_1986_15, date(1986,6,5)).
partido_fecha(m_1986_16, date(1986,6,6)).
partido_fecha(m_1986_17, date(1986,6,6)).
partido_fecha(m_1986_18, date(1986,6,6)).
partido_fecha(m_1986_19, date(1986,6,7)).
partido_fecha(m_1986_20, date(1986,6,7)).
partido_fecha(m_1986_21, date(1986,6,7)).
partido_fecha(m_1986_22, date(1986,6,8)).
partido_fecha(m_1986_23, date(1986,6,8)).
partido_fecha(m_1986_24, date(1986,6,8)).
partido_fecha(m_1986_25, date(1986,6,9)).
partido_fecha(m_1986_26, date(1986,6,9)).
partido_fecha(m_1986_27, date(1986,6,10)).
partido_fecha(m_1986_28, date(1986,6,10)).
partido_fecha(m_1986_29, date(1986,6,11)).
partido_fecha(m_1986_30, date(1986,6,11)).
partido_fecha(m_1986_31, date(1986,6,11)).
partido_fecha(m_1986_32, date(1986,6,11)).
partido_fecha(m_1986_33, date(1986,6,12)).
partido_fecha(m_1986_34, date(1986,6,12)).
partido_fecha(m_1986_35, date(1986,6,13)).
partido_fecha(m_1986_36, date(1986,6,13)).
partido_fecha(m_1986_37, date(1986,6,15)).
partido_fecha(m_1986_38, date(1986,6,15)).
partido_fecha(m_1986_39, date(1986,6,16)).
partido_fecha(m_1986_40, date(1986,6,16)).
partido_fecha(m_1986_41, date(1986,6,17)).
partido_fecha(m_1986_42, date(1986,6,17)).
partido_fecha(m_1986_43, date(1986,6,18)).
partido_fecha(m_1986_44, date(1986,6,18)).
partido_fecha(m_1986_45, date(1986,6,21)).
partido_fecha(m_1986_46, date(1986,6,21)).
partido_fecha(m_1986_47, date(1986,6,22)).
partido_fecha(m_1986_48, date(1986,6,22)).
partido_fecha(m_1986_49, date(1986,6,25)).
partido_fecha(m_1986_50, date(1986,6,25)).
partido_fecha(m_1986_51, date(1986,6,28)).
partido_fecha(m_1986_52, date(1986,6,29)).
partido_fecha(m_1990_01, date(1990,6,8)).
partido_fecha(m_1990_02, date(1990,6,9)).
partido_fecha(m_1990_03, date(1990,6,9)).
partido_fecha(m_1990_04, date(1990,6,9)).
partido_fecha(m_1990_05, date(1990,6,10)).
partido_fecha(m_1990_06, date(1990,6,10)).
partido_fecha(m_1990_07, date(1990,6,10)).
partido_fecha(m_1990_08, date(1990,6,11)).
partido_fecha(m_1990_09, date(1990,6,11)).
partido_fecha(m_1990_10, date(1990,6,12)).
partido_fecha(m_1990_11, date(1990,6,12)).
partido_fecha(m_1990_12, date(1990,6,13)).
partido_fecha(m_1990_13, date(1990,6,13)).
partido_fecha(m_1990_14, date(1990,6,14)).
partido_fecha(m_1990_15, date(1990,6,14)).
partido_fecha(m_1990_16, date(1990,6,14)).
partido_fecha(m_1990_17, date(1990,6,15)).
partido_fecha(m_1990_18, date(1990,6,15)).
partido_fecha(m_1990_19, date(1990,6,16)).
partido_fecha(m_1990_20, date(1990,6,16)).
partido_fecha(m_1990_21, date(1990,6,16)).
partido_fecha(m_1990_22, date(1990,6,17)).
partido_fecha(m_1990_23, date(1990,6,17)).
partido_fecha(m_1990_24, date(1990,6,17)).
partido_fecha(m_1990_25, date(1990,6,18)).
partido_fecha(m_1990_26, date(1990,6,18)).
partido_fecha(m_1990_27, date(1990,6,19)).
partido_fecha(m_1990_28, date(1990,6,19)).
partido_fecha(m_1990_29, date(1990,6,19)).
partido_fecha(m_1990_30, date(1990,6,19)).
partido_fecha(m_1990_31, date(1990,6,20)).
partido_fecha(m_1990_32, date(1990,6,20)).
partido_fecha(m_1990_33, date(1990,6,21)).
partido_fecha(m_1990_34, date(1990,6,21)).
partido_fecha(m_1990_35, date(1990,6,21)).
partido_fecha(m_1990_36, date(1990,6,21)).
partido_fecha(m_1990_37, date(1990,6,23)).
partido_fecha(m_1990_38, date(1990,6,23)).
partido_fecha(m_1990_39, date(1990,6,24)).
partido_fecha(m_1990_40, date(1990,6,24)).
partido_fecha(m_1990_41, date(1990,6,25)).
partido_fecha(m_1990_42, date(1990,6,25)).
partido_fecha(m_1990_43, date(1990,6,26)).
partido_fecha(m_1990_44, date(1990,6,26)).
partido_fecha(m_1990_45, date(1990,6,30)).
partido_fecha(m_1990_46, date(1990,6,30)).
partido_fecha(m_1990_47, date(1990,7,1)).
partido_fecha(m_1990_48, date(1990,7,1)).
partido_fecha(m_1990_49, date(1990,7,3)).
partido_fecha(m_1990_50, date(1990,7,4)).
partido_fecha(m_1990_51, date(1990,7,7)).
partido_fecha(m_1990_52, date(1990,7,8)).
partido_fecha(m_1994_01, date(1994,6,17)).
partido_fecha(m_1994_02, date(1994,6,17)).
partido_fecha(m_1994_03, date(1994,6,18)).
partido_fecha(m_1994_04, date(1994,6,18)).
partido_fecha(m_1994_05, date(1994,6,18)).
partido_fecha(m_1994_06, date(1994,6,19)).
partido_fecha(m_1994_07, date(1994,6,19)).
partido_fecha(m_1994_08, date(1994,6,19)).
partido_fecha(m_1994_09, date(1994,6,20)).
partido_fecha(m_1994_10, date(1994,6,20)).
partido_fecha(m_1994_11, date(1994,6,21)).
partido_fecha(m_1994_12, date(1994,6,21)).
partido_fecha(m_1994_13, date(1994,6,21)).
partido_fecha(m_1994_14, date(1994,6,22)).
partido_fecha(m_1994_15, date(1994,6,22)).
partido_fecha(m_1994_16, date(1994,6,23)).
partido_fecha(m_1994_17, date(1994,6,23)).
partido_fecha(m_1994_18, date(1994,6,24)).
partido_fecha(m_1994_19, date(1994,6,24)).
partido_fecha(m_1994_20, date(1994,6,24)).
partido_fecha(m_1994_21, date(1994,6,25)).
partido_fecha(m_1994_22, date(1994,6,25)).
partido_fecha(m_1994_23, date(1994,6,25)).
partido_fecha(m_1994_24, date(1994,6,26)).
partido_fecha(m_1994_25, date(1994,6,26)).
partido_fecha(m_1994_26, date(1994,6,26)).
partido_fecha(m_1994_27, date(1994,6,27)).
partido_fecha(m_1994_28, date(1994,6,27)).
partido_fecha(m_1994_29, date(1994,6,28)).
partido_fecha(m_1994_30, date(1994,6,28)).
partido_fecha(m_1994_31, date(1994,6,28)).
partido_fecha(m_1994_32, date(1994,6,28)).
partido_fecha(m_1994_33, date(1994,6,29)).
partido_fecha(m_1994_34, date(1994,6,29)).
partido_fecha(m_1994_35, date(1994,6,30)).
partido_fecha(m_1994_36, date(1994,6,30)).
partido_fecha(m_1994_37, date(1994,7,2)).
partido_fecha(m_1994_38, date(1994,7,2)).
partido_fecha(m_1994_39, date(1994,7,3)).
partido_fecha(m_1994_40, date(1994,7,3)).
partido_fecha(m_1994_41, date(1994,7,4)).
partido_fecha(m_1994_42, date(1994,7,4)).
partido_fecha(m_1994_43, date(1994,7,5)).
partido_fecha(m_1994_44, date(1994,7,5)).
partido_fecha(m_1994_45, date(1994,7,9)).
partido_fecha(m_1994_46, date(1994,7,9)).
partido_fecha(m_1994_47, date(1994,7,10)).
partido_fecha(m_1994_48, date(1994,7,10)).
partido_fecha(m_1994_49, date(1994,7,13)).
partido_fecha(m_1994_50, date(1994,7,13)).
partido_fecha(m_1994_51, date(1994,7,16)).
partido_fecha(m_1994_52, date(1994,7,17)).
partido_fecha(m_1998_01, date(1998,6,10)).
partido_fecha(m_1998_02, date(1998,6,10)).
partido_fecha(m_1998_03, date(1998,6,11)).
partido_fecha(m_1998_04, date(1998,6,11)).
partido_fecha(m_1998_05, date(1998,6,12)).
partido_fecha(m_1998_06, date(1998,6,12)).
partido_fecha(m_1998_07, date(1998,6,12)).
partido_fecha(m_1998_08, date(1998,6,13)).
partido_fecha(m_1998_09, date(1998,6,13)).
partido_fecha(m_1998_10, date(1998,6,13)).
partido_fecha(m_1998_11, date(1998,6,14)).
partido_fecha(m_1998_12, date(1998,6,14)).
partido_fecha(m_1998_13, date(1998,6,14)).
partido_fecha(m_1998_14, date(1998,6,15)).
partido_fecha(m_1998_15, date(1998,6,15)).
partido_fecha(m_1998_16, date(1998,6,15)).
partido_fecha(m_1998_17, date(1998,6,16)).
partido_fecha(m_1998_18, date(1998,6,16)).
partido_fecha(m_1998_19, date(1998,6,17)).
partido_fecha(m_1998_20, date(1998,6,17)).
partido_fecha(m_1998_21, date(1998,6,18)).
partido_fecha(m_1998_22, date(1998,6,18)).
partido_fecha(m_1998_23, date(1998,6,19)).
partido_fecha(m_1998_24, date(1998,6,19)).
partido_fecha(m_1998_25, date(1998,6,20)).
partido_fecha(m_1998_26, date(1998,6,20)).
partido_fecha(m_1998_27, date(1998,6,20)).
partido_fecha(m_1998_28, date(1998,6,21)).
partido_fecha(m_1998_29, date(1998,6,21)).
partido_fecha(m_1998_30, date(1998,6,21)).
partido_fecha(m_1998_31, date(1998,6,22)).
partido_fecha(m_1998_32, date(1998,6,22)).
partido_fecha(m_1998_33, date(1998,6,23)).
partido_fecha(m_1998_34, date(1998,6,23)).
partido_fecha(m_1998_35, date(1998,6,23)).
partido_fecha(m_1998_36, date(1998,6,23)).
partido_fecha(m_1998_37, date(1998,6,24)).
partido_fecha(m_1998_38, date(1998,6,24)).
partido_fecha(m_1998_39, date(1998,6,24)).
partido_fecha(m_1998_40, date(1998,6,24)).
partido_fecha(m_1998_41, date(1998,6,25)).
partido_fecha(m_1998_42, date(1998,6,25)).
partido_fecha(m_1998_43, date(1998,6,25)).
partido_fecha(m_1998_44, date(1998,6,25)).
partido_fecha(m_1998_45, date(1998,6,26)).
partido_fecha(m_1998_46, date(1998,6,26)).
partido_fecha(m_1998_47, date(1998,6,26)).
partido_fecha(m_1998_48, date(1998,6,26)).
partido_fecha(m_1998_49, date(1998,6,27)).
partido_fecha(m_1998_50, date(1998,6,27)).
partido_fecha(m_1998_51, date(1998,6,28)).
partido_fecha(m_1998_52, date(1998,6,28)).
partido_fecha(m_1998_53, date(1998,6,29)).
partido_fecha(m_1998_54, date(1998,6,29)).
partido_fecha(m_1998_55, date(1998,6,30)).
partido_fecha(m_1998_56, date(1998,6,30)).
partido_fecha(m_1998_57, date(1998,7,3)).
partido_fecha(m_1998_58, date(1998,7,3)).
partido_fecha(m_1998_59, date(1998,7,4)).
partido_fecha(m_1998_60, date(1998,7,4)).
partido_fecha(m_1998_61, date(1998,7,7)).
partido_fecha(m_1998_62, date(1998,7,8)).
partido_fecha(m_1998_63, date(1998,7,11)).
partido_fecha(m_1998_64, date(1998,7,12)).
partido_fecha(m_2002_01, date(2002,5,31)).
partido_fecha(m_2002_02, date(2002,6,1)).
partido_fecha(m_2002_03, date(2002,6,1)).
partido_fecha(m_2002_04, date(2002,6,1)).
partido_fecha(m_2002_05, date(2002,6,2)).
partido_fecha(m_2002_06, date(2002,6,2)).
partido_fecha(m_2002_07, date(2002,6,2)).
partido_fecha(m_2002_08, date(2002,6,2)).
partido_fecha(m_2002_09, date(2002,6,3)).
partido_fecha(m_2002_10, date(2002,6,3)).
partido_fecha(m_2002_11, date(2002,6,3)).
partido_fecha(m_2002_12, date(2002,6,4)).
partido_fecha(m_2002_13, date(2002,6,4)).
partido_fecha(m_2002_14, date(2002,6,4)).
partido_fecha(m_2002_15, date(2002,6,5)).
partido_fecha(m_2002_16, date(2002,6,5)).
partido_fecha(m_2002_17, date(2002,6,5)).
partido_fecha(m_2002_18, date(2002,6,6)).
partido_fecha(m_2002_19, date(2002,6,6)).
partido_fecha(m_2002_20, date(2002,6,6)).
partido_fecha(m_2002_21, date(2002,6,7)).
partido_fecha(m_2002_22, date(2002,6,7)).
partido_fecha(m_2002_23, date(2002,6,7)).
partido_fecha(m_2002_24, date(2002,6,8)).
partido_fecha(m_2002_25, date(2002,6,8)).
partido_fecha(m_2002_26, date(2002,6,8)).
partido_fecha(m_2002_27, date(2002,6,9)).
partido_fecha(m_2002_28, date(2002,6,9)).
partido_fecha(m_2002_29, date(2002,6,9)).
partido_fecha(m_2002_30, date(2002,6,10)).
partido_fecha(m_2002_31, date(2002,6,10)).
partido_fecha(m_2002_32, date(2002,6,10)).
partido_fecha(m_2002_33, date(2002,6,11)).
partido_fecha(m_2002_34, date(2002,6,11)).
partido_fecha(m_2002_35, date(2002,6,11)).
partido_fecha(m_2002_36, date(2002,6,11)).
partido_fecha(m_2002_37, date(2002,6,12)).
partido_fecha(m_2002_38, date(2002,6,12)).
partido_fecha(m_2002_39, date(2002,6,12)).
partido_fecha(m_2002_40, date(2002,6,12)).
partido_fecha(m_2002_41, date(2002,6,13)).
partido_fecha(m_2002_42, date(2002,6,13)).
partido_fecha(m_2002_43, date(2002,6,13)).
partido_fecha(m_2002_44, date(2002,6,13)).
partido_fecha(m_2002_45, date(2002,6,14)).
partido_fecha(m_2002_46, date(2002,6,14)).
partido_fecha(m_2002_47, date(2002,6,14)).
partido_fecha(m_2002_48, date(2002,6,14)).
partido_fecha(m_2002_49, date(2002,6,15)).
partido_fecha(m_2002_50, date(2002,6,15)).
partido_fecha(m_2002_51, date(2002,6,16)).
partido_fecha(m_2002_52, date(2002,6,16)).
partido_fecha(m_2002_53, date(2002,6,17)).
partido_fecha(m_2002_54, date(2002,6,17)).
partido_fecha(m_2002_55, date(2002,6,18)).
partido_fecha(m_2002_56, date(2002,6,18)).
partido_fecha(m_2002_57, date(2002,6,21)).
partido_fecha(m_2002_58, date(2002,6,21)).
partido_fecha(m_2002_59, date(2002,6,22)).
partido_fecha(m_2002_60, date(2002,6,22)).
partido_fecha(m_2002_61, date(2002,6,25)).
partido_fecha(m_2002_62, date(2002,6,26)).
partido_fecha(m_2002_63, date(2002,6,29)).
partido_fecha(m_2002_64, date(2002,6,30)).
partido_fecha(m_2006_01, date(2006,6,9)).
partido_fecha(m_2006_02, date(2006,6,9)).
partido_fecha(m_2006_03, date(2006,6,10)).
partido_fecha(m_2006_04, date(2006,6,10)).
partido_fecha(m_2006_05, date(2006,6,10)).
partido_fecha(m_2006_06, date(2006,6,11)).
partido_fecha(m_2006_07, date(2006,6,11)).
partido_fecha(m_2006_08, date(2006,6,11)).
partido_fecha(m_2006_09, date(2006,6,12)).
partido_fecha(m_2006_10, date(2006,6,12)).
partido_fecha(m_2006_11, date(2006,6,12)).
partido_fecha(m_2006_12, date(2006,6,13)).
partido_fecha(m_2006_13, date(2006,6,13)).
partido_fecha(m_2006_14, date(2006,6,13)).
partido_fecha(m_2006_15, date(2006,6,14)).
partido_fecha(m_2006_16, date(2006,6,14)).
partido_fecha(m_2006_17, date(2006,6,14)).
partido_fecha(m_2006_18, date(2006,6,15)).
partido_fecha(m_2006_19, date(2006,6,15)).
partido_fecha(m_2006_20, date(2006,6,15)).
partido_fecha(m_2006_21, date(2006,6,16)).
partido_fecha(m_2006_22, date(2006,6,16)).
partido_fecha(m_2006_23, date(2006,6,16)).
partido_fecha(m_2006_24, date(2006,6,17)).
partido_fecha(m_2006_25, date(2006,6,17)).
partido_fecha(m_2006_26, date(2006,6,17)).
partido_fecha(m_2006_27, date(2006,6,18)).
partido_fecha(m_2006_28, date(2006,6,18)).
partido_fecha(m_2006_29, date(2006,6,18)).
partido_fecha(m_2006_30, date(2006,6,19)).
partido_fecha(m_2006_31, date(2006,6,19)).
partido_fecha(m_2006_32, date(2006,6,19)).
partido_fecha(m_2006_33, date(2006,6,20)).
partido_fecha(m_2006_34, date(2006,6,20)).
partido_fecha(m_2006_35, date(2006,6,20)).
partido_fecha(m_2006_36, date(2006,6,20)).
partido_fecha(m_2006_37, date(2006,6,21)).
partido_fecha(m_2006_38, date(2006,6,21)).
partido_fecha(m_2006_39, date(2006,6,21)).
partido_fecha(m_2006_40, date(2006,6,21)).
partido_fecha(m_2006_41, date(2006,6,22)).
partido_fecha(m_2006_42, date(2006,6,22)).
partido_fecha(m_2006_43, date(2006,6,22)).
partido_fecha(m_2006_44, date(2006,6,22)).
partido_fecha(m_2006_45, date(2006,6,23)).
partido_fecha(m_2006_46, date(2006,6,23)).
partido_fecha(m_2006_47, date(2006,6,23)).
partido_fecha(m_2006_48, date(2006,6,23)).
partido_fecha(m_2006_49, date(2006,6,24)).
partido_fecha(m_2006_50, date(2006,6,24)).
partido_fecha(m_2006_51, date(2006,6,25)).
partido_fecha(m_2006_52, date(2006,6,25)).
partido_fecha(m_2006_53, date(2006,6,26)).
partido_fecha(m_2006_54, date(2006,6,26)).
partido_fecha(m_2006_55, date(2006,6,27)).
partido_fecha(m_2006_56, date(2006,6,27)).
partido_fecha(m_2006_57, date(2006,6,30)).
partido_fecha(m_2006_58, date(2006,6,30)).
partido_fecha(m_2006_59, date(2006,7,1)).
partido_fecha(m_2006_60, date(2006,7,1)).
partido_fecha(m_2006_61, date(2006,7,4)).
partido_fecha(m_2006_62, date(2006,7,5)).
partido_fecha(m_2006_63, date(2006,7,8)).
partido_fecha(m_2006_64, date(2006,7,9)).
partido_fecha(m_2010_01, date(2010,6,11)).
partido_fecha(m_2010_02, date(2010,6,11)).
partido_fecha(m_2010_03, date(2010,6,12)).
partido_fecha(m_2010_04, date(2010,6,12)).
partido_fecha(m_2010_05, date(2010,6,12)).
partido_fecha(m_2010_06, date(2010,6,13)).
partido_fecha(m_2010_07, date(2010,6,13)).
partido_fecha(m_2010_08, date(2010,6,13)).
partido_fecha(m_2010_09, date(2010,6,14)).
partido_fecha(m_2010_10, date(2010,6,14)).
partido_fecha(m_2010_11, date(2010,6,14)).
partido_fecha(m_2010_12, date(2010,6,15)).
partido_fecha(m_2010_13, date(2010,6,15)).
partido_fecha(m_2010_14, date(2010,6,15)).
partido_fecha(m_2010_15, date(2010,6,16)).
partido_fecha(m_2010_16, date(2010,6,16)).
partido_fecha(m_2010_17, date(2010,6,16)).
partido_fecha(m_2010_18, date(2010,6,17)).
partido_fecha(m_2010_19, date(2010,6,17)).
partido_fecha(m_2010_20, date(2010,6,17)).
partido_fecha(m_2010_21, date(2010,6,18)).
partido_fecha(m_2010_22, date(2010,6,18)).
partido_fecha(m_2010_23, date(2010,6,18)).
partido_fecha(m_2010_24, date(2010,6,19)).
partido_fecha(m_2010_25, date(2010,6,19)).
partido_fecha(m_2010_26, date(2010,6,19)).
partido_fecha(m_2010_27, date(2010,6,20)).
partido_fecha(m_2010_28, date(2010,6,20)).
partido_fecha(m_2010_29, date(2010,6,20)).
partido_fecha(m_2010_30, date(2010,6,21)).
partido_fecha(m_2010_31, date(2010,6,21)).
partido_fecha(m_2010_32, date(2010,6,21)).
partido_fecha(m_2010_33, date(2010,6,22)).
partido_fecha(m_2010_34, date(2010,6,22)).
partido_fecha(m_2010_35, date(2010,6,22)).
partido_fecha(m_2010_36, date(2010,6,22)).
partido_fecha(m_2010_37, date(2010,6,23)).
partido_fecha(m_2010_38, date(2010,6,23)).
partido_fecha(m_2010_39, date(2010,6,23)).
partido_fecha(m_2010_40, date(2010,6,23)).
partido_fecha(m_2010_41, date(2010,6,24)).
partido_fecha(m_2010_42, date(2010,6,24)).
partido_fecha(m_2010_43, date(2010,6,24)).
partido_fecha(m_2010_44, date(2010,6,24)).
partido_fecha(m_2010_45, date(2010,6,25)).
partido_fecha(m_2010_46, date(2010,6,25)).
partido_fecha(m_2010_47, date(2010,6,25)).
partido_fecha(m_2010_48, date(2010,6,25)).
partido_fecha(m_2010_49, date(2010,6,26)).
partido_fecha(m_2010_50, date(2010,6,26)).
partido_fecha(m_2010_51, date(2010,6,27)).
partido_fecha(m_2010_52, date(2010,6,27)).
partido_fecha(m_2010_53, date(2010,6,28)).
partido_fecha(m_2010_54, date(2010,6,28)).
partido_fecha(m_2010_55, date(2010,6,29)).
partido_fecha(m_2010_56, date(2010,6,29)).
partido_fecha(m_2010_57, date(2010,7,2)).
partido_fecha(m_2010_58, date(2010,7,2)).
partido_fecha(m_2010_59, date(2010,7,3)).
partido_fecha(m_2010_60, date(2010,7,3)).
partido_fecha(m_2010_61, date(2010,7,6)).
partido_fecha(m_2010_62, date(2010,7,7)).
partido_fecha(m_2010_63, date(2010,7,10)).
partido_fecha(m_2010_64, date(2010,7,11)).
partido_fecha(m_2014_01, date(2014,6,12)).
partido_fecha(m_2014_02, date(2014,6,13)).
partido_fecha(m_2014_03, date(2014,6,13)).
partido_fecha(m_2014_04, date(2014,6,13)).
partido_fecha(m_2014_05, date(2014,6,14)).
partido_fecha(m_2014_06, date(2014,6,14)).
partido_fecha(m_2014_07, date(2014,6,14)).
partido_fecha(m_2014_08, date(2014,6,14)).
partido_fecha(m_2014_09, date(2014,6,15)).
partido_fecha(m_2014_10, date(2014,6,15)).
partido_fecha(m_2014_11, date(2014,6,15)).
partido_fecha(m_2014_12, date(2014,6,16)).
partido_fecha(m_2014_13, date(2014,6,16)).
partido_fecha(m_2014_14, date(2014,6,16)).
partido_fecha(m_2014_15, date(2014,6,17)).
partido_fecha(m_2014_16, date(2014,6,17)).
partido_fecha(m_2014_17, date(2014,6,17)).
partido_fecha(m_2014_18, date(2014,6,18)).
partido_fecha(m_2014_19, date(2014,6,18)).
partido_fecha(m_2014_20, date(2014,6,18)).
partido_fecha(m_2014_21, date(2014,6,19)).
partido_fecha(m_2014_22, date(2014,6,19)).
partido_fecha(m_2014_23, date(2014,6,19)).
partido_fecha(m_2014_24, date(2014,6,20)).
partido_fecha(m_2014_25, date(2014,6,20)).
partido_fecha(m_2014_26, date(2014,6,20)).
partido_fecha(m_2014_27, date(2014,6,21)).
partido_fecha(m_2014_28, date(2014,6,21)).
partido_fecha(m_2014_29, date(2014,6,21)).
partido_fecha(m_2014_30, date(2014,6,22)).
partido_fecha(m_2014_31, date(2014,6,22)).
partido_fecha(m_2014_32, date(2014,6,22)).
partido_fecha(m_2014_33, date(2014,6,23)).
partido_fecha(m_2014_34, date(2014,6,23)).
partido_fecha(m_2014_35, date(2014,6,23)).
partido_fecha(m_2014_36, date(2014,6,23)).
partido_fecha(m_2014_37, date(2014,6,24)).
partido_fecha(m_2014_38, date(2014,6,24)).
partido_fecha(m_2014_39, date(2014,6,24)).
partido_fecha(m_2014_40, date(2014,6,24)).
partido_fecha(m_2014_41, date(2014,6,25)).
partido_fecha(m_2014_42, date(2014,6,25)).
partido_fecha(m_2014_43, date(2014,6,25)).
partido_fecha(m_2014_44, date(2014,6,25)).
partido_fecha(m_2014_45, date(2014,6,26)).
partido_fecha(m_2014_46, date(2014,6,26)).
partido_fecha(m_2014_47, date(2014,6,26)).
partido_fecha(m_2014_48, date(2014,6,26)).
partido_fecha(m_2014_49, date(2014,6,28)).
partido_fecha(m_2014_50, date(2014,6,28)).
partido_fecha(m_2014_51, date(2014,6,29)).
partido_fecha(m_2014_52, date(2014,6,29)).
partido_fecha(m_2014_53, date(2014,6,30)).
partido_fecha(m_2014_54, date(2014,6,30)).
partido_fecha(m_2014_55, date(2014,7,1)).
partido_fecha(m_2014_56, date(2014,7,1)).
partido_fecha(m_2014_57, date(2014,7,4)).
partido_fecha(m_2014_58, date(2014,7,4)).
partido_fecha(m_2014_59, date(2014,7,5)).
partido_fecha(m_2014_60, date(2014,7,5)).
partido_fecha(m_2014_61, date(2014,7,8)).
partido_fecha(m_2014_62, date(2014,7,9)).
partido_fecha(m_2014_63, date(2014,7,12)).
partido_fecha(m_2014_64, date(2014,7,13)).
partido_fecha(m_2018_01, date(2018,6,14)).
partido_fecha(m_2018_02, date(2018,6,15)).
partido_fecha(m_2018_03, date(2018,6,15)).
partido_fecha(m_2018_04, date(2018,6,15)).
partido_fecha(m_2018_05, date(2018,6,16)).
partido_fecha(m_2018_06, date(2018,6,16)).
partido_fecha(m_2018_07, date(2018,6,16)).
partido_fecha(m_2018_08, date(2018,6,16)).
partido_fecha(m_2018_09, date(2018,6,17)).
partido_fecha(m_2018_10, date(2018,6,17)).
partido_fecha(m_2018_11, date(2018,6,17)).
partido_fecha(m_2018_12, date(2018,6,18)).
partido_fecha(m_2018_13, date(2018,6,18)).
partido_fecha(m_2018_14, date(2018,6,18)).
partido_fecha(m_2018_15, date(2018,6,19)).
partido_fecha(m_2018_16, date(2018,6,19)).
partido_fecha(m_2018_17, date(2018,6,19)).
partido_fecha(m_2018_18, date(2018,6,20)).
partido_fecha(m_2018_19, date(2018,6,20)).
partido_fecha(m_2018_20, date(2018,6,20)).
partido_fecha(m_2018_21, date(2018,6,21)).
partido_fecha(m_2018_22, date(2018,6,21)).
partido_fecha(m_2018_23, date(2018,6,21)).
partido_fecha(m_2018_24, date(2018,6,22)).
partido_fecha(m_2018_25, date(2018,6,22)).
partido_fecha(m_2018_26, date(2018,6,22)).
partido_fecha(m_2018_27, date(2018,6,23)).
partido_fecha(m_2018_28, date(2018,6,23)).
partido_fecha(m_2018_29, date(2018,6,23)).
partido_fecha(m_2018_30, date(2018,6,24)).
partido_fecha(m_2018_31, date(2018,6,24)).
partido_fecha(m_2018_32, date(2018,6,24)).
partido_fecha(m_2018_33, date(2018,6,25)).
partido_fecha(m_2018_34, date(2018,6,25)).
partido_fecha(m_2018_35, date(2018,6,25)).
partido_fecha(m_2018_36, date(2018,6,25)).
partido_fecha(m_2018_37, date(2018,6,26)).
partido_fecha(m_2018_38, date(2018,6,26)).
partido_fecha(m_2018_39, date(2018,6,26)).
partido_fecha(m_2018_40, date(2018,6,26)).
partido_fecha(m_2018_41, date(2018,6,27)).
partido_fecha(m_2018_42, date(2018,6,27)).
partido_fecha(m_2018_43, date(2018,6,27)).
partido_fecha(m_2018_44, date(2018,6,27)).
partido_fecha(m_2018_45, date(2018,6,28)).
partido_fecha(m_2018_46, date(2018,6,28)).
partido_fecha(m_2018_47, date(2018,6,28)).
partido_fecha(m_2018_48, date(2018,6,28)).
partido_fecha(m_2018_49, date(2018,6,30)).
partido_fecha(m_2018_50, date(2018,6,30)).
partido_fecha(m_2018_51, date(2018,7,1)).
partido_fecha(m_2018_52, date(2018,7,1)).
partido_fecha(m_2018_53, date(2018,7,2)).
partido_fecha(m_2018_54, date(2018,7,2)).
partido_fecha(m_2018_55, date(2018,7,3)).
partido_fecha(m_2018_56, date(2018,7,3)).
partido_fecha(m_2018_57, date(2018,7,6)).
partido_fecha(m_2018_58, date(2018,7,6)).
partido_fecha(m_2018_59, date(2018,7,7)).
partido_fecha(m_2018_60, date(2018,7,7)).
partido_fecha(m_2018_61, date(2018,7,10)).
partido_fecha(m_2018_62, date(2018,7,11)).
partido_fecha(m_2018_63, date(2018,7,14)).
partido_fecha(m_2018_64, date(2018,7,15)).
partido_fecha(m_2022_01, date(2022,11,20)).
partido_fecha(m_2022_02, date(2022,11,21)).
partido_fecha(m_2022_03, date(2022,11,21)).
partido_fecha(m_2022_04, date(2022,11,21)).
partido_fecha(m_2022_05, date(2022,11,22)).
partido_fecha(m_2022_06, date(2022,11,22)).
partido_fecha(m_2022_07, date(2022,11,22)).
partido_fecha(m_2022_08, date(2022,11,22)).
partido_fecha(m_2022_09, date(2022,11,23)).
partido_fecha(m_2022_10, date(2022,11,23)).
partido_fecha(m_2022_11, date(2022,11,23)).
partido_fecha(m_2022_12, date(2022,11,23)).
partido_fecha(m_2022_13, date(2022,11,24)).
partido_fecha(m_2022_14, date(2022,11,24)).
partido_fecha(m_2022_15, date(2022,11,24)).
partido_fecha(m_2022_16, date(2022,11,24)).
partido_fecha(m_2022_17, date(2022,11,25)).
partido_fecha(m_2022_18, date(2022,11,25)).
partido_fecha(m_2022_19, date(2022,11,25)).
partido_fecha(m_2022_20, date(2022,11,25)).
partido_fecha(m_2022_21, date(2022,11,26)).
partido_fecha(m_2022_22, date(2022,11,26)).
partido_fecha(m_2022_23, date(2022,11,26)).
partido_fecha(m_2022_24, date(2022,11,26)).
partido_fecha(m_2022_25, date(2022,11,27)).
partido_fecha(m_2022_26, date(2022,11,27)).
partido_fecha(m_2022_27, date(2022,11,27)).
partido_fecha(m_2022_28, date(2022,11,27)).
partido_fecha(m_2022_29, date(2022,11,28)).
partido_fecha(m_2022_30, date(2022,11,28)).
partido_fecha(m_2022_31, date(2022,11,28)).
partido_fecha(m_2022_32, date(2022,11,28)).
partido_fecha(m_2022_33, date(2022,11,29)).
partido_fecha(m_2022_34, date(2022,11,29)).
partido_fecha(m_2022_35, date(2022,11,29)).
partido_fecha(m_2022_36, date(2022,11,29)).
partido_fecha(m_2022_37, date(2022,11,30)).
partido_fecha(m_2022_38, date(2022,11,30)).
partido_fecha(m_2022_39, date(2022,11,30)).
partido_fecha(m_2022_40, date(2022,11,30)).
partido_fecha(m_2022_41, date(2022,12,1)).
partido_fecha(m_2022_42, date(2022,12,1)).
partido_fecha(m_2022_43, date(2022,12,1)).
partido_fecha(m_2022_44, date(2022,12,1)).
partido_fecha(m_2022_45, date(2022,12,2)).
partido_fecha(m_2022_46, date(2022,12,2)).
partido_fecha(m_2022_47, date(2022,12,2)).
partido_fecha(m_2022_48, date(2022,12,2)).
partido_fecha(m_2022_49, date(2022,12,3)).
partido_fecha(m_2022_50, date(2022,12,3)).
partido_fecha(m_2022_51, date(2022,12,4)).
partido_fecha(m_2022_52, date(2022,12,4)).
partido_fecha(m_2022_53, date(2022,12,5)).
partido_fecha(m_2022_54, date(2022,12,5)).
partido_fecha(m_2022_55, date(2022,12,6)).
partido_fecha(m_2022_56, date(2022,12,6)).
partido_fecha(m_2022_57, date(2022,12,9)).
partido_fecha(m_2022_58, date(2022,12,9)).
partido_fecha(m_2022_59, date(2022,12,10)).
partido_fecha(m_2022_60, date(2022,12,10)).
partido_fecha(m_2022_61, date(2022,12,13)).
partido_fecha(m_2022_62, date(2022,12,14)).
partido_fecha(m_2022_63, date(2022,12,17)).
partido_fecha(m_2022_64, date(2022,12,18)).

% partido_lugar(Id, Estadio, Ciudad).
partido_lugar(m_1930_01, "Estadio Pocitos", "Montevideo").
partido_lugar(m_1930_02, "Estadio Gran Parque Central", "Montevideo").
partido_lugar(m_1930_03, "Estadio Gran Parque Central", "Montevideo").
partido_lugar(m_1930_04, "Estadio Pocitos", "Montevideo").
partido_lugar(m_1930_05, "Estadio Gran Parque Central", "Montevideo").
partido_lugar(m_1930_06, "Estadio Gran Parque Central", "Montevideo").
partido_lugar(m_1930_07, "Estadio Gran Parque Central", "Montevideo").
partido_lugar(m_1930_08, "Estadio Gran Parque Central", "Montevideo").
partido_lugar(m_1930_09, "Estadio Centenario", "Montevideo").
partido_lugar(m_1930_10, "Estadio Centenario", "Montevideo").
partido_lugar(m_1930_11, "Estadio Centenario", "Montevideo").
partido_lugar(m_1930_12, "Estadio Centenario", "Montevideo").
partido_lugar(m_1930_13, "Estadio Centenario", "Montevideo").
partido_lugar(m_1930_14, "Estadio Centenario", "Montevideo").
partido_lugar(m_1930_15, "Estadio Centenario", "Montevideo").
partido_lugar(m_1930_16, "Estadio Centenario", "Montevideo").
partido_lugar(m_1930_17, "Estadio Centenario", "Montevideo").
partido_lugar(m_1930_18, "Estadio Centenario", "Montevideo").
partido_lugar(m_1934_01, "Stadio Benito Mussolini", "Turin").
partido_lugar(m_1934_02, "Stadio Littorio", "Trieste").
partido_lugar(m_1934_03, "Stadio Giovanni Berta", "Florence").
partido_lugar(m_1934_04, "Stadio Giorgio Ascarelli", "Naples").
partido_lugar(m_1934_05, "Stadio Nazionale PNF", "Rome").
partido_lugar(m_1934_06, "Stadio Luigi Ferraris", "Genoa").
partido_lugar(m_1934_07, "Stadio Renato Dall'Ara", "Bologna").
partido_lugar(m_1934_08, "San Siro", "Milan").
partido_lugar(m_1934_09, "Stadio Renato Dall'Ara", "Bologna").
partido_lugar(m_1934_10, "Stadio Benito Mussolini", "Turin").
partido_lugar(m_1934_11, "San Siro", "Milan").
partido_lugar(m_1934_12, "Stadio Giovanni Berta", "Florence").
partido_lugar(m_1934_13, "Stadio Giovanni Berta", "Florence").
partido_lugar(m_1934_14, "Stadio Nazionale PNF", "Rome").
partido_lugar(m_1934_15, "San Siro", "Milan").
partido_lugar(m_1934_16, "Stadio Giorgio Ascarelli", "Naples").
partido_lugar(m_1934_17, "Stadio Nazionale PNF", "Rome").
partido_lugar(m_1938_01, "Parc des Princes", "Paris").
partido_lugar(m_1938_02, "Stade du T.O.E.C.", "Toulouse").
partido_lugar(m_1938_03, "Stade Olympique de Colombes", "Paris").
partido_lugar(m_1938_04, "Vélodrome Municipal", "Reims").
partido_lugar(m_1938_05, "Stade Vélodrome", "Marseille").
partido_lugar(m_1938_06, "Stade de la Meinau", "Strasbourg").
partido_lugar(m_1938_07, "Stade Jules Deschaseaux", "Le Havre").
partido_lugar(m_1938_08, "Stade du T.O.E.C.", "Toulouse").
partido_lugar(m_1938_09, "Parc des Princes", "Paris").
partido_lugar(m_1938_10, "Stade du Parc Lescure", "Bordeaux").
partido_lugar(m_1938_11, "Stade Victor Boucquey", "Lille").
partido_lugar(m_1938_12, "Stade Olympique de Colombes", "Paris").
partido_lugar(m_1938_13, "Stade du Fort Carré", "Antibes").
partido_lugar(m_1938_14, "Stade du Parc Lescure", "Bordeaux").
partido_lugar(m_1938_15, "Parc des Princes", "Paris").
partido_lugar(m_1938_16, "Stade Vélodrome", "Marseille").
partido_lugar(m_1938_17, "Stade du Parc Lescure", "Bordeaux").
partido_lugar(m_1938_18, "Stade Olympique de Colombes", "Paris").
partido_lugar(m_1950_01, "Estádio do Maracanã", "Rio de Janeiro").
partido_lugar(m_1950_02, "Estádio Independência", "Belo Horizonte").
partido_lugar(m_1950_03, "Estádio do Maracanã", "Rio de Janeiro").
partido_lugar(m_1950_04, "Estádio Vila Capanema", "Curitiba").
partido_lugar(m_1950_05, "Estádio do Pacaembu", "São Paulo").
partido_lugar(m_1950_06, "Estádio do Pacaembu", "São Paulo").
partido_lugar(m_1950_07, "Estádio dos Eucaliptos", "Porto Alegre").
partido_lugar(m_1950_08, "Estádio do Maracanã", "Rio de Janeiro").
partido_lugar(m_1950_09, "Estádio Independência", "Belo Horizonte").
partido_lugar(m_1950_10, "Estádio Vila Capanema", "Curitiba").
partido_lugar(m_1950_11, "Estádio do Maracanã", "Rio de Janeiro").
partido_lugar(m_1950_12, "Estádio Ilha do Retiro", "Recife").
partido_lugar(m_1950_13, "Estádio do Maracanã", "Rio de Janeiro").
partido_lugar(m_1950_14, "Estádio do Pacaembu", "São Paulo").
partido_lugar(m_1950_15, "Estádio Independência", "Belo Horizonte").
partido_lugar(m_1950_16, "Estádio dos Eucaliptos", "Porto Alegre").
partido_lugar(m_1950_17, "Estádio do Maracanã", "Rio de Janeiro").
partido_lugar(m_1950_18, "Estádio do Pacaembu", "São Paulo").
partido_lugar(m_1950_19, "Estádio do Maracanã", "Rio de Janeiro").
partido_lugar(m_1950_20, "Estádio do Pacaembu", "São Paulo").
partido_lugar(m_1950_21, "Estádio do Pacaembu", "São Paulo").
partido_lugar(m_1950_22, "Estádio do Maracanã", "Rio de Janeiro").
partido_lugar(m_1954_01, "Charmilles Stadium", "Geneva").
partido_lugar(m_1954_02, "Stade Olympique de la Pontaise", "Lausanne").
partido_lugar(m_1954_03, "Hardturm Stadium", "Zürich").
partido_lugar(m_1954_04, "Wankdorf Stadium", "Bern").
partido_lugar(m_1954_05, "Stade Olympique de la Pontaise", "Lausanne").
partido_lugar(m_1954_06, "Hardturm Stadium", "Zürich").
partido_lugar(m_1954_07, "Wankdorf Stadium", "Bern").
partido_lugar(m_1954_08, "St. Jakob Stadium", "Basel").
partido_lugar(m_1954_09, "St. Jakob Stadium", "Basel").
partido_lugar(m_1954_10, "Stade Olympique de la Pontaise", "Lausanne").
partido_lugar(m_1954_11, "Hardturm Stadium", "Zürich").
partido_lugar(m_1954_12, "Charmilles Stadium", "Geneva").
partido_lugar(m_1954_13, "St. Jakob Stadium", "Basel").
partido_lugar(m_1954_14, "Charmilles Stadium", "Geneva").
partido_lugar(m_1954_15, "Cornaredo Stadium", "Lugano").
partido_lugar(m_1954_16, "Wankdorf Stadium", "Bern").
partido_lugar(m_1954_17, "Hardturm Stadium", "Zürich").
partido_lugar(m_1954_18, "St. Jakob Stadium", "Basel").
partido_lugar(m_1954_19, "Stade Olympique de la Pontaise", "Lausanne").
partido_lugar(m_1954_20, "St. Jakob Stadium", "Basel").
partido_lugar(m_1954_21, "Wankdorf Stadium", "Bern").
partido_lugar(m_1954_22, "Charmilles Stadium", "Geneva").
partido_lugar(m_1954_23, "Stade Olympique de la Pontaise", "Lausanne").
partido_lugar(m_1954_24, "St. Jakob Stadium", "Basel").
partido_lugar(m_1954_25, "Hardturm Stadium", "Zürich").
partido_lugar(m_1954_26, "Wankdorf Stadium", "Bern").
partido_lugar(m_1958_01, "Råsunda Stadium", "Solna").
partido_lugar(m_1958_02, "Malmö Stadion", "Malmö").
partido_lugar(m_1958_03, "Örjans Vall", "Halmstad").
partido_lugar(m_1958_04, "Idrottsparken", "Norrköping").
partido_lugar(m_1958_05, "Arosvallen", "Västerås").
partido_lugar(m_1958_06, "Jernvallen", "Sandviken").
partido_lugar(m_1958_07, "Rimnersvallen", "Uddevalla").
partido_lugar(m_1958_08, "Ullevi", "Gothenburg").
partido_lugar(m_1958_09, "Örjans Vall", "Halmstad").
partido_lugar(m_1958_10, "Olympia", "Helsingborg").
partido_lugar(m_1958_11, "Idrottsparken", "Norrköping").
partido_lugar(m_1958_12, "Arosvallen", "Västerås").
partido_lugar(m_1958_13, "Råsunda Stadium", "Solna").
partido_lugar(m_1958_14, "Ullevi", "Gothenburg").
partido_lugar(m_1958_15, "Ryavallen", "Borås").
partido_lugar(m_1958_16, "Råsunda Stadium", "Solna").
partido_lugar(m_1958_17, "Råsunda Stadium", "Solna").
partido_lugar(m_1958_18, "Olympia", "Helsingborg").
partido_lugar(m_1958_19, "Malmö Stadion", "Malmö").
partido_lugar(m_1958_20, "Eyravallen", "Örebro").
partido_lugar(m_1958_21, "Tunavallen", "Eskilstuna").
partido_lugar(m_1958_22, "Jernvallen", "Sandviken").
partido_lugar(m_1958_23, "Ullevi", "Gothenburg").
partido_lugar(m_1958_24, "Ryavallen", "Borås").
partido_lugar(m_1958_25, "Malmö Stadion", "Malmö").
partido_lugar(m_1958_26, "Råsunda Stadium", "Solna").
partido_lugar(m_1958_27, "Ullevi", "Gothenburg").
partido_lugar(m_1958_28, "Ullevi", "Gothenburg").
partido_lugar(m_1958_29, "Idrottsparken", "Norrköping").
partido_lugar(m_1958_30, "Råsunda Stadium", "Solna").
partido_lugar(m_1958_31, "Malmö Stadion", "Malmö").
partido_lugar(m_1958_32, "Råsunda Stadium", "Solna").
partido_lugar(m_1958_33, "Ullevi", "Gothenburg").
partido_lugar(m_1958_34, "Ullevi", "Gothenburg").
partido_lugar(m_1958_35, "Råsunda Stadium", "Solna").
partido_lugar(m_1962_01, "Estadio Carlos Dittborn", "Arica").
partido_lugar(m_1962_02, "Estadio Nacional", "Santiago").
partido_lugar(m_1962_03, "Estadio Sausalito", "Viña del Mar").
partido_lugar(m_1962_04, "Estadio El Teniente", "Rancagua").
partido_lugar(m_1962_05, "Estadio Carlos Dittborn", "Arica").
partido_lugar(m_1962_06, "Estadio Nacional", "Santiago").
partido_lugar(m_1962_07, "Estadio Sausalito", "Viña del Mar").
partido_lugar(m_1962_08, "Estadio El Teniente", "Rancagua").
partido_lugar(m_1962_09, "Estadio Carlos Dittborn", "Arica").
partido_lugar(m_1962_10, "Estadio Nacional", "Santiago").
partido_lugar(m_1962_11, "Estadio Sausalito", "Viña del Mar").
partido_lugar(m_1962_12, "Estadio El Teniente", "Rancagua").
partido_lugar(m_1962_13, "Estadio Carlos Dittborn", "Arica").
partido_lugar(m_1962_14, "Estadio Nacional", "Santiago").
partido_lugar(m_1962_15, "Estadio Sausalito", "Viña del Mar").
partido_lugar(m_1962_16, "Estadio El Teniente", "Rancagua").
partido_lugar(m_1962_17, "Estadio Carlos Dittborn", "Arica").
partido_lugar(m_1962_18, "Estadio Nacional", "Santiago").
partido_lugar(m_1962_19, "Estadio Sausalito", "Viña del Mar").
partido_lugar(m_1962_20, "Estadio El Teniente", "Rancagua").
partido_lugar(m_1962_21, "Estadio Carlos Dittborn", "Arica").
partido_lugar(m_1962_22, "Estadio Nacional", "Santiago").
partido_lugar(m_1962_23, "Estadio Sausalito", "Viña del Mar").
partido_lugar(m_1962_24, "Estadio El Teniente", "Rancagua").
partido_lugar(m_1962_25, "Estadio Sausalito", "Viña del Mar").
partido_lugar(m_1962_26, "Estadio Carlos Dittborn", "Arica").
partido_lugar(m_1962_27, "Estadio El Teniente", "Rancagua").
partido_lugar(m_1962_28, "Estadio Nacional", "Santiago").
partido_lugar(m_1962_29, "Estadio Nacional", "Santiago").
partido_lugar(m_1962_30, "Estadio Sausalito", "Viña del Mar").
partido_lugar(m_1962_31, "Estadio Nacional", "Santiago").
partido_lugar(m_1962_32, "Estadio Nacional", "Santiago").
partido_lugar(m_1966_01, "Wembley Stadium", "London").
partido_lugar(m_1966_02, "Hillsborough Stadium", "Sheffield").
partido_lugar(m_1966_03, "Goodison Park", "Liverpool").
partido_lugar(m_1966_04, "Ayresome Park", "Middlesbrough").
partido_lugar(m_1966_05, "Wembley Stadium", "London").
partido_lugar(m_1966_06, "Villa Park", "Birmingham").
partido_lugar(m_1966_07, "Old Trafford", "Manchester").
partido_lugar(m_1966_08, "Roker Park", "Sunderland").
partido_lugar(m_1966_09, "White City Stadium", "London").
partido_lugar(m_1966_10, "Hillsborough Stadium", "Sheffield").
partido_lugar(m_1966_11, "Goodison Park", "Liverpool").
partido_lugar(m_1966_12, "Ayresome Park", "Middlesbrough").
partido_lugar(m_1966_13, "Villa Park", "Birmingham").
partido_lugar(m_1966_14, "Old Trafford", "Manchester").
partido_lugar(m_1966_15, "Roker Park", "Sunderland").
partido_lugar(m_1966_16, "Wembley Stadium", "London").
partido_lugar(m_1966_17, "Wembley Stadium", "London").
partido_lugar(m_1966_18, "Hillsborough Stadium", "Sheffield").
partido_lugar(m_1966_19, "Goodison Park", "Liverpool").
partido_lugar(m_1966_20, "Ayresome Park", "Middlesbrough").
partido_lugar(m_1966_21, "Wembley Stadium", "London").
partido_lugar(m_1966_22, "Villa Park", "Birmingham").
partido_lugar(m_1966_23, "Old Trafford", "Manchester").
partido_lugar(m_1966_24, "Roker Park", "Sunderland").
partido_lugar(m_1966_25, "Wembley Stadium", "London").
partido_lugar(m_1966_26, "Goodison Park", "Liverpool").
partido_lugar(m_1966_27, "Roker Park", "Sunderland").
partido_lugar(m_1966_28, "Hillsborough Stadium", "Sheffield").
partido_lugar(m_1966_29, "Goodison Park", "Liverpool").
partido_lugar(m_1966_30, "Wembley Stadium", "London").
partido_lugar(m_1966_31, "Wembley Stadium", "London").
partido_lugar(m_1966_32, "Wembley Stadium", "London").
partido_lugar(m_1970_01, "Estadio Azteca", "Mexico City").
partido_lugar(m_1970_02, "Estadio Cuauhtémoc", "Puebla").
partido_lugar(m_1970_03, "Estadio Jalisco", "Guadalajara").
partido_lugar(m_1970_04, "Estadio Nou Camp", "León").
partido_lugar(m_1970_05, "Estadio Azteca", "Mexico City").
partido_lugar(m_1970_06, "La Bombonera", "Toluca").
partido_lugar(m_1970_07, "Estadio Jalisco", "Guadalajara").
partido_lugar(m_1970_08, "Estadio Nou Camp", "León").
partido_lugar(m_1970_09, "Estadio Azteca", "Mexico City").
partido_lugar(m_1970_10, "Estadio Cuauhtémoc", "Puebla").
partido_lugar(m_1970_11, "Estadio Jalisco", "Guadalajara").
partido_lugar(m_1970_12, "Estadio Nou Camp", "León").
partido_lugar(m_1970_13, "Estadio Azteca", "Mexico City").
partido_lugar(m_1970_14, "La Bombonera", "Toluca").
partido_lugar(m_1970_15, "Estadio Jalisco", "Guadalajara").
partido_lugar(m_1970_16, "Estadio Nou Camp", "León").
partido_lugar(m_1970_17, "Estadio Azteca", "Mexico City").
partido_lugar(m_1970_18, "Estadio Cuauhtémoc", "Puebla").
partido_lugar(m_1970_19, "Estadio Jalisco", "Guadalajara").
partido_lugar(m_1970_20, "Estadio Nou Camp", "León").
partido_lugar(m_1970_21, "Estadio Azteca", "Mexico City").
partido_lugar(m_1970_22, "La Bombonera", "Toluca").
partido_lugar(m_1970_23, "Estadio Jalisco", "Guadalajara").
partido_lugar(m_1970_24, "Estadio Nou Camp", "León").
partido_lugar(m_1970_25, "Estadio Jalisco", "Guadalajara").
partido_lugar(m_1970_26, "La Bombonera", "Toluca").
partido_lugar(m_1970_27, "Estadio Azteca", "Mexico City").
partido_lugar(m_1970_28, "Estadio Nou Camp", "León").
partido_lugar(m_1970_29, "Estadio Jalisco", "Guadalajara").
partido_lugar(m_1970_30, "Estadio Azteca", "Mexico City").
partido_lugar(m_1970_31, "Estadio Azteca", "Mexico City").
partido_lugar(m_1970_32, "Estadio Azteca", "Mexico City").
partido_lugar(m_1974_01, "Waldstadion", "Frankfurt").
partido_lugar(m_1974_02, "Olympiastadion", "Berlin").
partido_lugar(m_1974_03, "Volksparkstadion", "Hamburg").
partido_lugar(m_1974_04, "Westfalenstadion", "Dortmund").
partido_lugar(m_1974_05, "Rheinstadion", "Düsseldorf").
partido_lugar(m_1974_06, "Niedersachsenstadion", "Hanover").
partido_lugar(m_1974_07, "Olympiastadion", "Munich").
partido_lugar(m_1974_08, "Neckarstadion", "Stuttgart").
partido_lugar(m_1974_09, "Volksparkstadion", "Hamburg").
partido_lugar(m_1974_10, "Olympiastadion", "Berlin").
partido_lugar(m_1974_11, "Waldstadion", "Frankfurt").
partido_lugar(m_1974_12, "Parkstadion", "Gelsenkirchen").
partido_lugar(m_1974_13, "Niedersachsenstadion", "Hanover").
partido_lugar(m_1974_14, "Westfalenstadion", "Dortmund").
partido_lugar(m_1974_15, "Neckarstadion", "Stuttgart").
partido_lugar(m_1974_16, "Olympiastadion", "Munich").
partido_lugar(m_1974_17, "Olympiastadion", "Berlin").
partido_lugar(m_1974_18, "Waldstadion", "Frankfurt").
partido_lugar(m_1974_19, "Parkstadion", "Gelsenkirchen").
partido_lugar(m_1974_20, "Volksparkstadion", "Hamburg").
partido_lugar(m_1974_21, "Westfalenstadion", "Dortmund").
partido_lugar(m_1974_22, "Rheinstadion", "Düsseldorf").
partido_lugar(m_1974_23, "Olympiastadion", "Munich").
partido_lugar(m_1974_24, "Neckarstadion", "Stuttgart").
partido_lugar(m_1974_25, "Rheinstadion", "Düsseldorf").
partido_lugar(m_1974_26, "Niedersachsenstadion", "Hanover").
partido_lugar(m_1974_27, "Parkstadion", "Gelsenkirchen").
partido_lugar(m_1974_28, "Neckarstadion", "Stuttgart").
partido_lugar(m_1974_29, "Niedersachsenstadion", "Hanover").
partido_lugar(m_1974_30, "Parkstadion", "Gelsenkirchen").
partido_lugar(m_1974_31, "Waldstadion", "Frankfurt").
partido_lugar(m_1974_32, "Rheinstadion", "Düsseldorf").
partido_lugar(m_1974_33, "Waldstadion", "Frankfurt").
partido_lugar(m_1974_34, "Parkstadion", "Gelsenkirchen").
partido_lugar(m_1974_35, "Westfalenstadion", "Dortmund").
partido_lugar(m_1974_36, "Rheinstadion", "Düsseldorf").
partido_lugar(m_1974_37, "Olympiastadion", "Munich").
partido_lugar(m_1974_38, "Olympiastadion", "Munich").
partido_lugar(m_1978_01, "Estadio Monumental", "Buenos Aires").
partido_lugar(m_1978_02, "Estadio José María Minella", "Mar del Plata").
partido_lugar(m_1978_03, "Estadio Gigante de Arroyito", "Rosario").
partido_lugar(m_1978_04, "Estadio Monumental", "Buenos Aires").
partido_lugar(m_1978_05, "Estadio José Amalfitani", "Buenos Aires").
partido_lugar(m_1978_06, "Estadio José María Minella", "Mar del Plata").
partido_lugar(m_1978_07, "Estadio Ciudad de Mendoza", "Mendoza").
partido_lugar(m_1978_08, "Estadio Chateau Carreras", "Córdoba").
partido_lugar(m_1978_09, "Estadio José María Minella", "Mar del Plata").
partido_lugar(m_1978_10, "Estadio Gigante de Arroyito", "Rosario").
partido_lugar(m_1978_11, "Estadio Chateau Carreras", "Córdoba").
partido_lugar(m_1978_12, "Estadio Monumental", "Buenos Aires").
partido_lugar(m_1978_13, "Estadio José Amalfitani", "Buenos Aires").
partido_lugar(m_1978_14, "Estadio José María Minella", "Mar del Plata").
partido_lugar(m_1978_15, "Estadio Ciudad de Mendoza", "Mendoza").
partido_lugar(m_1978_16, "Estadio Chateau Carreras", "Córdoba").
partido_lugar(m_1978_17, "Estadio José María Minella", "Mar del Plata").
partido_lugar(m_1978_18, "Estadio Gigante de Arroyito", "Rosario").
partido_lugar(m_1978_19, "Estadio Chateau Carreras", "Córdoba").
partido_lugar(m_1978_20, "Estadio Monumental", "Buenos Aires").
partido_lugar(m_1978_21, "Estadio José María Minella", "Mar del Plata").
partido_lugar(m_1978_22, "Estadio José Amalfitani", "Buenos Aires").
partido_lugar(m_1978_23, "Estadio Chateau Carreras", "Córdoba").
partido_lugar(m_1978_24, "Estadio Ciudad de Mendoza", "Mendoza").
partido_lugar(m_1978_25, "Estadio Chateau Carreras", "Córdoba").
partido_lugar(m_1978_26, "Estadio Monumental", "Buenos Aires").
partido_lugar(m_1978_27, "Estadio Ciudad de Mendoza", "Mendoza").
partido_lugar(m_1978_28, "Estadio Gigante de Arroyito", "Rosario").
partido_lugar(m_1978_29, "Estadio Ciudad de Mendoza", "Mendoza").
partido_lugar(m_1978_30, "Estadio Monumental", "Buenos Aires").
partido_lugar(m_1978_31, "Estadio Chateau Carreras", "Córdoba").
partido_lugar(m_1978_32, "Estadio Gigante de Arroyito", "Rosario").
partido_lugar(m_1978_33, "Estadio Chateau Carreras", "Córdoba").
partido_lugar(m_1978_34, "Estadio Monumental", "Buenos Aires").
partido_lugar(m_1978_35, "Estadio Ciudad de Mendoza", "Mendoza").
partido_lugar(m_1978_36, "Estadio Gigante de Arroyito", "Rosario").
partido_lugar(m_1978_37, "Estadio Monumental", "Buenos Aires").
partido_lugar(m_1978_38, "Estadio Monumental", "Buenos Aires").
partido_lugar(m_1982_01, "Camp Nou", "Barcelona").
partido_lugar(m_1982_02, "Balaídos", "Vigo").
partido_lugar(m_1982_03, "Estadio Ramón Sánchez Pizjuán", "Seville").
partido_lugar(m_1982_04, "Estadio Riazor", "A Coruña").
partido_lugar(m_1982_05, "Nuevo Estadio", "Elche").
partido_lugar(m_1982_06, "Estadio La Rosaleda", "Málaga").
partido_lugar(m_1982_07, "Estadio El Molinón", "Gijón").
partido_lugar(m_1982_08, "Estadio San Mamés", "Bilbao").
partido_lugar(m_1982_09, "Estadio Luis Casanova", "Valencia").
partido_lugar(m_1982_10, "Estadio Carlos Tartiere", "Oviedo").
partido_lugar(m_1982_11, "Estadio José Zorrilla", "Valladolid").
partido_lugar(m_1982_12, "Estadio La Romareda", "Zaragoza").
partido_lugar(m_1982_13, "Balaídos", "Vigo").
partido_lugar(m_1982_14, "Estadio José Rico Pérez", "Alicante").
partido_lugar(m_1982_15, "Estadio Benito Villamarín", "Seville").
partido_lugar(m_1982_16, "Estadio Riazor", "A Coruña").
partido_lugar(m_1982_17, "Nuevo Estadio", "Elche").
partido_lugar(m_1982_18, "Estadio La Rosaleda", "Málaga").
partido_lugar(m_1982_19, "Estadio El Molinón", "Gijón").
partido_lugar(m_1982_20, "Estadio San Mamés", "Bilbao").
partido_lugar(m_1982_21, "Estadio Luis Casanova", "Valencia").
partido_lugar(m_1982_22, "Estadio Carlos Tartiere", "Oviedo").
partido_lugar(m_1982_23, "Estadio José Zorrilla", "Valladolid").
partido_lugar(m_1982_24, "Estadio La Romareda", "Zaragoza").
partido_lugar(m_1982_25, "Estadio Riazor", "A Coruña").
partido_lugar(m_1982_26, "Nuevo Estadio", "Elche").
partido_lugar(m_1982_27, "Estadio La Rosaleda", "Málaga").
partido_lugar(m_1982_28, "Balaídos", "Vigo").
partido_lugar(m_1982_29, "Estadio José Rico Pérez", "Alicante").
partido_lugar(m_1982_30, "Estadio Benito Villamarín", "Seville").
partido_lugar(m_1982_31, "Estadio Carlos Tartiere", "Oviedo").
partido_lugar(m_1982_32, "Estadio José Zorrilla", "Valladolid").
partido_lugar(m_1982_33, "Estadio La Romareda", "Zaragoza").
partido_lugar(m_1982_34, "Estadio El Molinón", "Gijón").
partido_lugar(m_1982_35, "Estadio San Mamés", "Bilbao").
partido_lugar(m_1982_36, "Estadio Luis Casanova", "Valencia").
partido_lugar(m_1982_37, "Vicente Calderón", "Madrid").
partido_lugar(m_1982_38, "Camp Nou", "Barcelona").
partido_lugar(m_1982_39, "Estadi de Sarrià", "Barcelona").
partido_lugar(m_1982_40, "Estadio Santiago Bernabéu", "Madrid").
partido_lugar(m_1982_41, "Vicente Calderón", "Madrid").
partido_lugar(m_1982_42, "Camp Nou", "Barcelona").
partido_lugar(m_1982_43, "Estadi de Sarrià", "Barcelona").
partido_lugar(m_1982_44, "Estadio Santiago Bernabéu", "Madrid").
partido_lugar(m_1982_45, "Vicente Calderón", "Madrid").
partido_lugar(m_1982_46, "Camp Nou", "Barcelona").
partido_lugar(m_1982_47, "Estadi de Sarrià", "Barcelona").
partido_lugar(m_1982_48, "Estadio Santiago Bernabéu", "Madrid").
partido_lugar(m_1982_49, "Camp Nou", "Barcelona").
partido_lugar(m_1982_50, "Estadio Ramón Sánchez Pizjuán", "Seville").
partido_lugar(m_1982_51, "Estadio José Rico Pérez", "Alicante").
partido_lugar(m_1982_52, "Estadio Santiago Bernabéu", "Madrid").
partido_lugar(m_1986_01, "Estadio Azteca", "Mexico City").
partido_lugar(m_1986_02, "Estadio Jalisco", "Guadalajara").
partido_lugar(m_1986_03, "Estadio Nou Camp", "León").
partido_lugar(m_1986_04, "Estadio Olímpico Universitario", "Mexico City").
partido_lugar(m_1986_05, "Estadio Sergio León Chavez", "Irapuato").
partido_lugar(m_1986_06, "Estadio Universitario", "Monterrey").
partido_lugar(m_1986_07, "Estadio Azteca", "Mexico City").
partido_lugar(m_1986_08, "Estadio Tres de Marzo", "Guadalajara").
partido_lugar(m_1986_09, "Estadio Tecnológico", "Monterrey").
partido_lugar(m_1986_10, "La Bombonera", "Toluca").
partido_lugar(m_1986_11, "Estadio La Corregidora", "Querétaro").
partido_lugar(m_1986_12, "Estadio Neza 86", "Nezahualcóyotl").
partido_lugar(m_1986_13, "Estadio Cuauhtémoc", "Puebla").
partido_lugar(m_1986_14, "Estadio Nou Camp", "León").
partido_lugar(m_1986_15, "Estadio Olímpico Universitario", "Mexico City").
partido_lugar(m_1986_16, "Estadio Sergio León Chavez", "Irapuato").
partido_lugar(m_1986_17, "Estadio Jalisco", "Guadalajara").
partido_lugar(m_1986_18, "Estadio Tecnológico", "Monterrey").
partido_lugar(m_1986_19, "Estadio Azteca", "Mexico City").
partido_lugar(m_1986_20, "Estadio Tres de Marzo", "Guadalajara").
partido_lugar(m_1986_21, "Estadio Universitario", "Monterrey").
partido_lugar(m_1986_22, "La Bombonera", "Toluca").
partido_lugar(m_1986_23, "Estadio La Corregidora", "Querétaro").
partido_lugar(m_1986_24, "Estadio Neza 86", "Nezahualcóyotl").
partido_lugar(m_1986_25, "Estadio Nou Camp", "León").
partido_lugar(m_1986_26, "Estadio Sergio León Chavez", "Irapuato").
partido_lugar(m_1986_27, "Estadio Olímpico Universitario", "Mexico City").
partido_lugar(m_1986_28, "Estadio Cuauhtémoc", "Puebla").
partido_lugar(m_1986_29, "Estadio Azteca", "Mexico City").
partido_lugar(m_1986_30, "La Bombonera", "Toluca").
partido_lugar(m_1986_31, "Estadio Universitario", "Monterrey").
partido_lugar(m_1986_32, "Estadio Tres de Marzo", "Guadalajara").
partido_lugar(m_1986_33, "Estadio Tecnológico", "Monterrey").
partido_lugar(m_1986_34, "Estadio Jalisco", "Guadalajara").
partido_lugar(m_1986_35, "Estadio La Corregidora", "Querétaro").
partido_lugar(m_1986_36, "Estadio Neza 86", "Nezahualcóyotl").
partido_lugar(m_1986_37, "Estadio Azteca", "Mexico City").
partido_lugar(m_1986_38, "Estadio Nou Camp", "León").
partido_lugar(m_1986_39, "Estadio Jalisco", "Guadalajara").
partido_lugar(m_1986_40, "Estadio Cuauhtémoc", "Puebla").
partido_lugar(m_1986_41, "Estadio Olímpico Universitario", "Mexico City").
partido_lugar(m_1986_42, "Estadio Universitario", "Monterrey").
partido_lugar(m_1986_43, "Estadio Azteca", "Mexico City").
partido_lugar(m_1986_44, "Estadio La Corregidora", "Querétaro").
partido_lugar(m_1986_45, "Estadio Jalisco", "Guadalajara").
partido_lugar(m_1986_46, "Estadio Universitario", "Monterrey").
partido_lugar(m_1986_47, "Estadio Azteca", "Mexico City").
partido_lugar(m_1986_48, "Estadio Cuauhtémoc", "Puebla").
partido_lugar(m_1986_49, "Estadio Jalisco", "Guadalajara").
partido_lugar(m_1986_50, "Estadio Azteca", "Mexico City").
partido_lugar(m_1986_51, "Estadio Cuauhtémoc", "Puebla").
partido_lugar(m_1986_52, "Estadio Azteca", "Mexico City").
partido_lugar(m_1990_01, "San Siro", "Milan").
partido_lugar(m_1990_02, "Stadio San Nicola", "Bari").
partido_lugar(m_1990_03, "Stadio Renato Dall'Ara", "Bologna").
partido_lugar(m_1990_04, "Stadio Olimpico", "Rome").
partido_lugar(m_1990_05, "Stadio Comunale", "Florence").
partido_lugar(m_1990_06, "Stadio delle Alpi", "Turin").
partido_lugar(m_1990_07, "San Siro", "Milan").
partido_lugar(m_1990_08, "Stadio Luigi Ferraris", "Genoa").
partido_lugar(m_1990_09, "Stadio Sant'Elia", "Cagliari").
partido_lugar(m_1990_10, "Stadio Marc'Antonio Bentegodi", "Verona").
partido_lugar(m_1990_11, "Stadio La Favorita", "Palermo").
partido_lugar(m_1990_12, "Stadio Friuli", "Udine").
partido_lugar(m_1990_13, "Stadio San Paolo", "Naples").
partido_lugar(m_1990_14, "Stadio San Nicola", "Bari").
partido_lugar(m_1990_15, "Stadio Renato Dall'Ara", "Bologna").
partido_lugar(m_1990_16, "Stadio Olimpico", "Rome").
partido_lugar(m_1990_17, "Stadio Comunale", "Florence").
partido_lugar(m_1990_18, "San Siro", "Milan").
partido_lugar(m_1990_19, "Stadio delle Alpi", "Turin").
partido_lugar(m_1990_20, "Stadio Luigi Ferraris", "Genoa").
partido_lugar(m_1990_21, "Stadio Sant'Elia", "Cagliari").
partido_lugar(m_1990_22, "Stadio La Favorita", "Palermo").
partido_lugar(m_1990_23, "Stadio Marc'Antonio Bentegodi", "Verona").
partido_lugar(m_1990_24, "Stadio Friuli", "Udine").
partido_lugar(m_1990_25, "Stadio San Paolo", "Naples").
partido_lugar(m_1990_26, "Stadio San Nicola", "Bari").
partido_lugar(m_1990_27, "San Siro", "Milan").
partido_lugar(m_1990_28, "Stadio Renato Dall'Ara", "Bologna").
partido_lugar(m_1990_29, "Stadio Comunale", "Florence").
partido_lugar(m_1990_30, "Stadio Olimpico", "Rome").
partido_lugar(m_1990_31, "Stadio delle Alpi", "Turin").
partido_lugar(m_1990_32, "Stadio Luigi Ferraris", "Genoa").
partido_lugar(m_1990_33, "Stadio Marc'Antonio Bentegodi", "Verona").
partido_lugar(m_1990_34, "Stadio Friuli", "Udine").
partido_lugar(m_1990_35, "Stadio Sant'Elia", "Cagliari").
partido_lugar(m_1990_36, "Stadio La Favorita", "Palermo").
partido_lugar(m_1990_37, "Stadio San Paolo", "Naples").
partido_lugar(m_1990_38, "Stadio San Nicola", "Bari").
partido_lugar(m_1990_39, "Stadio delle Alpi", "Turin").
partido_lugar(m_1990_40, "San Siro", "Milan").
partido_lugar(m_1990_41, "Stadio Luigi Ferraris", "Genoa").
partido_lugar(m_1990_42, "Stadio Olimpico", "Rome").
partido_lugar(m_1990_43, "Stadio Marc'Antonio Bentegodi", "Verona").
partido_lugar(m_1990_44, "Stadio Renato Dall'Ara", "Bologna").
partido_lugar(m_1990_45, "Stadio Comunale", "Florence").
partido_lugar(m_1990_46, "Stadio Olimpico", "Rome").
partido_lugar(m_1990_47, "San Siro", "Milan").
partido_lugar(m_1990_48, "Stadio San Paolo", "Naples").
partido_lugar(m_1990_49, "Stadio San Paolo", "Naples").
partido_lugar(m_1990_50, "Stadio delle Alpi", "Turin").
partido_lugar(m_1990_51, "Stadio San Nicola", "Bari").
partido_lugar(m_1990_52, "Stadio Olimpico", "Rome").
partido_lugar(m_1994_01, "Soldier Field", "Chicago").
partido_lugar(m_1994_02, "Cotton Bowl", "Dallas").
partido_lugar(m_1994_03, "Pontiac Silverdome", "Pontiac").
partido_lugar(m_1994_04, "Giants Stadium", "East Rutherford").
partido_lugar(m_1994_05, "Rose Bowl", "Pasadena").
partido_lugar(m_1994_06, "Citrus Bowl", "Orlando").
partido_lugar(m_1994_07, "RFK Stadium", "Washington, D.C.").
partido_lugar(m_1994_08, "Rose Bowl", "Pasadena").
partido_lugar(m_1994_09, "Stanford Stadium", "Stanford").
partido_lugar(m_1994_10, "RFK Stadium", "Washington, D.C.").
partido_lugar(m_1994_11, "Foxboro Stadium", "Foxborough").
partido_lugar(m_1994_12, "Soldier Field", "Chicago").
partido_lugar(m_1994_13, "Cotton Bowl", "Dallas").
partido_lugar(m_1994_14, "Pontiac Silverdome", "Pontiac").
partido_lugar(m_1994_15, "Rose Bowl", "Pasadena").
partido_lugar(m_1994_16, "Giants Stadium", "East Rutherford").
partido_lugar(m_1994_17, "Foxboro Stadium", "Foxborough").
partido_lugar(m_1994_18, "Citrus Bowl", "Orlando").
partido_lugar(m_1994_19, "Stanford Stadium", "Stanford").
partido_lugar(m_1994_20, "Pontiac Silverdome", "Pontiac").
partido_lugar(m_1994_21, "Citrus Bowl", "Orlando").
partido_lugar(m_1994_22, "Giants Stadium", "East Rutherford").
partido_lugar(m_1994_23, "Foxboro Stadium", "Foxborough").
partido_lugar(m_1994_24, "Soldier Field", "Chicago").
partido_lugar(m_1994_25, "Stanford Stadium", "Stanford").
partido_lugar(m_1994_26, "Rose Bowl", "Pasadena").
partido_lugar(m_1994_27, "Soldier Field", "Chicago").
partido_lugar(m_1994_28, "Cotton Bowl", "Dallas").
partido_lugar(m_1994_29, "RFK Stadium", "Washington, D.C.").
partido_lugar(m_1994_30, "Giants Stadium", "East Rutherford").
partido_lugar(m_1994_31, "Stanford Stadium", "Stanford").
partido_lugar(m_1994_32, "Pontiac Silverdome", "Pontiac").
partido_lugar(m_1994_33, "RFK Stadium", "Washington, D.C.").
partido_lugar(m_1994_34, "Citrus Bowl", "Orlando").
partido_lugar(m_1994_35, "Cotton Bowl", "Dallas").
partido_lugar(m_1994_36, "Foxboro Stadium", "Foxborough").
partido_lugar(m_1994_37, "Soldier Field", "Chicago").
partido_lugar(m_1994_38, "RFK Stadium", "Washington, D.C.").
partido_lugar(m_1994_39, "Cotton Bowl", "Dallas").
partido_lugar(m_1994_40, "Rose Bowl", "Pasadena").
partido_lugar(m_1994_41, "Citrus Bowl", "Orlando").
partido_lugar(m_1994_42, "Stanford Stadium", "Stanford").
partido_lugar(m_1994_43, "Foxboro Stadium", "Foxborough").
partido_lugar(m_1994_44, "Giants Stadium", "East Rutherford").
partido_lugar(m_1994_45, "Foxboro Stadium", "Foxborough").
partido_lugar(m_1994_46, "Cotton Bowl", "Dallas").
partido_lugar(m_1994_47, "Giants Stadium", "East Rutherford").
partido_lugar(m_1994_48, "Stanford Stadium", "Stanford").
partido_lugar(m_1994_49, "Giants Stadium", "East Rutherford").
partido_lugar(m_1994_50, "Rose Bowl", "Pasadena").
partido_lugar(m_1994_51, "Rose Bowl", "Pasadena").
partido_lugar(m_1994_52, "Rose Bowl", "Pasadena").
partido_lugar(m_1998_01, "Stade de France", "Saint-Denis").
partido_lugar(m_1998_02, "Stade de la Mosson", "Montpellier").
partido_lugar(m_1998_03, "Stade du Parc Lescure", "Bordeaux").
partido_lugar(m_1998_04, "Stade de Toulouse", "Toulouse").
partido_lugar(m_1998_05, "Stade de la Mosson", "Montpellier").
partido_lugar(m_1998_06, "Stade Félix-Bollaert", "Lens").
partido_lugar(m_1998_07, "Stade Vélodrome", "Marseille").
partido_lugar(m_1998_08, "Stade de la Beaujoire", "Nantes").
partido_lugar(m_1998_09, "Stade de Gerland", "Lyon").
partido_lugar(m_1998_10, "Stade de France", "Saint-Denis").
partido_lugar(m_1998_11, "Stade de Toulouse", "Toulouse").
partido_lugar(m_1998_12, "Stade Geoffroy-Guichard", "Saint-Étienne").
partido_lugar(m_1998_13, "Stade Félix-Bollaert", "Lens").
partido_lugar(m_1998_14, "Stade Vélodrome", "Marseille").
partido_lugar(m_1998_15, "Stade de Gerland", "Lyon").
partido_lugar(m_1998_16, "Parc des Princes", "Paris").
partido_lugar(m_1998_17, "Stade du Parc Lescure", "Bordeaux").
partido_lugar(m_1998_18, "Stade de la Beaujoire", "Nantes").
partido_lugar(m_1998_19, "Stade Geoffroy-Guichard", "Saint-Étienne").
partido_lugar(m_1998_20, "Stade de la Mosson", "Montpellier").
partido_lugar(m_1998_21, "Stade de Toulouse", "Toulouse").
partido_lugar(m_1998_22, "Stade de France", "Saint-Denis").
partido_lugar(m_1998_23, "Parc des Princes", "Paris").
partido_lugar(m_1998_24, "Stade Geoffroy-Guichard", "Saint-Étienne").
partido_lugar(m_1998_25, "Stade de la Beaujoire", "Nantes").
partido_lugar(m_1998_26, "Stade du Parc Lescure", "Bordeaux").
partido_lugar(m_1998_27, "Stade Vélodrome", "Marseille").
partido_lugar(m_1998_28, "Stade Félix-Bollaert", "Lens").
partido_lugar(m_1998_29, "Parc des Princes", "Paris").
partido_lugar(m_1998_30, "Stade de Gerland", "Lyon").
partido_lugar(m_1998_31, "Stade de la Mosson", "Montpellier").
partido_lugar(m_1998_32, "Stade de Toulouse", "Toulouse").
partido_lugar(m_1998_33, "Stade de la Beaujoire", "Nantes").
partido_lugar(m_1998_34, "Stade de France", "Saint-Denis").
partido_lugar(m_1998_35, "Stade Vélodrome", "Marseille").
partido_lugar(m_1998_36, "Stade Geoffroy-Guichard", "Saint-Étienne").
partido_lugar(m_1998_37, "Stade de Gerland", "Lyon").
partido_lugar(m_1998_38, "Stade du Parc Lescure", "Bordeaux").
partido_lugar(m_1998_39, "Stade de Toulouse", "Toulouse").
partido_lugar(m_1998_40, "Stade Félix-Bollaert", "Lens").
partido_lugar(m_1998_41, "Parc des Princes", "Paris").
partido_lugar(m_1998_42, "Stade Geoffroy-Guichard", "Saint-Étienne").
partido_lugar(m_1998_43, "Stade de la Mosson", "Montpellier").
partido_lugar(m_1998_44, "Stade de la Beaujoire", "Nantes").
partido_lugar(m_1998_45, "Stade du Parc Lescure", "Bordeaux").
partido_lugar(m_1998_46, "Stade de Gerland", "Lyon").
partido_lugar(m_1998_47, "Stade Félix-Bollaert", "Lens").
partido_lugar(m_1998_48, "Stade de France", "Saint-Denis").
partido_lugar(m_1998_49, "Stade Vélodrome", "Marseille").
partido_lugar(m_1998_50, "Parc des Princes", "Paris").
partido_lugar(m_1998_51, "Stade Félix-Bollaert", "Lens").
partido_lugar(m_1998_52, "Stade de France", "Saint-Denis").
partido_lugar(m_1998_53, "Stade de la Mosson", "Montpellier").
partido_lugar(m_1998_54, "Stade de Toulouse", "Toulouse").
partido_lugar(m_1998_55, "Stade du Parc Lescure", "Bordeaux").
partido_lugar(m_1998_56, "Stade Geoffroy-Guichard", "Saint-Étienne").
partido_lugar(m_1998_57, "Stade de France", "Saint-Denis").
partido_lugar(m_1998_58, "Stade de la Beaujoire", "Nantes").
partido_lugar(m_1998_59, "Stade Vélodrome", "Marseille").
partido_lugar(m_1998_60, "Stade de Gerland", "Lyon").
partido_lugar(m_1998_61, "Stade Vélodrome", "Marseille").
partido_lugar(m_1998_62, "Stade de France", "Saint-Denis").
partido_lugar(m_1998_63, "Parc des Princes", "Paris").
partido_lugar(m_1998_64, "Stade de France", "Saint-Denis").
partido_lugar(m_2002_01, "Seoul World Cup Stadium", "Seoul").
partido_lugar(m_2002_02, "Niigata Stadium", "Niigata").
partido_lugar(m_2002_03, "Ulsan Munsu Football Stadium", "Ulsan").
partido_lugar(m_2002_04, "Sapporo Dome", "Sapporo").
partido_lugar(m_2002_05, "Kashima Stadium", "Ibaraki").
partido_lugar(m_2002_06, "Busan Asiad Stadium", "Busan").
partido_lugar(m_2002_07, "Saitama Stadium", "Saitama").
partido_lugar(m_2002_08, "Gwangju World Cup Stadium", "Gwangju").
partido_lugar(m_2002_09, "Niigata Stadium", "Niigata").
partido_lugar(m_2002_10, "Ulsan Munsu Football Stadium", "Ulsan").
partido_lugar(m_2002_11, "Sapporo Dome", "Sapporo").
partido_lugar(m_2002_12, "Gwangju World Cup Stadium", "Gwangju").
partido_lugar(m_2002_13, "Saitama Stadium", "Saitama").
partido_lugar(m_2002_14, "Busan Asiad Stadium", "Busan").
partido_lugar(m_2002_15, "Kobe Wing Stadium", "Kobe").
partido_lugar(m_2002_16, "Suwon World Cup Stadium", "Suwon").
partido_lugar(m_2002_17, "Kashima Stadium", "Ibaraki").
partido_lugar(m_2002_18, "Daegu World Cup Stadium", "Daegu").
partido_lugar(m_2002_19, "Saitama Stadium", "Saitama").
partido_lugar(m_2002_20, "Busan Asiad Stadium", "Busan").
partido_lugar(m_2002_21, "Kobe Wing Stadium", "Kobe").
partido_lugar(m_2002_22, "Jeonju World Cup Stadium", "Jeonju").
partido_lugar(m_2002_23, "Sapporo Dome", "Sapporo").
partido_lugar(m_2002_24, "Daegu World Cup Stadium", "Daegu").
partido_lugar(m_2002_25, "Kashima Stadium", "Ibaraki").
partido_lugar(m_2002_26, "Jeju World Cup Stadium", "Seogwipo").
partido_lugar(m_2002_27, "Miyagi Stadium", "Miyagi").
partido_lugar(m_2002_28, "Incheon Munhak Stadium", "Incheon").
partido_lugar(m_2002_29, "International Stadium Yokohama", "Yokohama").
partido_lugar(m_2002_30, "Daegu World Cup Stadium", "Daegu").
partido_lugar(m_2002_31, "Ōita Stadium", "Ōita").
partido_lugar(m_2002_32, "Jeonju World Cup Stadium", "Jeonju").
partido_lugar(m_2002_33, "Incheon Munhak Stadium", "Incheon").
partido_lugar(m_2002_34, "Suwon World Cup Stadium", "Suwon").
partido_lugar(m_2002_35, "Shizuoka Stadium ECOPA", "Shizuoka").
partido_lugar(m_2002_36, "International Stadium Yokohama", "Yokohama").
partido_lugar(m_2002_37, "Nagai Stadium", "Osaka").
partido_lugar(m_2002_38, "Miyagi Stadium", "Miyagi").
partido_lugar(m_2002_39, "Jeju World Cup Stadium", "Seogwipo").
partido_lugar(m_2002_40, "Daejeon World Cup Stadium", "Daejeon").
partido_lugar(m_2002_41, "Suwon World Cup Stadium", "Suwon").
partido_lugar(m_2002_42, "Seoul World Cup Stadium", "Seoul").
partido_lugar(m_2002_43, "International Stadium Yokohama", "Yokohama").
partido_lugar(m_2002_44, "Ōita Stadium", "Ōita").
partido_lugar(m_2002_45, "Shizuoka Stadium ECOPA", "Shizuoka").
partido_lugar(m_2002_46, "Nagai Stadium", "Osaka").
partido_lugar(m_2002_47, "Daejeon World Cup Stadium", "Daejeon").
partido_lugar(m_2002_48, "Incheon Munhak Stadium", "Incheon").
partido_lugar(m_2002_49, "Jeju World Cup Stadium", "Seogwipo").
partido_lugar(m_2002_50, "Niigata Stadium", "Niigata").
partido_lugar(m_2002_51, "Ōita Stadium", "Ōita").
partido_lugar(m_2002_52, "Suwon World Cup Stadium", "Suwon").
partido_lugar(m_2002_53, "Jeonju World Cup Stadium", "Jeonju").
partido_lugar(m_2002_54, "Kobe Wing Stadium", "Kobe").
partido_lugar(m_2002_55, "Miyagi Stadium", "Miyagi").
partido_lugar(m_2002_56, "Daejeon World Cup Stadium", "Daejeon").
partido_lugar(m_2002_57, "Shizuoka Stadium ECOPA", "Shizuoka").
partido_lugar(m_2002_58, "Ulsan Munsu Football Stadium", "Ulsan").
partido_lugar(m_2002_59, "Gwangju World Cup Stadium", "Gwangju").
partido_lugar(m_2002_60, "Nagai Stadium", "Osaka").
partido_lugar(m_2002_61, "Seoul World Cup Stadium", "Seoul").
partido_lugar(m_2002_62, "Saitama Stadium", "Saitama").
partido_lugar(m_2002_63, "Daegu World Cup Stadium", "Daegu").
partido_lugar(m_2002_64, "International Stadium Yokohama", "Yokohama").
partido_lugar(m_2006_01, "Allianz Arena", "Munich").
partido_lugar(m_2006_02, "Arena AufShalke", "Gelsenkirchen").
partido_lugar(m_2006_03, "Waldstadion", "Frankfurt").
partido_lugar(m_2006_04, "Westfalenstadion", "Dortmund").
partido_lugar(m_2006_05, "Volksparkstadion", "Hamburg").
partido_lugar(m_2006_06, "Zentralstadion", "Leipzig").
partido_lugar(m_2006_07, "Frankenstadion", "Nuremberg").
partido_lugar(m_2006_08, "RheinEnergieStadion", "Cologne").
partido_lugar(m_2006_09, "Fritz-Walter-Stadion", "Kaiserslautern").
partido_lugar(m_2006_10, "Arena AufShalke", "Gelsenkirchen").
partido_lugar(m_2006_11, "Niedersachsenstadion", "Hanover").
partido_lugar(m_2006_12, "Waldstadion", "Frankfurt").
partido_lugar(m_2006_13, "Neckarstadion", "Stuttgart").
partido_lugar(m_2006_14, "Olympiastadion", "Berlin").
partido_lugar(m_2006_15, "Zentralstadion", "Leipzig").
partido_lugar(m_2006_16, "Allianz Arena", "Munich").
partido_lugar(m_2006_17, "Westfalenstadion", "Dortmund").
partido_lugar(m_2006_18, "Volksparkstadion", "Hamburg").
partido_lugar(m_2006_19, "Frankenstadion", "Nuremberg").
partido_lugar(m_2006_20, "Olympiastadion", "Berlin").
partido_lugar(m_2006_21, "Arena AufShalke", "Gelsenkirchen").
partido_lugar(m_2006_22, "Neckarstadion", "Stuttgart").
partido_lugar(m_2006_23, "Niedersachsenstadion", "Hanover").
partido_lugar(m_2006_24, "Waldstadion", "Frankfurt").
partido_lugar(m_2006_25, "RheinEnergieStadion", "Cologne").
partido_lugar(m_2006_26, "Fritz-Walter-Stadion", "Kaiserslautern").
partido_lugar(m_2006_27, "Frankenstadion", "Nuremberg").
partido_lugar(m_2006_28, "Allianz Arena", "Munich").
partido_lugar(m_2006_29, "Zentralstadion", "Leipzig").
partido_lugar(m_2006_30, "Westfalenstadion", "Dortmund").
partido_lugar(m_2006_31, "Volksparkstadion", "Hamburg").
partido_lugar(m_2006_32, "Neckarstadion", "Stuttgart").
partido_lugar(m_2006_33, "Niedersachsenstadion", "Hanover").
partido_lugar(m_2006_34, "Olympiastadion", "Berlin").
partido_lugar(m_2006_35, "Fritz-Walter-Stadion", "Kaiserslautern").
partido_lugar(m_2006_36, "RheinEnergieStadion", "Cologne").
partido_lugar(m_2006_37, "Zentralstadion", "Leipzig").
partido_lugar(m_2006_38, "Arena AufShalke", "Gelsenkirchen").
partido_lugar(m_2006_39, "Allianz Arena", "Munich").
partido_lugar(m_2006_40, "Waldstadion", "Frankfurt").
partido_lugar(m_2006_41, "Volksparkstadion", "Hamburg").
partido_lugar(m_2006_42, "Frankenstadion", "Nuremberg").
partido_lugar(m_2006_43, "Neckarstadion", "Stuttgart").
partido_lugar(m_2006_44, "Westfalenstadion", "Dortmund").
partido_lugar(m_2006_45, "Fritz-Walter-Stadion", "Kaiserslautern").
partido_lugar(m_2006_46, "Olympiastadion", "Berlin").
partido_lugar(m_2006_47, "Niedersachsenstadion", "Hanover").
partido_lugar(m_2006_48, "RheinEnergieStadion", "Cologne").
partido_lugar(m_2006_49, "Allianz Arena", "Munich").
partido_lugar(m_2006_50, "Zentralstadion", "Leipzig").
partido_lugar(m_2006_51, "Neckarstadion", "Stuttgart").
partido_lugar(m_2006_52, "Frankenstadion", "Nuremberg").
partido_lugar(m_2006_53, "Fritz-Walter-Stadion", "Kaiserslautern").
partido_lugar(m_2006_54, "RheinEnergieStadion", "Cologne").
partido_lugar(m_2006_55, "Westfalenstadion", "Dortmund").
partido_lugar(m_2006_56, "Niedersachsenstadion", "Hanover").
partido_lugar(m_2006_57, "Olympiastadion", "Berlin").
partido_lugar(m_2006_58, "Volksparkstadion", "Hamburg").
partido_lugar(m_2006_59, "Arena AufShalke", "Gelsenkirchen").
partido_lugar(m_2006_60, "Waldstadion", "Frankfurt").
partido_lugar(m_2006_61, "Westfalenstadion", "Dortmund").
partido_lugar(m_2006_62, "Allianz Arena", "Munich").
partido_lugar(m_2006_63, "Neckarstadion", "Stuttgart").
partido_lugar(m_2006_64, "Olympiastadion", "Berlin").
partido_lugar(m_2010_01, "Soccer City", "Johannesburg").
partido_lugar(m_2010_02, "Cape Town Stadium", "Cape Town").
partido_lugar(m_2010_03, "Nelson Mandela Bay Stadium", "Port Elizabeth").
partido_lugar(m_2010_04, "Ellis Park Stadium", "Johannesburg").
partido_lugar(m_2010_05, "Royal Bafokeng Stadium", "Rustenburg").
partido_lugar(m_2010_06, "Peter Mokaba Stadium", "Polokwane").
partido_lugar(m_2010_07, "Loftus Versfeld Stadium", "Pretoria").
partido_lugar(m_2010_08, "Moses Mabhida Stadium", "Durban").
partido_lugar(m_2010_09, "Soccer City", "Johannesburg").
partido_lugar(m_2010_10, "Free State Stadium", "Bloemfontein").
partido_lugar(m_2010_11, "Cape Town Stadium", "Cape Town").
partido_lugar(m_2010_12, "Royal Bafokeng Stadium", "Rustenburg").
partido_lugar(m_2010_13, "Nelson Mandela Bay Stadium", "Port Elizabeth").
partido_lugar(m_2010_14, "Ellis Park Stadium", "Johannesburg").
partido_lugar(m_2010_15, "Mbombela Stadium", "Nelspruit").
partido_lugar(m_2010_16, "Moses Mabhida Stadium", "Durban").
partido_lugar(m_2010_17, "Loftus Versfeld Stadium", "Pretoria").
partido_lugar(m_2010_18, "Soccer City", "Johannesburg").
partido_lugar(m_2010_19, "Free State Stadium", "Bloemfontein").
partido_lugar(m_2010_20, "Peter Mokaba Stadium", "Polokwane").
partido_lugar(m_2010_21, "Nelson Mandela Bay Stadium", "Port Elizabeth").
partido_lugar(m_2010_22, "Ellis Park Stadium", "Johannesburg").
partido_lugar(m_2010_23, "Cape Town Stadium", "Cape Town").
partido_lugar(m_2010_24, "Moses Mabhida Stadium", "Durban").
partido_lugar(m_2010_25, "Royal Bafokeng Stadium", "Rustenburg").
partido_lugar(m_2010_26, "Loftus Versfeld Stadium", "Pretoria").
partido_lugar(m_2010_27, "Free State Stadium", "Bloemfontein").
partido_lugar(m_2010_28, "Mbombela Stadium", "Nelspruit").
partido_lugar(m_2010_29, "Soccer City", "Johannesburg").
partido_lugar(m_2010_30, "Cape Town Stadium", "Cape Town").
partido_lugar(m_2010_31, "Nelson Mandela Bay Stadium", "Port Elizabeth").
partido_lugar(m_2010_32, "Ellis Park Stadium", "Johannesburg").
partido_lugar(m_2010_33, "Free State Stadium", "Bloemfontein").
partido_lugar(m_2010_34, "Royal Bafokeng Stadium", "Rustenburg").
partido_lugar(m_2010_35, "Peter Mokaba Stadium", "Polokwane").
partido_lugar(m_2010_36, "Moses Mabhida Stadium", "Durban").
partido_lugar(m_2010_37, "Nelson Mandela Bay Stadium", "Port Elizabeth").
partido_lugar(m_2010_38, "Loftus Versfeld Stadium", "Pretoria").
partido_lugar(m_2010_39, "Mbombela Stadium", "Nelspruit").
partido_lugar(m_2010_40, "Soccer City", "Johannesburg").
partido_lugar(m_2010_41, "Peter Mokaba Stadium", "Polokwane").
partido_lugar(m_2010_42, "Ellis Park Stadium", "Johannesburg").
partido_lugar(m_2010_43, "Cape Town Stadium", "Cape Town").
partido_lugar(m_2010_44, "Royal Bafokeng Stadium", "Rustenburg").
partido_lugar(m_2010_45, "Mbombela Stadium", "Nelspruit").
partido_lugar(m_2010_46, "Moses Mabhida Stadium", "Durban").
partido_lugar(m_2010_47, "Loftus Versfeld Stadium", "Pretoria").
partido_lugar(m_2010_48, "Free State Stadium", "Bloemfontein").
partido_lugar(m_2010_49, "Nelson Mandela Bay Stadium", "Port Elizabeth").
partido_lugar(m_2010_50, "Royal Bafokeng Stadium", "Rustenburg").
partido_lugar(m_2010_51, "Free State Stadium", "Bloemfontein").
partido_lugar(m_2010_52, "Soccer City", "Johannesburg").
partido_lugar(m_2010_53, "Moses Mabhida Stadium", "Durban").
partido_lugar(m_2010_54, "Ellis Park Stadium", "Johannesburg").
partido_lugar(m_2010_55, "Loftus Versfeld Stadium", "Pretoria").
partido_lugar(m_2010_56, "Cape Town Stadium", "Cape Town").
partido_lugar(m_2010_57, "Nelson Mandela Bay Stadium", "Port Elizabeth").
partido_lugar(m_2010_58, "Soccer City", "Johannesburg").
partido_lugar(m_2010_59, "Cape Town Stadium", "Cape Town").
partido_lugar(m_2010_60, "Ellis Park Stadium", "Johannesburg").
partido_lugar(m_2010_61, "Cape Town Stadium", "Cape Town").
partido_lugar(m_2010_62, "Moses Mabhida Stadium", "Durban").
partido_lugar(m_2010_63, "Nelson Mandela Bay Stadium", "Port Elizabeth").
partido_lugar(m_2010_64, "Soccer City", "Johannesburg").
partido_lugar(m_2014_01, "Arena Corinthians", "São Paulo").
partido_lugar(m_2014_02, "Arena das Dunas", "Natal").
partido_lugar(m_2014_03, "Arena Fonte Nova", "Salvador").
partido_lugar(m_2014_04, "Arena Pantanal", "Cuiabá").
partido_lugar(m_2014_05, "Estádio Mineirão", "Belo Horizonte").
partido_lugar(m_2014_06, "Estádio Castelão", "Fortaleza").
partido_lugar(m_2014_07, "Arena da Amazônia", "Manaus").
partido_lugar(m_2014_08, "Arena Pernambuco", "Recife").
partido_lugar(m_2014_09, "Estádio Nacional", "Brasília").
partido_lugar(m_2014_10, "Estádio Beira-Rio", "Porto Alegre").
partido_lugar(m_2014_11, "Estádio do Maracanã", "Rio de Janeiro").
partido_lugar(m_2014_12, "Arena Fonte Nova", "Salvador").
partido_lugar(m_2014_13, "Arena da Baixada", "Curitiba").
partido_lugar(m_2014_14, "Arena das Dunas", "Natal").
partido_lugar(m_2014_15, "Estádio Mineirão", "Belo Horizonte").
partido_lugar(m_2014_16, "Estádio Castelão", "Fortaleza").
partido_lugar(m_2014_17, "Arena Pantanal", "Cuiabá").
partido_lugar(m_2014_18, "Estádio Beira-Rio", "Porto Alegre").
partido_lugar(m_2014_19, "Estádio do Maracanã", "Rio de Janeiro").
partido_lugar(m_2014_20, "Arena da Amazônia", "Manaus").
partido_lugar(m_2014_21, "Estádio Nacional", "Brasília").
partido_lugar(m_2014_22, "Arena Corinthians", "São Paulo").
partido_lugar(m_2014_23, "Arena das Dunas", "Natal").
partido_lugar(m_2014_24, "Arena Pernambuco", "Recife").
partido_lugar(m_2014_25, "Arena Fonte Nova", "Salvador").
partido_lugar(m_2014_26, "Arena da Baixada", "Curitiba").
partido_lugar(m_2014_27, "Estádio Mineirão", "Belo Horizonte").
partido_lugar(m_2014_28, "Estádio Castelão", "Fortaleza").
partido_lugar(m_2014_29, "Arena Pantanal", "Cuiabá").
partido_lugar(m_2014_30, "Estádio do Maracanã", "Rio de Janeiro").
partido_lugar(m_2014_31, "Estádio Beira-Rio", "Porto Alegre").
partido_lugar(m_2014_32, "Arena da Amazônia", "Manaus").
partido_lugar(m_2014_33, "Arena da Baixada", "Curitiba").
partido_lugar(m_2014_34, "Arena Corinthians", "São Paulo").
partido_lugar(m_2014_35, "Estádio Nacional", "Brasília").
partido_lugar(m_2014_36, "Arena Pernambuco", "Recife").
partido_lugar(m_2014_37, "Estádio Mineirão", "Belo Horizonte").
partido_lugar(m_2014_38, "Arena das Dunas", "Natal").
partido_lugar(m_2014_39, "Arena Pantanal", "Cuiabá").
partido_lugar(m_2014_40, "Estádio Castelão", "Fortaleza").
partido_lugar(m_2014_41, "Arena Fonte Nova", "Salvador").
partido_lugar(m_2014_42, "Estádio Beira-Rio", "Porto Alegre").
partido_lugar(m_2014_43, "Arena da Amazônia", "Manaus").
partido_lugar(m_2014_44, "Estádio do Maracanã", "Rio de Janeiro").
partido_lugar(m_2014_45, "Estádio Nacional", "Brasília").
partido_lugar(m_2014_46, "Arena Pernambuco", "Recife").
partido_lugar(m_2014_47, "Arena da Baixada", "Curitiba").
partido_lugar(m_2014_48, "Arena Corinthians", "São Paulo").
partido_lugar(m_2014_49, "Estádio Mineirão", "Belo Horizonte").
partido_lugar(m_2014_50, "Estádio do Maracanã", "Rio de Janeiro").
partido_lugar(m_2014_51, "Estádio Castelão", "Fortaleza").
partido_lugar(m_2014_52, "Arena Pernambuco", "Recife").
partido_lugar(m_2014_53, "Estádio Nacional", "Brasília").
partido_lugar(m_2014_54, "Estádio Beira-Rio", "Porto Alegre").
partido_lugar(m_2014_55, "Arena Corinthians", "São Paulo").
partido_lugar(m_2014_56, "Arena Fonte Nova", "Salvador").
partido_lugar(m_2014_57, "Estádio do Maracanã", "Rio de Janeiro").
partido_lugar(m_2014_58, "Estádio Castelão", "Fortaleza").
partido_lugar(m_2014_59, "Estádio Nacional", "Brasília").
partido_lugar(m_2014_60, "Arena Fonte Nova", "Salvador").
partido_lugar(m_2014_61, "Estádio Mineirão", "Belo Horizonte").
partido_lugar(m_2014_62, "Arena Corinthians", "São Paulo").
partido_lugar(m_2014_63, "Estádio Nacional", "Brasília").
partido_lugar(m_2014_64, "Estádio do Maracanã", "Rio de Janeiro").
partido_lugar(m_2018_01, "Luzhniki Stadium", "Moscow").
partido_lugar(m_2018_02, "Central Stadium", "Yekaterinburg").
partido_lugar(m_2018_03, "Krestovsky Stadium", "Saint Petersburg").
partido_lugar(m_2018_04, "Fisht Olympic Stadium", "Sochi").
partido_lugar(m_2018_05, "Kazan Arena", "Kazan").
partido_lugar(m_2018_06, "Otkritie Arena", "Moscow").
partido_lugar(m_2018_07, "Mordovia Arena", "Saransk").
partido_lugar(m_2018_08, "Kaliningrad Stadium", "Kaliningrad").
partido_lugar(m_2018_09, "Samara Arena", "Samara").
partido_lugar(m_2018_10, "Luzhniki Stadium", "Moscow").
partido_lugar(m_2018_11, "Rostov Arena", "Rostov-on-Don").
partido_lugar(m_2018_12, "Nizhny Novgorod Stadium", "Nizhny Novgorod").
partido_lugar(m_2018_13, "Fisht Olympic Stadium", "Sochi").
partido_lugar(m_2018_14, "Volgograd Arena", "Volgograd").
partido_lugar(m_2018_15, "Mordovia Arena", "Saransk").
partido_lugar(m_2018_16, "Otkritie Arena", "Moscow").
partido_lugar(m_2018_17, "Krestovsky Stadium", "Saint Petersburg").
partido_lugar(m_2018_18, "Luzhniki Stadium", "Moscow").
partido_lugar(m_2018_19, "Rostov Arena", "Rostov-on-Don").
partido_lugar(m_2018_20, "Kazan Arena", "Kazan").
partido_lugar(m_2018_21, "Samara Arena", "Samara").
partido_lugar(m_2018_22, "Central Stadium", "Yekaterinburg").
partido_lugar(m_2018_23, "Nizhny Novgorod Stadium", "Nizhny Novgorod").
partido_lugar(m_2018_24, "Krestovsky Stadium", "Saint Petersburg").
partido_lugar(m_2018_25, "Volgograd Arena", "Volgograd").
partido_lugar(m_2018_26, "Kaliningrad Stadium", "Kaliningrad").
partido_lugar(m_2018_27, "Otkritie Arena", "Moscow").
partido_lugar(m_2018_28, "Rostov Arena", "Rostov-on-Don").
partido_lugar(m_2018_29, "Fisht Olympic Stadium", "Sochi").
partido_lugar(m_2018_30, "Nizhny Novgorod Stadium", "Nizhny Novgorod").
partido_lugar(m_2018_31, "Central Stadium", "Yekaterinburg").
partido_lugar(m_2018_32, "Kazan Arena", "Kazan").
partido_lugar(m_2018_33, "Volgograd Arena", "Volgograd").
partido_lugar(m_2018_34, "Samara Arena", "Samara").
partido_lugar(m_2018_35, "Kaliningrad Stadium", "Kaliningrad").
partido_lugar(m_2018_36, "Mordovia Arena", "Saransk").
partido_lugar(m_2018_37, "Fisht Olympic Stadium", "Sochi").
partido_lugar(m_2018_38, "Luzhniki Stadium", "Moscow").
partido_lugar(m_2018_39, "Rostov Arena", "Rostov-on-Don").
partido_lugar(m_2018_40, "Krestovsky Stadium", "Saint Petersburg").
partido_lugar(m_2018_41, "Kazan Arena", "Kazan").
partido_lugar(m_2018_42, "Central Stadium", "Yekaterinburg").
partido_lugar(m_2018_43, "Otkritie Arena", "Moscow").
partido_lugar(m_2018_44, "Nizhny Novgorod Stadium", "Nizhny Novgorod").
partido_lugar(m_2018_45, "Volgograd Arena", "Volgograd").
partido_lugar(m_2018_46, "Samara Arena", "Samara").
partido_lugar(m_2018_47, "Kaliningrad Stadium", "Kaliningrad").
partido_lugar(m_2018_48, "Mordovia Arena", "Saransk").
partido_lugar(m_2018_49, "Kazan Arena", "Kazan").
partido_lugar(m_2018_50, "Fisht Olympic Stadium", "Sochi").
partido_lugar(m_2018_51, "Luzhniki Stadium", "Moscow").
partido_lugar(m_2018_52, "Nizhny Novgorod Stadium", "Nizhny Novgorod").
partido_lugar(m_2018_53, "Samara Arena", "Samara").
partido_lugar(m_2018_54, "Rostov Arena", "Rostov-on-Don").
partido_lugar(m_2018_55, "Krestovsky Stadium", "Saint Petersburg").
partido_lugar(m_2018_56, "Otkritie Arena", "Moscow").
partido_lugar(m_2018_57, "Nizhny Novgorod Stadium", "Nizhny Novgorod").
partido_lugar(m_2018_58, "Kazan Arena", "Kazan").
partido_lugar(m_2018_59, "Samara Arena", "Samara").
partido_lugar(m_2018_60, "Fisht Olympic Stadium", "Sochi").
partido_lugar(m_2018_61, "Krestovsky Stadium", "Saint Petersburg").
partido_lugar(m_2018_62, "Luzhniki Stadium", "Moscow").
partido_lugar(m_2018_63, "Krestovsky Stadium", "Saint Petersburg").
partido_lugar(m_2018_64, "Luzhniki Stadium", "Moscow").
partido_lugar(m_2022_01, "Al Bayt Stadium", "Al Khor").
partido_lugar(m_2022_02, "Khalifa International Stadium", "Al Rayyan").
partido_lugar(m_2022_03, "Al Thumama Stadium", "Doha").
partido_lugar(m_2022_04, "Ahmad bin Ali Stadium", "Al Rayyan").
partido_lugar(m_2022_05, "Lusail Stadium", "Lusail").
partido_lugar(m_2022_06, "Education City Stadium", "Al Rayyan").
partido_lugar(m_2022_07, "Stadium 974", "Doha").
partido_lugar(m_2022_08, "Al Janoub Stadium", "Al Wakrah").
partido_lugar(m_2022_09, "Al Bayt Stadium", "Al Khor").
partido_lugar(m_2022_10, "Khalifa International Stadium", "Al Rayyan").
partido_lugar(m_2022_11, "Al Thumama Stadium", "Doha").
partido_lugar(m_2022_12, "Ahmad bin Ali Stadium", "Al Rayyan").
partido_lugar(m_2022_13, "Al Janoub Stadium", "Al Wakrah").
partido_lugar(m_2022_14, "Education City Stadium", "Al Rayyan").
partido_lugar(m_2022_15, "Stadium 974", "Doha").
partido_lugar(m_2022_16, "Lusail Stadium", "Lusail").
partido_lugar(m_2022_17, "Ahmad bin Ali Stadium", "Al Rayyan").
partido_lugar(m_2022_18, "Al Thumama Stadium", "Doha").
partido_lugar(m_2022_19, "Khalifa International Stadium", "Al Rayyan").
partido_lugar(m_2022_20, "Al Bayt Stadium", "Al Khor").
partido_lugar(m_2022_21, "Al Janoub Stadium", "Al Wakrah").
partido_lugar(m_2022_22, "Education City Stadium", "Al Rayyan").
partido_lugar(m_2022_23, "Stadium 974", "Doha").
partido_lugar(m_2022_24, "Lusail Stadium", "Lusail").
partido_lugar(m_2022_25, "Ahmad bin Ali Stadium", "Al Rayyan").
partido_lugar(m_2022_26, "Al Thumama Stadium", "Doha").
partido_lugar(m_2022_27, "Khalifa International Stadium", "Al Rayyan").
partido_lugar(m_2022_28, "Al Bayt Stadium", "Al Khor").
partido_lugar(m_2022_29, "Al Janoub Stadium", "Al Wakrah").
partido_lugar(m_2022_30, "Education City Stadium", "Al Rayyan").
partido_lugar(m_2022_31, "Stadium 974", "Doha").
partido_lugar(m_2022_32, "Lusail Stadium", "Lusail").
partido_lugar(m_2022_33, "Khalifa International Stadium", "Al Rayyan").
partido_lugar(m_2022_34, "Al Bayt Stadium", "Al Khor").
partido_lugar(m_2022_35, "Al Thumama Stadium", "Doha").
partido_lugar(m_2022_36, "Ahmad bin Ali Stadium", "Al Rayyan").
partido_lugar(m_2022_37, "Al Janoub Stadium", "Al Wakrah").
partido_lugar(m_2022_38, "Education City Stadium", "Al Rayyan").
partido_lugar(m_2022_39, "Stadium 974", "Doha").
partido_lugar(m_2022_40, "Lusail Stadium", "Lusail").
partido_lugar(m_2022_41, "Al Thumama Stadium", "Doha").
partido_lugar(m_2022_42, "Ahmad bin Ali Stadium", "Al Rayyan").
partido_lugar(m_2022_43, "Al Bayt Stadium", "Al Khor").
partido_lugar(m_2022_44, "Khalifa International Stadium", "Al Rayyan").
partido_lugar(m_2022_45, "Al Janoub Stadium", "Al Wakrah").
partido_lugar(m_2022_46, "Education City Stadium", "Al Rayyan").
partido_lugar(m_2022_47, "Lusail Stadium", "Lusail").
partido_lugar(m_2022_48, "Stadium 974", "Doha").
partido_lugar(m_2022_49, "Khalifa International Stadium", "Al Rayyan").
partido_lugar(m_2022_50, "Ahmad bin Ali Stadium", "Al Rayyan").
partido_lugar(m_2022_51, "Al Thumama Stadium", "Doha").
partido_lugar(m_2022_52, "Al Bayt Stadium", "Al Khor").
partido_lugar(m_2022_53, "Al Janoub Stadium", "Al Wakrah").
partido_lugar(m_2022_54, "Stadium 974", "Doha").
partido_lugar(m_2022_55, "Education City Stadium", "Al Rayyan").
partido_lugar(m_2022_56, "Lusail Stadium", "Lusail").
partido_lugar(m_2022_57, "Education City Stadium", "Al Rayyan").
partido_lugar(m_2022_58, "Lusail Stadium", "Lusail").
partido_lugar(m_2022_59, "Al Thumama Stadium", "Doha").
partido_lugar(m_2022_60, "Al Bayt Stadium", "Al Khor").
partido_lugar(m_2022_61, "Lusail Stadium", "Lusail").
partido_lugar(m_2022_62, "Al Bayt Stadium", "Al Khor").
partido_lugar(m_2022_63, "Khalifa International Stadium", "Al Rayyan").
partido_lugar(m_2022_64, "Lusail Stadium", "Lusail").

% alargue(Id): el partido se fue a tiempo extra.
alargue(m_1934_01).
alargue(m_1934_12).
alargue(m_1934_17).
alargue(m_1938_01).
alargue(m_1938_02).
alargue(m_1938_05).
alargue(m_1938_06).
alargue(m_1938_07).
alargue(m_1938_10).
alargue(m_1954_08).
alargue(m_1954_10).
alargue(m_1954_23).
alargue(m_1958_25).
alargue(m_1966_32).
alargue(m_1970_27).
alargue(m_1970_28).
alargue(m_1970_30).
alargue(m_1978_38).
alargue(m_1982_50).
alargue(m_1986_38).
alargue(m_1986_45).
alargue(m_1986_46).
alargue(m_1986_48).
alargue(m_1986_51).
alargue(m_1990_37).
alargue(m_1990_41).
alargue(m_1990_43).
alargue(m_1990_44).
alargue(m_1990_45).
alargue(m_1990_48).
alargue(m_1990_49).
alargue(m_1990_50).
alargue(m_1994_43).
alargue(m_1994_44).
alargue(m_1994_48).
alargue(m_1994_52).
alargue(m_1998_51).
alargue(m_1998_56).
alargue(m_1998_57).
alargue(m_1998_61).
alargue(m_2002_51).
alargue(m_2002_52).
alargue(m_2002_56).
alargue(m_2002_59).
alargue(m_2002_60).
alargue(m_2006_50).
alargue(m_2006_54).
alargue(m_2006_57).
alargue(m_2006_59).
alargue(m_2006_61).
alargue(m_2006_64).
alargue(m_2010_50).
alargue(m_2010_55).
alargue(m_2010_58).
alargue(m_2010_64).
alargue(m_2014_49).
alargue(m_2014_52).
alargue(m_2014_54).
alargue(m_2014_55).
alargue(m_2014_56).
alargue(m_2014_60).
alargue(m_2014_62).
alargue(m_2014_64).
alargue(m_2018_51).
alargue(m_2018_52).
alargue(m_2018_56).
alargue(m_2018_60).
alargue(m_2018_62).
alargue(m_2022_53).
alargue(m_2022_55).
alargue(m_2022_57).
alargue(m_2022_58).
alargue(m_2022_64).

% penales(Id, PenalesLocal, PenalesVisita).
penales(m_1982_50, 5, 4).
penales(m_1986_45, 3, 4).
penales(m_1986_46, 4, 1).
penales(m_1986_48, 4, 5).
penales(m_1990_41, 5, 4).
penales(m_1990_45, 3, 2).
penales(m_1990_49, 4, 3).
penales(m_1990_50, 4, 3).
penales(m_1994_44, 1, 3).
penales(m_1994_48, 4, 5).
penales(m_1994_52, 3, 2).
penales(m_1998_56, 4, 3).
penales(m_1998_57, 3, 4).
penales(m_1998_61, 4, 2).
penales(m_2002_52, 3, 2).
penales(m_2002_59, 3, 5).
penales(m_2006_54, 0, 3).
penales(m_2006_57, 4, 2).
penales(m_2006_59, 1, 3).
penales(m_2006_64, 5, 3).
penales(m_2010_55, 5, 3).
penales(m_2010_58, 4, 2).
penales(m_2014_49, 3, 2).
penales(m_2014_52, 5, 3).
penales(m_2014_60, 4, 3).
penales(m_2014_62, 2, 4).
penales(m_2018_51, 3, 4).
penales(m_2018_52, 3, 2).
penales(m_2018_56, 3, 4).
penales(m_2018_60, 3, 4).
penales(m_2022_53, 1, 3).
penales(m_2022_55, 3, 0).
penales(m_2022_57, 4, 2).
penales(m_2022_58, 3, 4).
penales(m_2022_64, 4, 2).

% repetido(Id): terminó empatado y se volvió a jugar (1934-1938).
repetido(m_1934_12).
repetido(m_1938_01).
repetido(m_1938_02).
repetido(m_1938_10).

% repeticion(Id): es el partido de desempate.
repeticion(m_1934_13).
repeticion(m_1938_08).
repeticion(m_1938_09).
repeticion(m_1938_14).
