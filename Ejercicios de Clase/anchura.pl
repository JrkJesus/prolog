% anchura.pl

arbol1(a(1,
			a(2,
				a(4,nil,nil),
				a(5,nil,nil)),
			a(3,
				a(6,nil,nil),
				a(7,nil,nil))
		)).
%		1
%	 2		 3
%  4  5    6  7


arbol2(	a(1,a(2,nil,a(4,nil,nil)),a(3,nil,nil))).
%		   1
%	  2			  3
% nil 	 4

arbol3(	a(1,a(2,nil,a(4,a(5,nil,a(6,nil,nil)),nil)),a(3,nil,nil))).
%		   1
%	  2			  3
% nil 	4	
%	  5  nil
%   nil 6



recorrido_anchura(a(Etiq, Izq, Dch), ListaR):-
	recorrido_anchura([a(Etiq, Izq, Dch)], ListaR).

%recorrido_anchura([],[]).
recorrido_anchura([a(Etiq, nil, nil)], [Etiq]).

recorrido_anchura( [ a(Etiq, Izq, Dch) | Resto ], [ Etiq | ListaR ] ):-
	Izq \= nil,
	Dch \= nil,
	append(Resto, [Izq, Dch ], R),
	recorrido_anchura(R, ListaR).

recorrido_anchura( [ a(Etiq, Izq, nil) | Resto ], [ Etiq | ListaR ] ):-
	Izq \= nil,
	append(Resto, [Izq], R),
	recorrido_anchura(R, ListaR).

recorrido_anchura( [ a(Etiq, nil, Dch) | Resto ], [ Etiq | ListaR ] ):-
	Dch \= nil,
	append(Resto, [ Dch ], R),
	recorrido_anchura(R, ListaR).

recorrido_anchura( [ a(Etiq, nil, nil) | R ], [ Etiq | ListaR ] ):-
	recorrido_anchura(R, ListaR).





anchura(a(Etiq, Izq, Dch), ListaR):-
	anchura([a(Etiq, Izq, Dch)], ListaR).

%recorrido_anchura([],[]).
anchura([], []).
anchura([nil | Resto ], ListaR):-
	anchura(Resto, ListaR).

anchura( [ a(Etiq, Izq, Dch) | Resto ], [ Etiq | ListaR ] ):-
	append(Resto, [Izq, Dch ], R),
	anchura(R, ListaR).