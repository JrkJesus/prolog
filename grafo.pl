% Representacion de grafos
	% [ arista(b,a), arista(c,d), arista(d,e)] -> Malo porque no permite ver muchas cosas
	% grafo([a,b,c,d,e],[arista(b,a,coste), arista(d,c), arista(d,e), arista(b,e)]). 
	% |-> coste es opcional.

grafo1(grafo([a,b,c,d,e],[arista(b,a), arista(d,c), arista(d,e), arista(b,e)])).

% Grafo dirigido usando conectado(+A,+B)
	conectado(A,B,grafo(Vert, Arist)):-
		member(arista(A,B),Arist).
	conectado(A,B,grafo(Vert, Arist)):-
		member(arista(B,A),Arist). 


% CaminoGrafo -> existira un camino desde inicio hasta fin, si puedo avanzar hasta un punto temporal
	% y ademas existe un camino desde este punto hasta el final.
	% CASO BASE: cuando inicio coincida con final

% camino(+Grafo, +Ini, +Fin, -Camino): Es cierto cuando camino unifique con una lista
	% (de vertices o de arista), que unen Ini con Fin en el grafo Grafo.

%camino(_, Ini, Ini, [Ini]):-
%	member(Ini, V). % el camino puede ser [] si es con arista.
%camino(grafo(Vert, Aris), Ini, Fin, [Ini | Camino]):-	% [arista(Ini, Sig) | Camino]
%	member(arista(Ini,Sig), Aris),
%	camino(grafo(Vert, Aris) Sig, Fin, Camino).
% Problema con los ciclos!! 


camino(grafo(Vert, Aris), Ini, Fin, [Ini | Camino]):-	% [arista(Ini, Sig) | Camino]
	camino(grafo(Vert, Aris) Ini, Fin, [Ini], Camino).

camino(_, Ini, Ini, _, [Ini]):-
	member(Ini, V).
camino(grafo(Vert, Aris), Ini, Fin, Visitados, [Ini | Camino]):-
	member(arista(Ini, Sig), Aris),
	\+ member(Sig, Visitados),
	camino(grafo(Vert, Aris), Ini, Fin, [Sig | Visitados], Camino).

% Llamada a la funcion: grafo1(G), camino(G,a,e,[a],Resultado).

caminoNoDirigido(_, Ini, Ini, _, [Ini]):-
	member(Ini, V).
caminoNoDirigido(grafo(Vert, Aris), Ini, Fin, Visitados, [Ini | Camino]):-
	conectado(Ini, Sig, Aris),
	\+ member(Sig, Visitados),
	caminoNoDirigido(grafo(Vert, Aris), Ini, Fin, [Sig | Visitados], Camino).















