% Matrices2daImplementacion.pl
matriz1([1,2,3,4,5,6], 3, 2).
matriz2([1,2,3,4,5,6], 2, 3).

traspuesta( _ , _ , 0	, []).	
traspuesta(Matriz, NF, NC, R):-
	NC > 0,
	NC2 is NC - 1,
	extraer_column_1(Matriz, NC, Column, Resto),
	traspuesta(Resto, NF, NC2, RestoT),
	append(Column, RestoT, R).
	

%extraer_column_1(+Matriz, +NColum, -Colum, -Resto)
	% es cierto cuando Colum unifica la primera Columna
	% de Matriz y Resto con las columnas sobrantes.
extraer_column_1([Cab | Cola], NC, [Cab |Column], Resto):-
	NC > 0,
	NC2 is NC - 1,
	length(Temp, NC2),
	append(Temp, Siguiente, Cola),
	extraer_column_1(Siguiente, NC, Column, Rsig),
	append(Temp, Rsig, Resto).

extraer_column_1([], _ , [], []).
	% Esta este caso base, porque al ser una matriz, se controla que 
	% la columna siempre va a tener NC elementos.


% producto(+Matriz1, +NF1, +NC1, +Matriz2, +NF2, +NC2, -Matrizr)

producto(M1, N, NC1, M2, NF2, N, MR):-
	traspuesta(M2, NF2, N, Mt2),
	prod_M_M(M1, NC1, Mt2, NF2, MR).

prod_M_M(M1, Nc1, Mt2, Nc2, [Vprod | Mprod]):-
	length(Col, Nc1),
	append(Col, Resto, M1),
	prod_V_M(Col, Mt2, Nc2, Vprod),
	prod_M_M(Resto, Nc1, Mt2, Nc2, Mprod).
prod_M_M([], _, _ , _, []).

prod_V_M(Vector, Mt, Nc, [Nprod | Vprod]):-
	length(Col, Nc),
	append(Col, Resto, Mt),
	prod_V_V(Vector, Col, Nprod),
	prod_V_M(Vector, Resto, Nc, Vprod).
prod_V_M( _ , [], _ , []).

prod_V_V([Cab | Resto], [Cab2 | Resto2], Nprod):-
	prod_V_V(Resto, Resto2, Rprod),
	Nprod is (Cab * Cab2) + Rprod.
prod_V_V([], [], 0).


% suma(MatrizA, NfA, NcA, MatrizB, NfB, NcB, MatrizSuma)
suma(M1, Nf, Nc, M2, Nf, Nc, MR):-
	sum_M_M(M1, M2, Nc, MR).

sum_M_M(M1, M2, Nc, [Vsum | Msum]):-
	length(Temp1, Nc),
	length(Temp2, Nc),
	append(Temp1, Resto1, M1),
	append(Temp2, Resto2, M2),
	sum_V_V(Temp1, Temp2, Vsum),
	sum_M_M(Resto1, Resto2, Nc, Msum),
sum_M_M([], [], _ , []).

sum_V_V([Cab1 | Resto1], [Cab2 | Resto2], [Csum | Rsum]):-
	Csum is Cab1 + Cab2,
	sum_V_V(Resto1, Resto2, Rsum).
sum_V_V([], [], []).



% resta(MatrizA, NfA, NcA, MatrizB, NfB, NcB, MatrizResta)
resta(M1, Nf, Nc, M2, Nf, Nc, MR):-
	res_M_M(M1, M2, Nc, MR).


res_M_M(M1, M2, Nc, [Vres | Mres]):-
	length(Temp1, Nc),
	length(Temp2, Nc),
	append(Temp1, Resto1, M1),
	append(Temp2, Resto2, M2),
	res_V_V(Temp1, Temp2, Vres),
	res_M_M(Resto1, Resto2, Nc, Mres),
res_M_M([], [], _ , []).

res_V_V([Cab1 | Resto1], [Cab2 | Resto2], [Cres | Rres]):-
	Cres is Cab1 + Cab2,
	res_V_V(Resto1, Resto2, Rres).
res_V_V([], [], []).


