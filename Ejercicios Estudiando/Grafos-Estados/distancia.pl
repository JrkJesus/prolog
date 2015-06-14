% distancia.pl

distancia(Grafo, Inicio, Fin, Dist):-
	distancia(Grafo, Inicio, Fin, [Inicio], Dist).

distancia(g(Vert, Aris), Ini, Fin, Vis, Dis):-
	conectado(Ini, Sig, Cost, Aris),
	\+ member(Sig, Vis),
	distancia(g(Vert, Aris), Sig, Fin, [Sig | Vis], Dtemp),
	Dis is Dtemp + Cost.
distancia(_, Fin, Fin, _, 0).

conectado(Inicio, Fin, Coste, Arista):-
	member(arista(Inicio, Fin, Coste), Arista).
conectado(Inicio, Fin, Coste, Arista):-
	member(arista(Fin, Inicio, Coste), Arista).

grafo1(g([a,b,c,d], [arista(a,b,2), arista(a, c, 5), arista(b,c,9), arista(d, b, 7)])).