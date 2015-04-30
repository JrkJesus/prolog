% cuenta_hojas.pl
%  hojas(+Arbol, -N)
	% Es cierto cuando N unifica con 
	% los nodos que tiene Arbol

:- consult('list2bintreev2.pl').

cuenta_hojasGen(a(_, []), 1).
cuenta_hojasGen(a(_, Hijos), N2 ):-
	Hijos \= [],
	cuenta_hojasGen(Hijos, N2).
	
cuenta_hojasGen([], 0).
cuenta_hojasGen([Cab | Resto], N3 ):-
	cuenta_hojasGen(Cab, N),
	cuenta_hojasGen(Resto, N2),
	N3 is N + N2.


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
%		2	    		3
%	  4   5			  6    7	

arbolGen32(a(1, [
		            a(2,[
		             	a(4,[]),
		             	a(5,[])
		             	]),

	              	a(3,[
		             	a(6,[])
		             	])
	            ]
			
			)).

% 				1 
%		2	    		3
%	  4   5			  6    