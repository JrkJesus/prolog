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

arBin31(a(1,a(2,nil,a(4,a(5,nil,a(6,nil,nil)),nil)),a(3,nil,nil))).


%		1
%	 2		 3
% nil nil nil nil

% 				1 
%		2	    3		2
%	  1   2			  2    1	

bin2gen(a(Etiq, nil, nil), a(Etiq, [])).

bin2gen(a(Etiq, Izq, Dch), a(Etiq, R) ):-
	Izq \= nil,
	Dch \= nil,
	bin2gen(Izq, IzqR),
	bin2gen(Dch, DchR),
	append([IzqR], [DchR], R).

bin2gen(a(Etiq, nil, Dch), a(Etiq, [DchR]) ):-
	Dch \= nil,
	bin2gen(Dch, DchR).

bin2gen(a(Etiq, Izq, nil), a(Etiq, [IzqR]) ):-
	Izq \= nil,
	bin2gen(Izq, IzqR).


