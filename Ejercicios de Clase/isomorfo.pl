% isomorfo.pl


isomorfo(a(_, ListaArbol1), a(_, ListaArbol2) ):-
	isomorfo(ListaArbol1, ListaArbol2).

isomorfo([], []).
isomorfo([Cab1 | Resto1], [Cab2 | Resto2] ):-
	isomorfo(Cab1, Cab2),
	isomorfo(Resto1, Resto2).

arbolGen11(a(
			1, 
			[a(
				2,[]
			)]
			
			)).

arbolGen12(a(
			1, 
			[a(
				2,[]
			)],
			[a(
				3,[]
			)]
			)).