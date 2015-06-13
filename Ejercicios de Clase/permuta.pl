%  permuta(+Lista, -ListaR)
	% es cierto cuando ListaR 
	% unifica con una lista que
	% contiene los elementos de 
	% Lista en orden distinto.

permuta([], []).
permuta([Cab | Resto], ListaR):-
	permuta(Resto, R),
	append(Parte1, Parte2, R),
	append(Parte1, [ Cab | Parte2 ], ListaR).
