% balanceado.pl
% balanceado(+Arbol).
	% Arbol esta balanceado si para todos los nodos
	% la diferencia de altura es como mucho 1.

:- consult('list2bintreev2.pl').

altura(nil, 0).
altura(a(_ , Izq, Dch),  Alt ):-
	altura(Izq, Nv1),
	altura(Dch, Nv2),
	Nv1>Nv2,
	Alt is Nv1 + 1.

altura(a(_ , Izq, Dch),  Alt ):-
	altura(Izq, Nv1),
	altura(Dch, Nv2),
	Nv1=<Nv2,
	Alt is Nv2 + 1.

balanceado(nil).
balanceado(a(_ , Izq, Dch)):-
	altura(Izq, AltIzq),
	altura(Dch, AltDch),
	Dif is abs(AltIzq-AltDch),
	Dif=<1,
	balanceado(Izq),
	balanceado(Dch).

arbol1(a(1,a(2,nil,nil),a(3,nil,nil))).


%		1
%	 2		 3
% nil nil nil nil


arbol2(	a(1,a(2,nil,a(4,nil,nil)),a(3,nil,nil))).


%		   1
%	  2			  3
% nil 	 4

arbol3(	a(1,a(2,nil,a(4,a(5,nil,nil),nil)),a(3,nil,nil))).


%		   1
%	  2			  3
% nil 	4	
%	  5  nil