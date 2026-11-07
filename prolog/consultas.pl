:- encoding(utf8).
:- ensure_loaded(chatbot).
:- use_module(library(http/json)).
:- use_module(library(time)).
:- use_module(library(aggregate)).
:- use_module(library(solution_sequences)).

% Ejecutar directamente el objetivo y convertir sus soluciones a JSON para Python.
consultar_json(Texto, Limite, JSON) :-
    catch(call_with_time_limit(3, consulta_resultado(Texto, Limite, Resultado)),
          Error, consulta_error(Error, Resultado)),
    atom_json_dict(JSON, Resultado, []).

consulta_resultado(Texto, Limite, Resultado) :-
    read_term_from_atom(Texto, Goal, [variable_names(Vars)]),
    Extra is Limite+1,
    once(findnsols(Extra, Vars, Goal, Filas)),
    (length(Filas, Extra) -> length(Primeras, Limite), append(Primeras, [_], Filas), Truncado=true
    ; Primeras=Filas, Truncado=false),
    maplist(consulta_fila, Primeras, Resultados),
    (Resultados=[] -> Estado=sin_datos ; Estado=ok),
    Resultado=_{estado:Estado, resultados:Resultados, truncado:Truncado}.

consulta_fila(Vars, Dict) :-
    (acyclic_term(Vars) -> true ; throw(error(type_error(acyclic_term, resultado),_))),
    findall(N-J, (member(N=V, Vars), \+ sub_atom(N,0,1,_, '_'), consulta_valor(V,J)), Pares),
    dict_pairs(Dict, _, Pares).

consulta_valor(V, null) :- var(V), !.
consulta_valor(V, V) :- (string(V); atom(V); integer(V); float(V)), !.
consulta_valor(V, J) :- is_list(V), !, maplist(consulta_valor,V,J).
consulta_valor(V, _{functor:F, argumentos:Args}) :-
    compound(V), !, V =.. [F|Vs], maplist(consulta_valor,Vs,Args).
consulta_valor(V, J) :- term_string(V,J).

consulta_error(time_limit_exceeded, _{estado:limite, detalle:"La consulta superó 3 segundos. Simplifícala."}) :- !.
consulta_error(Error, _{estado:consulta_invalida, detalle:Mensaje}) :- message_to_string(Error,Mensaje).
