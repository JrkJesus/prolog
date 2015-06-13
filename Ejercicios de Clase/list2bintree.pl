% list2bintree(+Lista, ArbolBin)
% list2bintree(+Lista, ArbolBin)
	% Es cierto cuando ArbolBin unifica con todos los
	% elementos de Lista

list2bintree([],nil).
list2bintree( [ Cab | Resto ], a(Cab, R, nil) ):-
	
	list2bintree( Resto, R ).