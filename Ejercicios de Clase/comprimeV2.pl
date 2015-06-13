comprimev2([], []).
comprimev2([E], [E]).
comprimev2([E1, E1|Resto], [(E1,N2) |R]):-
	comprimev2([E1|Resto], [(E1,N)|R]),
	N2 is N+1.

comprimev2([E1, E1|Resto], [(E1,2) |R]):-
	comprimev2([E1|Resto], [E1|R]).

comprimev2([E1, E2 | Resto], [ E1 | R ] ):-
	E1\=E2,
	comprimev2([ E2 | Resto ], R ).
