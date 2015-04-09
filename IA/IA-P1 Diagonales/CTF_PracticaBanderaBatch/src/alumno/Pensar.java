package alumno;

import java.util.*;

import algoritmos.AEstrella;
import algoritmos.Anchura;
import algoritmos.Algoritmo;
import algoritmos.Greedy;
import algoritmos.Profundidad;

import mente.Cerebro;
import mente.auxiliar.Accion;
import mente.auxiliar.Constantes;
import mente.auxiliar.Nodo;


public class Pensar {

	
	static  List<Accion> Movimientos = new LinkedList<Accion>();
	static  Nodo Objetivo = null;
	static long tiempo;	
	static int nMovimientos=0;
	public static int NodoVisitados = 0;
	public static int MaxAbierto = 0;
	public static int MaxCerrado = 0;
	static String TipoAlgoritmo = "";
	static long timeStart=0; 
	static long timeEnd=0;
	
	public static int pensar() {
		Algoritmo a;
		if(Movimientos.isEmpty()){   
		   switch (Cerebro.getAlgoritmo()){
		   		case 1: 
		   			a = new Anchura();
		   			TipoAlgoritmo = a.getClass().getSimpleName(); // ???
		   			timeStart=System.currentTimeMillis(); //captura tiempo inicio  // ???
		   			if(!Cerebro.TengoBandera){
		   				//llama al algoritmo y guarda el camino en movimientos
		   				Movimientos = a.encontrarCamino(Cerebro.getPosJ(), Cerebro.getTablero().getBanderaC(), Cerebro.getTablero());		   				
		   				nMovimientos=Movimientos.size(); //captura el tamaño de los movimientos		   						   						   				
		   			}
		   			else{
		   			//En el array movimientos se ha de añadir los nuevos datos de la segunda ronda?
		   				Movimientos.addAll(a.encontrarCamino(Cerebro.getTablero().getBanderaC(), Cerebro.getTablero().getBanderaM(), Cerebro.getTablero()));
		   				nMovimientos+=Movimientos.size(); //captura y suma el tamaño de los movimientos
		   			}
		   			timeEnd = System.currentTimeMillis();//captura tiempo fin
		   			tiempo = timeEnd-timeStart; //guarda en la variable statica tiempo la diferencia de fin-inicio
		   			break;
		   		case 2:
		   			a = new Profundidad();
		   			TipoAlgoritmo = a.getClass().getSimpleName();
		   			timeStart=System.currentTimeMillis();
		   			if(!Cerebro.TengoBandera){
		   				Movimientos = a.encontrarCamino(Cerebro.getPosJ(), Cerebro.getTablero().getBanderaC(), Cerebro.getTablero());
		   				nMovimientos=Movimientos.size();
		   				}
		   			else{
		   				Movimientos.addAll(a.encontrarCamino(Cerebro.getTablero().getBanderaC(), Cerebro.getTablero().getBanderaM(), Cerebro.getTablero()));
		   				nMovimientos+=Movimientos.size();
		   				}
		   			timeEnd = System.currentTimeMillis();
		   			tiempo = timeEnd-timeStart;
		   			break;
		   		case 3:
		   			a = new AEstrella();
		   			TipoAlgoritmo = a.getClass().getSimpleName();
		   			timeStart=System.currentTimeMillis();
		   			if(!Cerebro.TengoBandera){
		   				Movimientos = a.encontrarCamino(Cerebro.getPosJ(), Cerebro.getTablero().getBanderaC(), Cerebro.getTablero());
		   				nMovimientos=Movimientos.size();
		   				}
		   			else{
		   				Movimientos.addAll(a.encontrarCamino(Cerebro.getTablero().getBanderaC(), Cerebro.getTablero().getBanderaM(), Cerebro.getTablero()));
		   				nMovimientos+=Movimientos.size();
	   					}
		   				timeEnd = System.currentTimeMillis();
		   				tiempo = timeEnd-timeStart;
		   				break;
		   		case 4:
		   			a = new Greedy();
		   			TipoAlgoritmo = a.getClass().getSimpleName();
		   			timeStart=System.currentTimeMillis();
		   			if(!Cerebro.TengoBandera){
		   				Movimientos = a.encontrarCamino(Cerebro.getPosJ(), Cerebro.getTablero().getBanderaC(), Cerebro.getTablero());
		   				nMovimientos=Movimientos.size();
		   				}
		   			else{
		   				Movimientos.addAll(a.encontrarCamino(Cerebro.getTablero().getBanderaC(), Cerebro.getTablero().getBanderaM(), Cerebro.getTablero()));
		   				nMovimientos+=Movimientos.size();
   						}
		   				timeEnd = System.currentTimeMillis();
		   				tiempo = timeEnd-timeStart;
			   			break;
		   }
		}
		    if(Cerebro.TengoBandera && Movimientos.size()==1)
		    {
		    	if(Cerebro.getDepuracion() == 0 )
		    		System.out.println("Algoritmo: "+TipoAlgoritmo+"" +	"\nTiempo empleado:"+ tiempo + 	"\nMovimientos:"+ nMovimientos + "\nNodo Visitados:" + NodoVisitados + 	"\nMaxAbiertos:"+ MaxAbierto+ "\nMaxCerrados:"+MaxCerrado);
		    	else if (Cerebro.getDepuracion() == 1)
		    		System.out.println("Algoritmo: "+TipoAlgoritmo+"" +	"\nTiempo empleado:"+ tiempo + 	"\nMovimientos:"+ nMovimientos + "\nNodo Visitados:" + NodoVisitados + 	"\nMaxAbiertos:"+ MaxAbierto+ "\nMaxCerrados:"+MaxCerrado);
		    	else
		    		System.out.println("Algoritmo: "+TipoAlgoritmo+"" +	"\nTiempo empleado:"+ tiempo + 	"\nMovimientos:"+ nMovimientos + "\nNodo Visitados:" + NodoVisitados + 	"\nMaxAbiertos:"+ MaxAbierto+ "\nMaxCerrados:"+MaxCerrado);
		    		
		    }
		    
		  
			return Movimientos.remove(0).getAccion();
	}
	


	
}
