% =============================================================
% Punto de entrada: carga la base de conocimiento completa.
%   swipl prolog/cargar.pl
% =============================================================

% Hechos generados desde el dataset (scripts/csv_a_prolog.py).
:- ensure_loaded(kb/torneos).
:- ensure_loaded(kb/equipos).
:- ensure_loaded(kb/partidos).
:- ensure_loaded(kb/goles).
:- ensure_loaded(kb/jugadores).
:- ensure_loaded(kb/premios).

% Hechos agregados a mano.
:- ensure_loaded(kb_manual).
