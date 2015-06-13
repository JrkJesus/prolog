% invertir.pl

invertirGen(a(Etiq, RM), a(Etiq, RI)):-
	invertirGen(RM, RI).
invertirGen([], []).
invertirGen([Cab | RM], LR):-
	invertirGen(Cab, CabR),
	invertirGen(RM, RestoI),
	append(RestoI, [CabR], LR).

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