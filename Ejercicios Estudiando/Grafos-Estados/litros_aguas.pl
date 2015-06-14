% litros_aguas.pl

estado(Litros5, Litros3).
inicial(estado(0,0)).
final(estado(4,_)).

mov(llenar5, estado(_, J3), estado(5, J3)).
mov(llenar3, estado(J5, _), estado(J5, 3)).
mov(vaciar5, estado(_, J3), estado(0, J3)).
mov(vaciar3, estado(J5, _), estado(J5, 0)).
mov(volcar3en5, estado(J5, J3), estado(Jt, 0)):-
	Jt is J3 + J5,
	Jt < 6.
mov(volcar3en5, estado(J5, J3), estado(5, Jr)):-
	Jt is J3 + J5,
	Jt > 5, 
	Jr is Jt - 5.
mov(volcar5en3, estado(J5, J3), estado(Jr, 3)):-
	Jt is J5 + J3,
	Jt > 3,
	Jr is Jt - 3.
mov(volcar5en3, estado(J5, J3), estado(0, Jt)):-
	Jt is J3 + J5,
	Jt < 4.

camino(Inicio, Inicio, _ , []).
camino(Inicio, Fin, Visitados, [Movimiento | R]):-
	mov(Movimiento, Inicio, Siguiente),
	\+ member(Siguiente, Visitados),
	camino(Siguiente, Fin, [Siguiente | Visitados], R)