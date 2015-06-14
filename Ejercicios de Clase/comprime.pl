comprime([], []).
comprime([E], [(E,1)]).
comprime([E1, E1|Resto], [(E1,N2) |R]):-
	comprime([E1|Resto], [(E1,N)|R]),
	N2 is N+1.

comprime([E1, E2 | Resto], [ (E1,1) | R ] ):-
	E1\=E2,
	comprime([ E2 | Resto ], R ).
