:- encoding(utf8).
:- use_module(library(apply)).
:- use_module(library(readutil)).
:- ensure_loaded(cargar).
:- use_module(library(http/json)).

% Reconocemos preguntas por palabras y frases. No es comprensión libre.
normalizar(Texto, Tokens) :- string_lower(Texto, Lower), string_chars(Lower,Cs),
    maplist(normal_char,Cs,Ns), string_chars(S,Ns), split_string(S," \t\n\r"," \t\n\r",Tokens).
normal_char(C,N) :- (memberchk(C-N,[á-a,é-e,í-i,ó-o,ú-u,ü-u,ñ-n]) -> true;
    char_type(C,alnum) -> N=C; N=' ').
contiene(T,S) :- append(_,R,T), append(S,_,R), !.
alguna(T,Ss) :- member(S,Ss), contiene(T,S), !.
anio(T,A) :- member(X,T), catch(number_string(A,X),_,fail), integer(A), A>=1900, A=<2100, !.
% Primero probamos los nombres más largos: Alemania Occidental antes de Alemania.
seleccion(T,E) :- findall(L-X,(equipo(X,N,_),normalizar(N,Ts),contiene(T,Ts),length(Ts,L)),Cs),
    keysort(Cs,Orden), reverse(Orden,[_-E|_]), !.
nombre(E,N) :- equipo(E,N,_).
nombres(Es,S) :- maplist(nombre,Es,Ns), atomics_to_string(Ns,", ",S).
texto_lista([],"ninguno registrado").
texto_lista([X|Xs],S) :- atomics_to_string([X|Xs],", ",S).

% Cada intención se traduce a una consulta de las reglas Prolog.
intencion(T,titulos(E)) :- alguna(T,[["titulos"],["cuantas","copas"],["cuantos","mundiales","gano"]]), seleccion(T,E), !.
intencion(T,anios(E)) :- alguna(T,[["en","que","anos"],["en","que","mundiales","fue","campeon"]]), seleccion(T,E), !.
intencion(T,participaciones(E)) :- alguna(T,[["participo"],["participaciones"]]), seleccion(T,E), !.
intencion(T,anfitriones_campeones) :- alguna(T,[["anfitriones","fueron","campeones"],["anfitrion","campeon"],["ganaron","siendo","anfitriones"]]), !.
intencion(T,subcampeon(A)) :- contiene(T,["subcampeon"]), anio(T,A), !.
intencion(T,tercero(A)) :- alguna(T,[["tercero"],["tercer","lugar"]]), anio(T,A), !.
intencion(T,final(A)) :- contiene(T,["final"]), anio(T,A), !.
intencion(T,premio(A,P)) :- member(P,[balon_de_oro,bota_de_oro,guante_de_oro]), atom_string(P,S), split_string(S,"_","",Ts), contiene(T,Ts), anio(T,A), !.
intencion(T,goleador(A)) :- alguna(T,[["goleador"],["goleadores"]]), anio(T,A), !.
intencion(T,partidos(A)) :- contiene(T,["partidos"]), anio(T,A), !.
intencion(T,goles(A)) :- contiene(T,["goles"]), anio(T,A), !.
intencion(T,equipos(A)) :- alguna(T,[["equipos"],["selecciones"]]), anio(T,A), !.
intencion(T,sede(A)) :- alguna(T,[["sede"],["sedes"],["anfitrion"],["donde","se","jugo"],["organizo"]]), anio(T,A), !.
intencion(T,campeon(A)) :- alguna(T,[["campeon"],["gano"]]), anio(T,A), !.

