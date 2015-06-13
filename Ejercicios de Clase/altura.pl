% altura.pl
% altura(+ Arbol, -N)
	% Es cierto cuando N unifica con los niveles
	% de profundidad de Arbol

altura(nil, 0).
altura(a(_ , Izq, Dch),  Alt ):-
	altura(Izq, Nv1),
	altura(Dch, Nv2),
	Nv1>Nv2,
	Alt is Nv1 + 1.

altura(a(_ , Izq, Dch),  Alt ):-
	altura(Izq, Nv1),
	altura(Dch, Nv2),
	Nv1=<Nv2,
	Alt is Nv2 + 1.