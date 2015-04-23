% anchura.pl

arbolGen31(a(1, [
		            a(2,[
		             	a(1,[]),
		             	a(2,[])
		             	]),

	             	a(3,[]),

	              	a(2,[
		             	a(2,[]),
		             	a(1,[])
		             	])
	            ]
			
			)).

% 				1 
%		2	    3		2
%	  1   2			  2    1	

anchuraGen([], []).
anchuraGen(a(Etiq, ListaA), [ Etiq | ListaR ]):-
	anchuraGen(ListaA, ListaR).

anchuraGen([ a(Etiq, L) | Resto], [Etiq | RL_R] ):-
	append(Resto, L, RL),
	anchuraGen(RL, RL_R).
	