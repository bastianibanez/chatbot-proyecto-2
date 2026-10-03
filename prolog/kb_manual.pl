% =============================================================
% Conocimiento agregado a mano.
%
% Los archivos de kb/ se regeneran desde el dataset y no se editan.
% Las correcciones o datos nuevos (por ejemplo, el Mundial 2026) van
% en este archivo.
%
% Los hechos se escriben como directivas assertz/retract, no como
% cláusulas sueltas: si este archivo definiera, por ejemplo, sede/2
% directamente, Prolog reemplazaría todas las sedes cargadas desde
% kb/torneos.pl. Funciona porque los predicados de kb/ son dynamic.
%
% Ejemplos:
%   :- assertz(torneo(2026, 48)).                      agrega un hecho
%   :- retract(posicion_final(2022, 3, croacia)).      elimina un hecho
% =============================================================
