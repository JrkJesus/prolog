% cuenta_nodos.pl
%  cuenta_nodos(+Arbol, -N)
	% Es cierto cuando N unifica con 
	% los nodos que tiene Arbol

nodos_aGen(a(_, ListaArbol), N ):-
	nodos_aGen(ListaArbol, N2),
	N is 1 + N2.

nodos_aGen([] ,0).
nodos_aGen([Cab | Resto], NR ):-
	nodos_aGen(Cab, Ncab),
	nodos_aGen(Resto, N2),
	NR is Ncab + N2.