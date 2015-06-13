% masVeces(+Lista, -Elem, - Num).
	% Es cierto cuando Elem unifica con
	% el elemento que mas veces se repite
	% en Lista y Num es el numero de veces
	% que se repite

mayor([(E, N)],E,N).

mayor([ ( E1 , N1) ( E2 , N2) | Resto ], Elem, Num):-
	mayor(( E2 , N2) | Resto, Elem, Num),
	Num > N.

mayor([ ( E1 , N1) ( E2 , N2) | Resto ], Cab, N):-
	mayor(( E2 , N2) | Resto, _ , Num),
	Num =< N.

masVeces(Lista, Elem, Num):-
	quick(Lista, ListaOrd),
	comprime(ListaOrd, ListaComp),
	mayor(ListaComp, Elem, Num).

