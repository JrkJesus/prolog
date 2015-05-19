% Resta 		- DONE
% Producto 		- DONE
% Suma  		- DONE
% Traspuesta    - DONE
% Inversa
	% Determinante 
	% Adjunta
	% Traspuesta


%traspuesta(MatrizA, Mt).

matriz1([[1,2,3],	
		 [2,3,4],  
		 [3,4,5]]).
matriz2([[2,2,2],			
		 [1,1,1], 
		 [3,3,3]]).
matriz3([[1,1,1],
	     [2,2,2]]).


traspuesta([],[]).
traspuesta([Cab | Resto], Resultante):-
	traspuesta(Resto, R),
	traspuesta_vector(Cab, CabR),
	unir(CabR, R, Resultante).

traspuesta_vector([],[]).
traspuesta_vector([Cab | Resto], [[Cab]| R]):-
	traspuesta_vector(Resto,R).


unir(A,[],A).
unir([CabA | RestoA], [CabB | RestoB], [CabR | R]):-
	unir(RestoA, RestoB, R),
	append(CabA, CabB, CabR).




%producto(MatrizA, MatrizB, Mr)

producto([],_,[]).
producto([Cab | Resto], B, [N | R]):-
	producto(Resto, B, R),
	traspuesta(B, Br),
	producto_vectorMatriz(Cab, Br, N).

% [[1,2,3] 			[[2,2,2]
%  [2,3,4]    x      [1,1,1]
%  [3,4,5]]			 [3,3,3]]




producto_vectorMatriz(_,[],[]).
producto_vectorMatriz(A,[Cab | Resto], [CabR | R]):-
	producto_vectorMatriz(A, Resto, R),
	producto_vector(A,Cab, CabR).



producto_vector([],[],0).
producto_vector([CabA | RestoA], [CabB | RestoB], RR):-
	producto_vector(RestoA,RestoB, R),
	RR is CabA * CabB + R.

% [1,2,3] x [2,1,3]

suma([],[],[]).
suma([Cab1 | Resto1], [Cab2 | Resto2], [Cr | R]):-
	suma(Resto1, Resto2, R),
	suma_vector(Cab1, Cab2, Cr).

suma_vector([],[],[]).
suma_vector([Cab1 | Resto1], [Cab2 | Resto2], [Cr | R]):-
	suma_vector(Resto1, Resto2, R),
	Cr is Cab1 + Cab2.

resta([],[],[]).
resta([Cab1 | Resto1], [Cab2 | Resto2], [Cr | R]):-
	resta(Resto1, Resto2, R),
	resta_vector(Cab1, Cab2, Cr).

resta_vector([],[],[]).
resta_vector([Cab1 | Resto1], [Cab2 | Resto2], [Cr | R]):-
	resta_vector(Resto1, Resto2, R),
	Cr is Cab1 - Cab2.


%determinante([[Cab1]], Cab1).
determinante([[Cab1, Cab2], [Cab3, Cab4]], N):- N is Cab1 * Cab4 - Cab2 * Cab3.
%determinante([[Cab1, Cab2, Cab3], [Cab4, Cab5, Cab6], [Cab7, Cab8, Cab9]], N):- 
%	N is Cab1 * Cab5 * Cab9 + Cab4 * Cab8 * Cab3 + Cab2 * Cab6 * Cab7
%	 - Cab3 * Cab5 * Cab6 - Cab6 * Cab8 * Cab1 - Cab2 * Cab4 * Cab9.
determinante(Matriz, R):-
	determinante(Matriz, 0, R).

%determinante(M, N, ):-
%	adjunto(M, N, 1, Madj),
%	N2 is N+1,
%	determinante(Madj, N2, Rdet),
%	getNumberMatriz(N, 1, Ele).
%	R is 

getNumberMatriz([Cab | _], Pos1, Pos1, Cab).
getNumberMatriz(M, Pos1, Pos2, Ele):-
	getNumberMatriz(M, Pos1, 0, Fila),
	getNumberMatriz(Fila, Pos2, 0, Ele).

adjunto(Matriz, Pos1, Pos2, -R):-
	P is Pos1 + Pos2,
	1 is P mod 2,
	adjunto(Matriz, Pos1, Mr),
	traspuesta(Mr, MrT),
	adjunto(MrT, Pos2, R).

adjunto(Matriz, Pos1, Pos2, R):-
	P is Pos1 + Pos2,
	0 is P mod 2,
	adjunto(Matriz, Pos2, Mr),
	traspuesta(Mr, MrT),
	adjunto(MrT, Pos2, R).

adjunto(Matriz, Pos, R):-
	length(Cab, Pos),
	append(Cab, [Fila | Resto], Matriz),
	append(Cab, Resto, R).

% 1 2 3
% 4 5 6
% 7 8 9