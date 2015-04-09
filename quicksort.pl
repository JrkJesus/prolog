% divide(+Piv, +Lista, -Men, +May).
	% Divide la lista en los menores que Piv (Men)
	% Y los mayores que Piv (May)

% quick(+Lista, -ListaR)
	% ListaR unificara con lista cuando contenga
	% los elementos de Lista de forma ordenada.
% -- %

% --------------------------------------------------------------------
% --------------------------------------------------------------------
% --------------------------------------------------------------------
% --------------------------------------------------------------------




divide(_,[],[],[]).
divide(P, [Cab | Resto], [Cab | Men], May):-
	P=<Cab,
	divide(P,Resto,Men,May).
divide(P, [Cab | Resto], Men, [Cab | May]):-
	P>Cab,
	divide(P,Resto,Men,May).



quick([],[]).
quick([Cab | Resto], ListaR):-
	divide(Cab,Resto,Men,May),
	quick(Men,MenOrd),
	quick(May,MayOrd),
	append(MenOrd,[Cab | MayOrd], ListaR).
