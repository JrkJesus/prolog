package algoritmos;


import java.util.LinkedList;
import java.util.List;

import alumno.Pensar;

import mente.Cerebro;
//import mente.Cerebro;
import mente.Tablero;
import mente.auxiliar.Accion;
import mente.auxiliar.Constantes;
//import mente.auxiliar.ListaOrdenada2;
import mente.auxiliar.Nodo;


public class Profundidad implements Algoritmo {
	
	public List<Accion> encontrarCamino(Nodo inicio, Nodo fin, Tablero t) {
		
		List<Accion> devolver = new LinkedList<Accion>();
		
		LinkedList<Nodo> abiertos = new LinkedList<Nodo>();
		LinkedList<Nodo> cerrados = new LinkedList<Nodo>();
				
		Nodo actual = inicio;
		abiertos.add(actual);
		while (!abiertos.isEmpty() && !actual.equals(fin))
		{					
			if(actual.getCoste()<1000)
			{
				//ESTE SERIA EL METODO DE BUSQUEDA EN PROFUNDIDAD
				actual=abiertos.removeLast(); //lo quita y pasa el puntero a actual
				if(Cerebro.getDepuracion() == 0 )
					System.out.println(actual.getX()+","+actual.getY());
				cerrados.add(actual);
				if(cerrados.size()>Pensar.MaxCerrado)
					Pensar.MaxCerrado = cerrados.size();
				LinkedList<Nodo> Temporal = CalculaLosSucesoresdeActual(actual, t); //calcular sucesores
				repetidos(Temporal, abiertos, cerrados); // quitamos repetidos y metermos en abiertos
			}
		}
			
		if(actual.equals(fin))
		{
			return devolver = encuentraCamino(actual);
		}
		return devolver;
		
	}
	
	public LinkedList<Nodo> CalculaLosSucesoresdeActual(Nodo actual, Tablero t)
	{
		LinkedList<Nodo>Resultado = new LinkedList<Nodo>();
		int coste = actual.getCoste();
				
		Nodo sucesor1 = new Nodo(actual.getY()-1, actual.getX(),Constantes.ARRIBA, actual, coste+1);
		if(t.casillaValida(sucesor1))
		{
			Resultado.add(sucesor1);
		}
		
		Nodo sucesor2 = new Nodo(actual.getY()+1, actual.getX(),Constantes.ABAJO, actual, coste+1);
		if(t.casillaValida(sucesor2))
		{
			Resultado.add(sucesor2);
		}
		Nodo sucesor3 = new Nodo(actual.getY(), actual.getX()-1,Constantes.IZQUIERDA, actual, coste+1);
		if(t.casillaValida(sucesor3))
		{
			Resultado.add(sucesor3);
		}
		Nodo sucesor4 = new Nodo(actual.getY(), actual.getX()+1,Constantes.DERECHA, actual, coste+1);
		if(t.casillaValida(sucesor4))
		{
			Resultado.add(sucesor4);		
		}
		return Resultado;
	}

	private void repetidos(LinkedList<Nodo> Sucesores, LinkedList<Nodo> abiertos, LinkedList<Nodo> cerrados) 
	{
		for (Nodo nodo : Sucesores) 
		{		
			if((!abiertos.contains(nodo)) && (!cerrados.contains(nodo))){			
				abiertos.add(nodo);
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
