% suma_nodos.pl
%  suma_nodos(+Arbol, -N)
	% Es cierto cuando N unifica con 
	% la suma de las etiquetas de Arbol

suma_nodos(nil,0).
suma_nodos(a( N, Izq, Dch), N1 ):-
	suma_nodos(Izq, N2),
	suma_nodos(Dch, N3),
	N1 is N + N2 + N3.


arbol1( a(1,nil,nil) ).