:- encoding(utf8).
:- use_module(library(lists)).
% Reglas: usamos los hechos originales para obtener conocimiento nuevo.
campeon(A, E) :- posicion_final(A, 1, E).
subcampeon(A, E) :- posicion_final(A, 2, E).
tercero(A, E) :- posicion_final(A, 3, E).
anfitrion_campeon(A, E) :- sede(A, E), campeon(A, E).

% Una selección participa si aparece en al menos un partido.
participa(E, A) :- torneo(A, _), setof(X, I^F^L^V^GL^GV^(partido(I,A,F,L,V,GL,GV), (X=L;X=V)), Equipos), member(E, Equipos).
cantidad_titulos(E, N) :- equipo(E, _, _), findall(A, campeon(A,E), As), length(As,N).
anios_campeon(E, As) :- equipo(E,_,_), findall(A,campeon(A,E),As).
anios_participacion(E, As) :- equipo(E,_,_), findall(A,participa(E,A),As).
cantidad_partidos(A,N) :- torneo(A,_), findall(I,partido(I,A,_,_,_,_,_),Is), length(Is,N).
goles_torneo(A,N) :- torneo(A,_), findall(S,(partido(_,A,_,_,_,L,V),S is L+V),Ss), sum_list(Ss,N).

% El marcador NO suma la tanda de penales.
ganador_partido(I,E) :- partido(I,_,_,L,V,GL,GV),
    (GL>GV -> E=L; GV>GL -> E=V; penales(I,PL,PV), (PL>PV -> E=L; PV>PL -> E=V)).
empate_marcador(I) :- partido(I,_,_,_,_,G,G).

% Los autogoles no se cuentan como goles propios del jugador.
goles_jugador(J,A,N) :- jugador(J,_,_), torneo(A,_),
    findall(M,(partido(I,A,_,_,_,_,_),gol(I,J,_,M,T),T\=autogol),Ms), length(Ms,N).
goleadores(A,Js,N) :- torneo(A,_),
    findall(J,(partido(I,A,_,_,_,_,_),gol(I,J,_,_,T),T\=autogol),Todos), sort(Todos,Candidatos),
    findall(C,(member(J,Candidatos),goles_jugador(J,A,C)),Cs), max_list(Cs,N),
    findall(J,(member(J,Candidatos),goles_jugador(J,A,N)),Js).

% Conservamos las selecciones históricas como entidades diferentes.
% Alemania Occidental y Alemania no se fusionan automáticamente.
