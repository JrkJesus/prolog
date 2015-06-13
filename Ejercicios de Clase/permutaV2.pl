%  permuta(+Lista, -ListaR)
	% es cierto cuando ListaR 
	% unifica con una lista que
	% contiene los elementos de 
	% Lista en orden distinto.

permutav2([], []).
permutav2(Lista, [E | R]):-
	append(L1, [E | L2], Lista),
	append(L1, L2, Resto),
	permutav2(Resto, R).