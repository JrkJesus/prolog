% masVeces(+Lista, -Elem, - Num).
	% Es cierto cuando Elem unifica con
	% el elemento que mas veces se repite
	% en Lista y Num es el numero de veces
	% que se repite

mayor([],_,0).

mayor([ ( _ , N) | Resto ], Elem, Num):-
	mayor(Resto, Elem, Num),
	Num > N.

mayor([ (Cab, N) | Resto ], Cab, N):-
	mayor(Resto, _ , Num),
	Num =< N.

masVeces(Lista, Elem, Num):-
	quick(Lista, ListaOrd),
	comprime(ListaOrd, ListaComp),
	mayor(ListaComp, Elem, Num).

