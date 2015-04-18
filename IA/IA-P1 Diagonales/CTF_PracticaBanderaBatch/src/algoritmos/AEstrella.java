package algoritmos;
import java.util.LinkedList;
import java.util.List;

import alumno.Pensar;
import mente.Cerebro;
import mente.Tablero;
import mente.auxiliar.Accion;
import mente.auxiliar.Constantes;
import mente.auxiliar.Nodo;
import mente.auxiliar.ListaOrdenada2;

public class AEstrella implements Algoritmo {

	
	public List<Accion> encontrarCamino(Nodo inicio, Nodo fin, Tablero t) {
		
	
		List<Accion> devolver = new LinkedList<Accion>();
		
		ListaOrdenada2 abiertos = new ListaOrdenada2();
		LinkedList<Nodo> cerrados = new LinkedList<Nodo>();
				
		Nodo actual = inicio;
		abiertos.insertar(actual);
		while (!abiertos.isEmpty() && !actual.equals(fin))
		{
			
			//ESTE SERIA EL METODO DE BUSQUEDA EN ANCHURA REUTILIZADO PARA ESTRELLA	
			actual=abiertos.remove(0); 
			if(Cerebro.getDepuracion() == 0 )
				System.out.println(actual.getX()+","+actual.getY());
			cerrados.add(actual);
			if(cerrados.size()>Pensar.MaxCerrado)
				Pensar.MaxCerrado = cerrados.size();
			LinkedList<Nodo> Temporal = CalculaLosSucesoresdeActual(actual, t, fin); 
			
			repetidos(Temporal, abiertos, cerrados); // quitamos repetidos y metermos en abiertos			
		}
			
		
		if(actual.equals(fin))
		{
			return devolver = encuentraCamino(actual);
		}				

		return devolver;		
	}
	
	public LinkedList<Nodo> CalculaLosSucesoresdeActual(Nodo actual, Tablero t, Nodo fin)
	{
		LinkedList<Nodo>Resultado = new LinkedList<Nodo>();
		int coste = actual.getCoste();
				
		Nodo sucesor1 = new Nodo(actual.getY()-1, actual.getX(),Constantes.ARRIBA, actual, coste+1);				
		if(t.casillaValida(sucesor1))
		{
			sucesor1.setHeuristica( Math.abs(fin.getX()-sucesor1.getX()) + Math.abs(fin.getY()-sucesor1.getY()) );
			Resultado.add(sucesor1);
		}
		/*
		Nodo sucesor2 = new Nodo(actual.getY()+1, actual.getX(),Constantes.ABAJO, actual, coste+1);		
		if(t.casillaValida(sucesor2))
		{
			sucesor2.setHeuristica( Math.abs(fin.getX()-sucesor2.getX()) + Math.abs(fin.getY()-sucesor2.getY()) );
			Resultado.add(sucesor2);
		}*/
		
		Nodo sucesor3 = new Nodo(actual.getY(), actual.getX()-1,Constantes.IZQUIERDA, actual, coste+1);		
		if(t.casillaValida(sucesor3))
		{
			sucesor3.setHeuristica( Math.abs(fin.getX()-sucesor3.getX()) + Math.abs(fin.getY()-sucesor3.getY()) );
			Resultado.add(sucesor3);
		}
		Nodo sucesor4 = new Nodo(actual.getY(), actual.getX()+1,Constantes.DERECHA, actual, coste+1);		
		if(t.casillaValida(sucesor4))
		{
			sucesor4.setHeuristica( Math.abs(fin.getX()-sucesor4.getX()) + Math.abs(fin.getY()-sucesor4.getY()) );
			Resultado.add(sucesor4);		
		}
		
		Nodo sucesor5 = new Nodo(actual.getY()-1, actual.getX()-1, Constantes.NW, actual, coste+1);
		if(t.casillaValida(sucesor5))
		{
			sucesor5.setHeuristica( Math.abs(fin.getX()-sucesor5.getX()) + Math.abs(fin.getY()-sucesor5.getY()) );
			Resultado.add(sucesor5);
		}
		
		Nodo sucesor6 = new Nodo(actual.getY()-1, actual.getX()+1, Constantes.NE, actual, coste+1);
		if(t.casillaValida(sucesor6))
		{
			sucesor6.setHeuristica( Math.abs(fin.getX()-sucesor6.getX()) + Math.abs(fin.getY()-sucesor6.getY()) );
			Resultado.add(sucesor6);
		}
		
		return Resultado;
	}

	private void repetidos(LinkedList<Nodo> Sucesores, ListaOrdenada2 abiertos, LinkedList<Nodo> cerrados) {
		
		for(Nodo ns: Sucesores)
		{
			if(abiertos.contains(ns))
			{
				//Contiene ns en la lista abiertos
				//Ahora tenemos que comprobar que si por este camino el coste es menor que el que tenia antes
				for(Nodo na : abiertos)
				{
					if(ns.equals(na))
						if(ns.getF() < na.getF()){
							abiertos.remove(na);
							abiertos.insertar(ns);
							break;
							}
				}
			}
			else if(cerrados.contains(ns))
			{
				//Contiene ns en la lista de cerrados y lo mismo que con los abiertos con los costes
				for(Nodo nc: cerrados)
				{
					if(ns.equals(nc))
						if(ns.getF() < nc.getF()){
							cerrados.remove(nc);
							cerrados.add(ns);
						}
				}
			}
			else
			{
				//añado en la lista de abiertos este nuevo nodo
				abiertos.insertar(ns);
				Pensar.NodoVisitados++;
				if(abiertos.size()>Pensar.MaxAbierto)				
					Pensar.MaxAbierto = abiertos.size();
			}
		}
	}
	
	public LinkedList<Accion> encuentraCamino(Nodo actual)
	{
		LinkedList<Accion> devolver = new LinkedList<Accion>();
		
		while (actual!= null)
		{
			devolver.add(0, actual.getAccion());			
			Nodo anterior = actual.getPadre();
			actual = anterior;
		}
		return devolver;
	}				
}
