% conexo.pl

conexo(g([E], _)).
conexo(g([Cab | Resto], A)):-
	member(Sig, Resto),
	existeCamino(g([Cab | Resto],A), Cab, Sig, [Cab]),
	conexo(g(Resto, A)).

existeCamino( _ , Fin, Fin, _).
existeCamino(g(V, A), Ini, Fin, Vis):-
	conectado(Ini, Sig, _, A),
	\+ member(Sig, Vis),
	existeCamino(g(V,A),Sig, Fin, [Sig | Vis]).

conectado(Inicio, Fin, Coste, Arista):-
	member(arista(Inicio, Fin, Coste), Arista).
conectado(Inicio, Fin, Coste, Arista):-
	member(arista(Fin, Inicio, Coste), Arista).


grafo1(g([a,b,c,d], [arista(a,b,2), arista(a, c, 5), arista(b,c,9), arista(d, b, 7)])).
grafo2(g([a,b,c,d], [arista(a,b,2), arista(c,d,3)])).