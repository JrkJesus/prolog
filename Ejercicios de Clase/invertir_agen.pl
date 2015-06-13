% invertir_agen.pl

invertir_agen([], []).
invertir_agen(a(Etiq, ListaA), a(Etiq, ListaR)):-
	invertir_agen(ListaA, ListaR).

invertir_agen([ Cab | Resto], ListaR):-
	invertir_agen(Cab, CabR),
	invertir_agen(Resto, RestoR),
	append(RestoR, [CabR], ListaR).

arbolGen21(a(1, [
		            a(2,[
		             	a(1,[]),
		             	a(2,[])
		             	]),

	             	a(3,[]),

	              	a(2,[
		             	a(2,[]),
		             	a(1,[])
		             	])
	            ]
			
			)).

arbolGen22(a(1, [
		            a(2,[
		             	a(1,[]),
		             	a(2,[])
		             	]),

	             	a(3,[])
	            ]
			
			)).

simetrico(Arbol):-
	invertir_agen(Arbol, Arbol).