descomprime([], []).
descomprime([(Cab,1)|Resto], [Cab|R]):-
	descomprime(Resto,R).

descomprime([(Cab,N)|Resto], [Cab|R]):-
	N>1,
	N2 is N-1,
	descomprime([(Cab,N2)|Resto],R).

