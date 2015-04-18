package algoritmos;

import java.util.LinkedList;
import java.util.List;

import alumno.Pensar;

import mente.Cerebro;
import mente.Tablero;
import mente.auxiliar.Accion;
import mente.auxiliar.Constantes;
import mente.auxiliar.ListaOrdenada2;
import mente.auxiliar.Nodo;

public class Greedy implements Algoritmo
{

	public List<Accion> encontrarCamino(Nodo inicio, Nodo fin, Tablero t) {
		
		
		List<Accion> devolver = new LinkedList<Accion>();
		
		ListaOrdenada2 abiertos = new ListaOrdenada2();
		LinkedList<Nodo> cerrados = new LinkedList<Nodo>();
				
		Nodo actual = inicio;
		abiertos.insertar(actual);
		while (!abiertos.isEmpty() && !actual.equals(fin))
		{			
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
				
		Nodo sucesor1 = new Nodo(actual.getY()-1, actual.getX(),Constantes.ARRIBA, actual);		
		
		if(t.casillaValida(sucesor1))
		{
			sucesor1.setHeuristica( Math.abs(fin.getX()-sucesor1.getX()) + Math.abs(fin.getY()-sucesor1.getY()) );
			Resultado.add(sucesor1);
		}
		
		Nodo sucesor2 = new Nodo(actual.getY()+1, actual.getX(),Constantes.ABAJO, actual);
		
		if(t.casillaValida(sucesor2))
		{
			sucesor2.setHeuristica( Math.abs(fin.getX()-sucesor2.getX()) + Math.abs(fin.getY()-sucesor2.getY()) );
			Resultado.add(sucesor2);
		}
		Nodo sucesor3 = new Nodo(actual.getY(), actual.getX()-1,Constantes.IZQUIERDA, actual);
		
		if(t.casillaValida(sucesor3))
		{
			sucesor3.setHeuristica( Math.abs(fin.getX()-sucesor3.getX()) + Math.abs(fin.getY()-sucesor3.getY()) );
			Resultado.add(sucesor3);
		}
		Nodo sucesor4 = new Nodo(actual.getY(), actual.getX()+1,Constantes.DERECHA, actual);
		
		if(t.casillaValida(sucesor4))
		{
			sucesor4.setHeuristica( Math.abs(fin.getX()-sucesor4.getX()) + Math.abs(fin.getY()-sucesor4.getY()) );
			Resultado.add(sucesor4);		
		}
		return Resultado;
	}

	private void repetidos(LinkedList<Nodo> Sucesores, ListaOrdenada2 abiertos, LinkedList<Nodo> cerrados) {
		
		for(Nodo ns: Sucesores)
		{
			if(abiertos.contains(ns))
			{
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

