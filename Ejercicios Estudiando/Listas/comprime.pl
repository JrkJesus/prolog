% comprime.pl

comprime([Cab | Resto], [(Cab, N2) | R]):-
	comprime(Resto, [(Cab, N) | R]),
	N2 is N + 1.
comprime([Cab | Resto], [(Cab, 1), (Ele, N) | R]):-
	comprime(Resto, [(Ele, N) | R]),
	Cab \= Ele.
comprime([], []).
comprime([E], [(E, 1)]).

