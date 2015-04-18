package mente.auxiliar;

import mente.Cerebro;
import mente.auxiliar.*;

public class Nodo {

	private int X,Y;
	private int Accion;
	private int Coste;
	private double Heuristica;
	
	private Nodo Padre; 
	


	public Nodo(int _y, int _x) {
		X         = _x;
		Y         = _y;
		Accion    = Constantes.NULA;
		Coste     = 0;
		Heuristica = 0;
		Padre     = null;
	}

	public Nodo(int _y, int _x, int _accion, Nodo _padre) {
		X         = _x;
		Y         = _y;
		Accion    = _accion;
		Coste     = 0;
		Heuristica = 0;
		Padre     = _padre;
	}
	
	public Nodo(int _y, int _x, int _accion, Nodo _padre, int _coste) {
		X         = _x;
		Y         = _y;
		Accion    = _accion;
		Coste     = _coste;
		Heuristica = 0;
		Padre     = _padre;
	}
	
	
	

	public void setXY(int _x, int _y) {
		X = _x;
		Y = _y;
	}
		

	public Nodo getPadre() {
		return Padre;
	}
	public void setPadre(Nodo _padre) {
		Padre = _padre;
	}
	
	
	public int getCoste() {
		return Coste;
	}
	public void setCoste(int _coste) {
		Coste = _coste;
	}
	public void addCoste(int _coste) {
		Coste += _coste;
	}

	
	public int getX() {
		return X;
	}
	public int getY() {
		return Y;
	}
	
	@Override
	public boolean equals(Object obj) {
		Nodo n = (Nodo)obj;
		return ((this.X == n.X) && (this.Y == n.Y));
	}
	public String toString(){
		if (Heuristica==0)
			return "(" + X + " , " + Y + " , " + Accion +  " , " + Coste + ")";
		else
			return "(" + X + " , " + Y + " , " + Accion +  " , " + Coste + " , " + Heuristica + ")";
	}


	public void setHeuristica(double h) {
		this.Heuristica = h;
	}
	
	public double getF() {
		return Coste + Heuristica;
	}
	
	public Accion getAccion() {
		return new Accion(this.Accion);
	}
	
	public Nodo clone() {
		Nodo copia = new Nodo(getY(),getX());
		copia.setPadre(getPadre());
		copia.setCoste(getCoste());
		copia.Heuristica = 0;
		return copia;
	}
	/**MARR
	 * @param mov: movimiento en ctes  
	 * @return  un nuevo nodo en la nueva posici—n. Puede ser un muro.
	 */
	public Nodo mover(Accion mov) {
		Nodo copia = new Nodo(getY(),getX());
		copia.setPadre(getPadre());
		copia.setCoste(getCoste());
		copia.Heuristica = 0;
		
		switch (mov.getAccion()) {
		
			case Constantes.ARRIBA:
				copia.Y--;
			     break;
			case Constantes.ABAJO:
				copia.Y++;
			     break;
			case Constantes.DERECHA:
				copia.X++;
			     break;
			case Constantes.IZQUIERDA:
				copia.X--;
				break;
		} 
	return copia;
	}
	
	
}
