%traspuesta(MatrizA, Mt).

traspuesta([],[]).
traspuesta([Cab | Resto], Resultante):-
	traspuesta(Resto, R),
	fila_a_columna(Cab, CabR),
	unir(CabR, R, Resultante).

fila_a_columna([],[]).
fila_a_columna([Cab | Resto], [[Cab]| R]):-
	fila_a_columna(Resto,R).


unir(A,[],A).
unir([CabA | RestoA], [CabB | RestoB], [CabR | R]):-
	unir(RestoA, RestoB, R),
	append(CabA, CabB, CabR).




%producto(MatrizA, MatrizB, Mr)

%producto([],[],[]).
%producto([CabA | RestoA], B, ):-
%	traspuesta(B, [CabB | RestoB]),
%+	producto()



producto_vector([],[],0).
producto_vector([CabA | RestoA], [CabB | RestoB], RR):-
	producto_vector(RestoA,RestoB, R),
	RR is CabA * CabB + R.