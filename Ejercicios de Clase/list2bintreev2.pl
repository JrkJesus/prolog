	% list2bintree(+Lista, ArbolBin)
	% Es cierto cuando ArbolBin unifica con todos los
	% elementos de Lista

list2bintreev2([],nil).
list2bintreev2( [ Cab | Resto ], a(Cab, Rizq, Rdch) ):-
	length(Resto, N),
	N2 is N // 2,
	length(Izq, N2),
	append(Izq,Dch,Resto),
	list2bintreev2( Izq, Rizq ),
	list2bintreev2( Dch, Rdch ).