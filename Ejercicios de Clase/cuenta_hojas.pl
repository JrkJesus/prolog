% cuenta_hojas.pl
%  hojas(+Arbol, -N)
	% Es cierto cuando N unifica con 
	% los nodos que tiene Arbol

:- consult('list2bintreev2.pl').

cuenta_hojas(nil,0).
cuenta_hojas(a(_, nil, nil), 1 ).

cuenta_hojas(a(_, nil, Dch), N2 ):-
	Dch \= nil,
	cuenta_hojas(Dch, N2).
	

cuenta_hojas(a(_, Izq, nil), N3 ):-
	Izq \= nil,
	cuenta_hojas(Izq, N3).



cuenta_hojas(a(_, Izq, Dch), N ):-
	Izq \= nil,
	Dch \= nil,
	cuenta_hojas(Dch, N3),
	cuenta_hojas(Izq, N2),
	N is N2 + N3.


arbol1( a(1,nil,nil) ).