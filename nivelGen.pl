% anchura.pl

arbolGen31(a(1, [
		            a(2,[
		             	a(4,[]),
		             	a(5,[])
		             	]),

	              	a(3,[
		             	a(6,[]),
		             	a(7,[])
		             	])
	            ]
			
			)).

% 				1 
%		2	    3		2
%	  1   2			  2    1	

nivelGen(0, a(E, _), [E]).

nivelGen(N, a(Etiq, ListaA), ):-
	N>0,
	N2 is N - 1,
	nivelGen(N2, ListaA, ListaR).



nivelGen(0, Lista, R ):- etiquetas(Lista, R).

nivelGen(N, Lista, R):-
	N>0,
	N2 is N-1,
	cambio_nivel(Lista, ListaR),
	nivelGen(N2, ListaR, R).



etiquetas([],[]).
etiquetas( [a(E, _ ) |Resto], [E | R]):-
	etiquetas(resto, R).



cambio_nivel([], []).

cambio_nivel( [ a(_ , ListaHijo) | RestoPadres ], ListaR ):-
	cambio_nivel(RestoPadres, Resultante),
	append(ListaHijo, Resultante, ListaR).


%  INICIAL: 
	%  			   1
	%      2       3           4
	%     5 6      7         8 9 10 

%  1 PASO: 
	%  			   1
	%      3       4	   5  	6
	%      7     8 9 10 

%  2 PASO: 
	%  			   1
	%      4	   5  	6   7
	%    8 9 10 

%  Final: 
	%  			1
	%      4 5 6 8 9 10 
	%        