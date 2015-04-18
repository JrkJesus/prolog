% divisores(+N,-Lista)
	% Es verdad cuando Lista unifica con
	% los divisores de N
	
	% Para ello necesitaremos sobrecargar el enunciado a:
	% divisores(+N,+i,-Lista)
		% Es cierto cuando Lista unifica 
		% con los numeros desde 1 hasta i 
		% que dividen N.
	% el modulo es "C is N mod M"

% primo(+N)
	% Devuelve true si N es primo.


% primo_entre_si(+X,+Y,-Lista)
	% Lista unifica con todos los numeros primos en 
	% el intervalo [X, Y].
	% \+ es para negar



% --------------------------------------------------------------------
% --------------------------------------------------------------------
% --------------------------------------------------------------------
% --------------------------------------------------------------------



divisores(N,Lista):-
	divisores(N,N,Lista).

divisores(_,1,[1]).
divisores(N,Cont,[Cont | R]):-
	Cont>1,
	0 is N mod Cont,
	Cont2 is Cont-1,
	divisores(N,Cont2,R).
	
divisores(N,Cont,R):-
	Cont>1,
	C is N mod Cont,
		% Importante donde se pone la condicion de arriba.
	C \= 0,
	Cont2 is Cont-1,
	divisores(N,Cont2,R).
	



primo(N):- divisores(N,[_,_]).
	% yo esto no lo veo necesario.
	% Lo hace por elegencia.






primos_entre_si(X,Y,[]):- X>Y.
primos_entre_si(X,Y,[X|R]):-
	X=<Y,
	X2 is X+1,
	primo(X),
		% Importante donde se pone la condicion de arriba.
	primos_entre_si(X2,Y,R).
primos_entre_si(X,Y,R):-
	X=<Y,
	X2 is X+1,
	\+primo(X),
	primos_entre_si(X2,Y,R).
