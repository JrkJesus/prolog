
% recorrido_inorden(+Abol, Lista)
	% Izq - Etiq - Dch

recorrido_inorden(nil, []).
recorrido_inorden(a(Etiq, Izq, Dch),  ListaR):-
	recorrido_inorden(Izq, IzqR),
	recorrido_inorden(Dch, DchR),
	append(IzqR, [Etiq | DchR], ListaR).



% recorrido_preorden(+Abol, Lista)
	% Etq - Izq  - Dch

recorrido_preorden(nil, []).
recorrido_preorden(a(Etiq, Izq, Dch),  ListaR):-
	recorrido_preorden(Izq, IzqR),
	recorrido_preorden(Dch, DchR),
	append([Etiq |IzqR],  DchR, ListaR).


% recorrido_postorden(+Abol, Lista)
	% Izq  - Dch - Etq

recorrido_postorden(nil, []).
recorrido_postorden( a(Etiq, Izq, Dch),  [ Etiq | ListaR ] ):-
	recorrido_postorden(Izq, IzqR),
	recorrido_postorden(Dch, DchR),
	append(IzqR,  DchR, ListaR).
