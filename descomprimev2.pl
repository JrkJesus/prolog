descomprimev2([], []).

descomprimev2([Cab|Resto], [Cab|R]):-
        atom(Cab),
	descomprimev2(Resto,R).
% atom te dice si es una estructura compleja (V cuando no lo es).

descomprimev2([(Cab,2)|Resto], [Cab, Cab|R]):-
	descomprimev2(Resto,R).

descomprimev2([(Cab,N)|Resto], [Cab|R]):-
	N>2,
	N2 is N-1,
	descomprimev2([(Cab,N2)|Resto],R).

