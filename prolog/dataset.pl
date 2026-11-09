:- encoding(utf8).
:- ensure_loaded(kb/dataset/cargar).

% Filtros es un dict parcial: solo se indican las columnas de interés.
% Ejemplo: registro(squads, _{tournament_id:"WC-2022", team_name:"Argentina", player_id:Jugador}).
% Con Filtros libre se devuelve la fila completa. Los textos e IDs son strings.
registro(Tabla, Filtros) :-
    tabla_dataset(Tabla, _, _),
    atom_concat(datos_, Tabla, Predicado),
    Goal =.. [Predicado, Fila],
    call(Goal),
    (var(Filtros) -> Filtros = Fila ; Filtros :< Fila).
