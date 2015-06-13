% Ejercicio 2

% Apartado A)
% creaLista(+Ele1, +Ele2, -Lista)
	% Esto es cierto cuando Lista unifica con unifica
	% lista que contiene ELe1 y Ele2
creaLista(Ele1, Ele2, [Ele1, Ele2]).



% Apartado B.1)
%insertaPrincipio(+Ele, +Lista, -ListaR)
	% Es cierto cuando Lista R unifica con una lista
	% que contiene todos los elementos de Lista mas Ele
	% en la primera posición.
insertaPrincipio(Ele, Lista, [Ele | Lista]).

%Apartado B.2)
%insertaFinal(+Ele, +Lista, -ListaR).
	% Es cierto cuando Lista R unifica con una lista
	% que contiene todos los elementos de Lista mas Ele
	% en la ultima posición.
insertaFinal(Ele, Lista, ListaR):-
	append(Lista, [Ele], ListaR).
insertaFinal2(Ele, [], [Ele]).
insertaFinal2(Ele, [ Cab | Resto ], [ Cab | ListaR ]):-
	insertaFinal2(Ele, Resto, ListaR).

% Apartado B.3)
%insertaPos(+Ele, +Pos, +Lista, -ListaR).
	% Es cierto cuando Lista R unifica con una lista
	% que contiene todos los elementos de Lista mas Ele
	% en la posición Pos.
insertaPos(Ele, N, [Cab | Resto], [Cab | R]):-
	N>1,
	N2 is N - 1, 
	insertaPos(Ele, N2, Resto, R).
insertaPos(Ele, 1, Lista, [Ele | Lista]):-
	Lista \= [].
insertaPos(Ele, _ , [], [Ele]).



% Apartado C)
% concatenar(+Lista1, +Lista2, -ListaR).
	% Es cierto cuando ListaR unifica con una
	% lista que contiene todos los elementos de
	% Lista1 y Lista2.
concatenar([], Lista2, Lista2).
concatenar([Cab | Resto], Lista2, [Cab |R]):-
	concatenar(Resto, Lista2, R).



% Apartado D)
%invertir(+Lista, -ListaI).
	% Es cierto siempre que ListaI unifique con 
	% una lista que contiene los elementos de Lista
	% en el orden inverso.
invertir([], []).	
invertir([Cab | Resto], R):-
	invertir(Resto, ListaR),
	insertaFinal(Cab, ListaR, R).



% Apartado E.1)
% elimina(+Ele, +Lista, -ListaR)
	% Es cierto cuando ListaR unifica con 
	% Lista menos la primera aparicion de 
	% Ele.
elimina(Ele, [Cab | Resto], [Cab | R]):-
	Ele \= Cab,
	elimina(Ele, Resto, R).
elimina(Ele, [Ele | Resto], Resto).

% Apartado E.2)
% eliminaTodos(+Ele, +Lista, -ListaR)
	% Es cierto cuando ListaR unifica con 
	% Lista menos  todas las apariciones de 
	% Ele.
eliminaTodos(Ele, [Cab | Resto], [Cab | R]):-
	Ele \= Cab,
	eliminaTodos(Ele, Resto, R).
eliminaTodos(Ele, [Ele | Resto], R):-
	eliminaTodos(Ele, Resto, R).
eliminaTodos(_, [], []).