respuesta(campeon(A),S) :- campeon(A,E),nombre(E,N),format(string(S),'~s fue campeón del Mundial ~d.',[N,A]).
respuesta(subcampeon(A),S) :- subcampeon(A,E),nombre(E,N),format(string(S),'~s fue subcampeón del Mundial ~d.',[N,A]).
respuesta(tercero(A),S) :- tercero(A,E),nombre(E,N),format(string(S),'~s obtuvo el tercer lugar en ~d.',[N,A]).
respuesta(sede(A),S) :- torneo(A,_),findall(E,sede(A,E),Es),nombres(Es,N),format(string(S),'Sede(s) de ~d: ~s.',[A,N]).
respuesta(equipos(A),S) :- torneo(A,N),format(string(S),'En ~d participaron ~d selecciones.',[A,N]).
respuesta(partidos(A),S) :- cantidad_partidos(A,N),format(string(S),'En ~d se disputaron ~d partidos.',[A,N]).
respuesta(goles(A),S) :- goles_torneo(A,N),format(string(S),'En ~d se marcaron ~d goles, sin sumar tandas de penales.',[A,N]).
respuesta(titulos(E),S) :- cantidad_titulos(E,N),nombre(E,Nombre),format(string(S),'~s tiene ~d título(s) con esta identidad de selección en la base 1930-2022.',[Nombre,N]).
respuesta(anios(E),S) :- anios_campeon(E,As),texto_lista(As,L),nombre(E,N),format(string(S),'Años en que ~s fue campeón: ~s.',[N,L]).
respuesta(participaciones(E),S) :- anios_participacion(E,As),texto_lista(As,L),nombre(E,N),format(string(S),'Participaciones de ~s: ~s.',[N,L]).
respuesta(anfitriones_campeones,S) :- findall(R,(anfitrion_campeon(A,E),nombre(E,N),format(string(R),'~s (~d)',[N,A])),Rs),texto_lista(Rs,L),format(string(S),'Anfitriones campeones: ~s.',[L]).
respuesta(premio(A,P),S) :- setof(N,J^(premio(A,P,J),jugador(J,N,_)),Ns),atomics_to_string(Ns,", ",L),atomic_list_concat(Ws,'_',P),atomics_to_string(Ws," ",Etiqueta),format(string(S),'~s de ~d: ~s.',[Etiqueta,A,L]).
respuesta(goleador(A),S) :- goleadores(A,Js,N),findall(Nombre,(member(J,Js),jugador(J,Nombre,_)),Ns),atomics_to_string(Ns,", ",L),format(string(S),'Goleador(es) de ~d: ~s, con ~d goles cada uno (sin autogoles).',[A,L,N]).
respuesta(final(A),S) :- partido(I,A,final,L,V,GL,GV),nombre(L,NL),nombre(V,NV),
    (penales(I,PL,PV) -> format(string(Extra),' Tanda de penales: ~d-~d.',[PL,PV]);Extra=""),
    ganador_partido(I,E),nombre(E,NE),format(string(S),'Final ~d: ~s ~d-~d ~s.~s Ganador: ~s.',[A,NL,GL,GV,NV,Extra,NE]).
% En 1950 el campeón se definió en un grupo final, no en una final única.
respuesta(final(1950),"En 1950 no hubo una final única: el título se decidió en un grupo final. Uruguay fue campeón.").

responder(Pregunta,Resultado) :- normalizar(Pregunta,T),
    (intencion(T,I) ->
        (once(respuesta(I,S)) -> Estado=ok;
            S="No tengo ese dato en la base. El alcance es 1930-2022 y puede no existir ese torneo, premio o final.",Estado=sin_datos),
        functor(I,Tipo,_),atom_string(Tipo,Intencion);
        S="No reconozco esa pregunta. Prueba: ¿Quién fue campeón en 2022?, ¿Cuántos títulos tiene Brasil? o ¿Quién fue goleador en 2014?",Estado=no_reconocida,Intencion="ninguna"),
    Resultado=_{respuesta:S,estado:Estado,intencion:Intencion}.

% Modo terminal: una línea por pregunta. 'salir' termina el programa.
chat :- writeln('Chatbot de Mundiales (1930-2022). Escribe salir para terminar.'), bucle.
bucle :- write('> '), flush_output, read_line_to_string(user_input,P),
    (P==end_of_file -> true; P=="salir" -> true; responder(P,R),writeln(R.respuesta),bucle).
