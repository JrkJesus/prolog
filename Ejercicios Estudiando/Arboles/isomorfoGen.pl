%isomorfoGen.pl

isomorfoGen(a(_, Lhijos1), a(_, Lhijos2)):-
	length(Lhijos1, L),
	length(Lhijos2, L),
	isomorfoGen(Lhijos1, Lhijos2).

isomorfoGen([Cab1 | Resto1], [Cab2 | Resto2]):-
	isomorfoGen(Cab1, Cab2),
	isomorfoGen(Resto1, Resto2).

isomorfoGen([], []).

arbolGen43(a(1, [
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

arbolGen41(a(2, [
	            a(3,[
	             	a(5,[]),
	             	a(7,[])
	             	]),

              	a(4,[
	             	a(6,[]),
	             	a(0,[])
	             	])
            ]
		)).

arbolGen42(a(2, [
	            a(3,[
	             	a(5,[])
	             	]),

              	a(4,[
	             	a(6,[]),
	             	a(0,[])
	             	])
            ]
		)).
