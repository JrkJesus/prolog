% esMiembroGen.pl

% esMiembroGen(+Elem, +ArGen)
	% Es cierto cuando Elem esta en 
	% ArGen.

esMiembroGen(Elem, a(Etiq, Lhijos)):-
	Elem \= Etiq,
	esMiembroGen(Elem, Lhijos).

esMiembroGen(Elem, a(Elem, _)).

esMiembroGen(Elem, [_ | Resto]):-
	esMiembroGen(Elem, Resto).

esMiembroGen(Elem, [Cab | _]):-
	esMiembroGen(Elem, Cab).

arbolGen31(a(1, [
	            a(2,[
	             	a(4,[]),
	             	a(5,[])
	             	]),

              	a(3,[
	             	a(6,[]),
	             	a(7,[])
	             	])
            ]
		
		)).

% 				1 
%		2	    		3
%	  4   5			  6    7	
% -----------------------------------