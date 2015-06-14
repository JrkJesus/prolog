% ciclos.pl

ciclos(g(Ver, Aris), [Ini | Camino]):-
	member(Ini, Ver),
	conectado(Ini, Sig, _ , Aris),
	camino(g(Ver, Aris), Sig, Ini, [], Camino).

camino(_ , Ini, Ini, _ , [Ini]).
camino(g(Ver, Aris), Ini, Fin, Visitados, [Ini | Camino]):-
	conectado(Ini, Sig, _ , Aris),
	\+ member(Sig, Visitados),
	camino(g(Ver, Aris), Sig, Fin, [Sig | Visitados], Camino).

conectado(Inicio, Fin, Coste, Arista):-
	member(arista(Inicio, Fin, Coste), Arista).
conectado(Inicio, Fin, Coste, Arista):-
	member(arista(Fin, Inicio, Coste), Arista).

grafo1(g([a,b,c,d], [arista(a,b,2), arista(a, c, 5), arista(b,c,9), arista(d, b, 7), arista(c, d, 2)])).


%      c
%     /|\
%    / | \
%   /  |  \
% a -- b -- d