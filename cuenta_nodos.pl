% cuenta_nodos.pl
%  cuenta_nodos(+Arbol, -N)
	% Es cierto cuando N unifica con 
	% los nodos que tiene Arbol

cuenta_nodos(nil,0).
cuenta_nodos(a(_, Izq, Dch), N ):-
	cuenta_nodos(Izq, N2),
	cuenta_nodos(Dch, N3),
	N is 1 + N2 + N3.


arbol1( a(1,nil,nil) ).