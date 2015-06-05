% camino_coste(+G, +Ini, +Fin, ?Visitados, -Camino, -Coste)
	% Es cierto cuando Camino unifica con una lista de 
	% vertices que va desde Ini hasta Fin en el grafo G
	% y coste unifica con la suma de los pesos de las
	% aristas del Camino.
	% El grado es no Dirigido.

camino_coste(G, Ini, Fin, Camino, Coste):- camino_coste(G, Ini, Fin, [Ini], Camino, Coste).

camino_coste(g(V, _), Ini, Ini, _ , [Ini], 0):- member(Ini, V).

camino_coste(g(V, A), Ini, Fin, Visitados, [Ini | Camino], CosteTotal):-
	conectado(Ini, Sig, A, CosteActual),
	\+ member(Sig, Visitados),
	camino_coste(g(V, A), Sig, Fin, [Sig | Visitados], Camino, Coste),
	CosteTotal is Coste + CosteActual.

% conectado(+Ini, +Fin, +Aristas, -Coste)
	% Es cierto cuando Coste unifica con 
	% el peso de la arista que conecta
	% Ini y Fin y dicha arista pertenece
	% a la lista de Aristas.

conectado(Ini, Fin, Arista, Coste):- member(arista(Ini, Fin, Coste), Arista).
conectado(Ini, Fin, Arista, Coste):- member(arista(Fin, Ini, Coste), Arista).

grafo1(g([a,b,c,d,e],[arista(b,a,3), arista(d,c,5), arista(d,e,4), arista(b,e,7)])).
grafo2(g([1,2,3,4],[arista(1,2,3),arista(1,3,4),arista(1,4,5),arista(4,2,2),arista(3,4,2)])).
% 1 --- 2
% | \   |
% |  \  |
% |   \ |
% 3 --- 4
grafo3(g([1,2,4],[arista(1,2,3),arista(1,4,5),arista(4,2,2)])).
% 1 --- 2
%   \   |
%    \  |
%     \ |
%       4

ciclos(g([],_), []).

%ciclos(g([Cab | Resto], A), R2):-
ciclos(g(V, A), Resultado):-
	append(_, [Cab | _ ], V),
	conectado(Cab, Sig, A, _),
	findall( [Cab | Camino], camino_coste(g(V, A), Sig, Cab, Camino, _), Resultado).