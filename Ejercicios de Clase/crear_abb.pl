% crear_abb.pl
% crear_abb( +Lista -Abb)
	% Es cierto cuando Abb unifica con
	% el arbol binaro de busqueda que
	% contiene las etiquetas de Lista.

crear_abb([],nil).

crear_abb( [Cab | Resto], ArbolR ):-

	crear_abb(Resto, Arbol),
	insertar_abb(Cab, Arbol, ArbolR).

insertar_abb( Cab, nil, a(Cab, nil, nil) ).

insertar_abb(Cab, a(Etiq, Izq, Dch), a(Etiq, ArbolR, Dch)):-
	Cab<Etiq,
	insertar_abb(Cab, Izq, ArbolR).

insertar_abb(Cab, a(Etiq, Izq, Dch), a(Etiq, Izq, ArbolR)):-
	Cab>Etiq,
	insertar_abb(Cab, Dch, ArbolR).