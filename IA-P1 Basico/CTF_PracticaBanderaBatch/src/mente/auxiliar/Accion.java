package mente.auxiliar;

public class Accion {

	private int accion;
	
	public Accion() {
		accion = 0;
	}
	
	public Accion(int _acc) {
		accion = _acc;
	}
	
	
	public int getAccion() {
		return accion;
	}
	
	public String toString() {
		switch (accion) {
		case Constantes.NULA:
			return "NULA";
		case Constantes.DERECHA:
			return "DERECHA";
		case Constantes.IZQUIERDA:
			return "IZQUIERDA";
		case Constantes.ABAJO:
			return "ABAJO";
		case Constantes.ARRIBA:
			return "ARRIBA";
		case Constantes.NE:
			return "NE";
		case Constantes.NW:
			return "NW";
		case Constantes.SE:
			return "SE";
		case Constantes.SW:
			return "SW";
		default:
			return "DESCONOCIDA";
		}

	}
}
