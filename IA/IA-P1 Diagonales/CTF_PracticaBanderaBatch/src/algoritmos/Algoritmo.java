package algoritmos;

import java.util.List;

import mente.Tablero;
import mente.auxiliar.Accion;
import mente.auxiliar.Nodo;

public interface Algoritmo {

	public List<Accion> encontrarCamino(Nodo inicio, Nodo fin, Tablero t);
	
}
