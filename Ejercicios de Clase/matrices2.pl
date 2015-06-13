%matrices2.pl

traspuesta2( _ , _ , 0	, []).	
traspuesta2(Matriz, Fila, Columna, R):-
	extraer_column_1(Columna, Matriz, LCab, Resto),
	Columna > 0,
	Col is Columna - 1,
	traspuesta2(Resto, Fila, Col, Rtemp),
	append(LCab, Rtemp, R).
	

%extraer_column_1(+Dist, +Matriz, -Lista, -Resto)
	% es cierto cuando Lista unifica con los elementos de 
	% matriz que estas a una distancia Dist y Resto unifica
	% con los elementos sobrantes.

extraer_column_1( N , L, [], L):- length(L, Long), Long < N. 
	%Este caso base esta puesto asi porque desde traspuesta,
	% yo voy a controlar que la longitud de la lista es multiplo
	% del valor Dist.
extraer_column_1(N, M, [Ele | LR], Sol):-
	N > 0,
	N2 is N-1,
	length(Ltemp, N2),
	append([Ele | Ltemp], Resto, M),
	extraer_column_1(N, Resto, LR, RestoR),
	append(Ltemp, RestoR, Sol).


matriz1([1,2,3,4,5,6,7,8,9],3,3).