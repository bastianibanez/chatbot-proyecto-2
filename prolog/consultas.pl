:- encoding(utf8).
:- ensure_loaded(chatbot).
:- use_module(library(http/json)).
:- use_module(library(time)).
:- use_module(library(aggregate)).
:- use_module(library(solution_sequences)).

% Ejecutar directamente el objetivo y convertir sus soluciones a JSON para Python.
consultar_json(Texto, Limite, JSON) :-
    catch(call_with_time_limit(30,
            (consulta_resultado(Texto, Limite, Resultado),
             atom_json_dict(JSON, Resultado, [width(0)]),
             atom_length(JSON, Largo),
             (Largo =< 60000 -> true ; throw(resultado_excesivo)))),
          Error, (consulta_error(Error, Fallo), atom_json_dict(JSON, Fallo, [width(0)]))).

consulta_resultado(Texto, Limite, Resultado) :-
    read_term_from_atom(Texto, Goal, [variable_names(Vars)]),
    include(variable_visible, Vars, Visibles),
    Extra is Limite+1,
    once(findnsols(Extra, Visibles, Goal, Filas)),
    (length(Filas, Extra) -> length(Primeras, Limite), append(Primeras, [_], Filas), Truncado=true
    ; Primeras=Filas, Truncado=false),
    % Evitar expandir listas intermedias enormes en miles de objetos JSON.
    term_size(Primeras, Tamano),
    (Tamano =< 50000 -> true ; throw(resultado_excesivo)),
    maplist(consulta_fila, Primeras, Resultados),
    (Resultados=[] -> Estado=sin_datos ; Estado=ok),
    Resultado=_{estado:Estado, resultados:Resultados, truncado:Truncado}.

variable_visible(N=_) :- \+ sub_atom(N,0,1,_, '_').

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

consulta_error(time_limit_exceeded, _{estado:limite, detalle:"La consulta superó 30 segundos. Simplifícala."}) :- !.
consulta_error(resultado_excesivo, _{estado:limite, detalle:"El resultado es demasiado grande. Usa nombres con _ inicial para listas y variables intermedias (por ejemplo _Filas, _Ascendente, _Ordenadas) y devuelve solo los datos finales necesarios. No se devolvieron resultados parciales."}) :- !.
consulta_error(Error, _{estado:consulta_invalida, detalle:Mensaje}) :- message_to_string(Error,Mensaje).
