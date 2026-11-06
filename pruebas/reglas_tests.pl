:- encoding(utf8).
:- use_module(library(plunit)).
:- ensure_loaded('../prolog/chatbot').
:- begin_tests(mundiales).
test(campeon) :- campeon(2022,argentina).
test(participa) :- participa(chile,1962).
test(no_participa,[fail]) :- participa(chile,2022).
test(titulos) :- cantidad_titulos(brasil,5).
test(cero_titulos) :- cantidad_titulos(chile,0).
test(tanda) :- ganador_partido(m_2022_64,argentina).
test(empate) :- empate_marcador(m_2022_64).
test(goles) :- goles_torneo(2022,172).
test(goleador) :- goleadores(2014,[james_rodriguez],6).
test(historica) :- normalizar("Alemania Occidental",T),seleccion(T,alemania_occidental).
test(fuera_alcance) :- responder("¿Quién fue campeón en 2026?",R),R.estado==sin_datos.
test(sin_torneo) :- responder("¿Quién fue campeón en 1942?",R),R.estado==sin_datos.
test(desconocida) :- responder("¿Qué clima hará mañana?",R),R.estado==no_reconocida.
test(acentos) :- responder("QUIEN FUE CAMPEÓN EN 2022",R),R.estado==ok.
test(empate_goleadores) :- goleadores(1962,Js,4),length(Js,6).
test(sin_final) :- responder("final de 1950",R),R.estado==ok.
test(nombre_japon) :- equipo(japon,"Japón",afc).
test(nombre_james) :- jugador(james_rodriguez,"James Rodríguez",mediocampista).
:- end_tests(mundiales).
