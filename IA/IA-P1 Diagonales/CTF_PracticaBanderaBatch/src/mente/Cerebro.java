package mente;

import mente.auxiliar.*;
import alumno.Pensar;
//import mente.auxiliar.Nodo;
//import jade.core.AID;//MARR

public class Cerebro {
//	public static AID servidor = new AID("entorno", AID.ISLOCALNAME); //MARR
	
	public static Nodo PosJ;      // Mi Posicion
	public static int EquipoXXX;         // Mi Equipo
	public static int Contrario;      // Equipo Contrario

	public static boolean TengoBandera = false;      // Equipo Contrario
	public static boolean TengoMiBandera = false;      // Equipo Contrario
	private static Tablero tablero;
	private static boolean Traza = true;
	private static int depuracion=1;
	private static int algoritmo=1;
	public static int getAlgoritmo() {
		return algoritmo;
	}
	public static int getDepuracion() {
		return depuracion;
	}
	/**
	 * Pone a un nivel las depuraciones. Habitualmente se establece desde el lanzamiento
	 *  como un parametro. por defecto est� en el nivel de resultado : 1
	 * @param depuracion:-1 Ning�n comentario, 0 S�lo resultados finales, 1  standard , 2 Verbose
	 * 
	 */
	public static void setDepuracion(int depuracion) {
		Cerebro.depuracion = depuracion;
	}
	/**
	 * Envia a consola un string siempre que la depuraci�n establecido est� por debajo de n�mero
	 *  enviado en el parametro nivel
	 */
	public static void depura(String msg, int nivel){
		
		if (nivel < depuracion) System.out.println(msg);
	}
	/**
	 * Determina si estamos incluyendo en el mapa final una traza para que sea impresa a la salida 
	 * TODO: ahora por ahorrar en c�digo se usa el mapa directamente. ser�a conveniente s�lo pintarlo 
	 * pero no almacenarlo en el propio mapa
	 */
	public static boolean isTraza() {
		return Traza;
	}

	public static void setTraza(boolean traza) {
		Traza = traza;
	}
	/**
	 * Crea un Tablero a partir de un string de inicio separado con comas con el formato:
	 * "[ANCHO_MAPA],[ALTO_MAPA],[ANCHO_VENTANA],[ALTO_VENTANA],[POS_X],[POS_Y],[MAPA]"
	 * La ventana no se utiliza en esta versi�n , puede contener cualquier n�mero
	 */
	public static void crearTablero(String _inicio){
		tablero = new Tablero(_inicio);
	}
	
	public static Tablero getTablero(){
		return tablero;
	}
	
	



	/**
	 * @return Posici�n actual de Jugador como un nodo
	 */
	public static Nodo getPosJ() {
		return PosJ;
	}

	public static void setPosJ(Nodo posJ) {
		PosJ = posJ;
	}

	/**
	 * @return boolean si tiene la bandera enemiga en su poder (se ha pisado la casilla donde estaba)
	 */
	public static boolean isTengoBandera() {
		return TengoBandera;
	}

	public static void setTengoBandera(boolean tengoBandera) {
		TengoBandera = tengoBandera;
	}
	/**
	 * @param Acci�n de movimiento sobre la posici�n del tablero que ocupa el jugador siempre que sea una acci�n valida (casilla destino no muro).
	 * actualiza la posici�n de jugador, bandera propia y bandera enemiga
	 * @return boolean que indica si se ha podido  realizar la acci�n
	 */
	public static boolean mover(Accion a){
		Nodo nuevo =PosJ.mover(a);
		if (getTablero().casillaValida(nuevo)){ 
			if (isTraza()){
				if (getTablero().getBanderaC().equals(PosJ))   getTablero().setcontenido(PosJ.getX(),PosJ.getY(),'�');  
				else getTablero().setcontenido(PosJ.getX(),PosJ.getY(),'.');
				
			}
			setPosJ(nuevo);// actualizo posici�n jugador
			if (getTablero().getBanderaC().equals(nuevo)){
				TengoBandera = true;depura("Bandera Enemiga en tu poder!!!",2);
			}
				
			if (getTablero().getBanderaM().equals(nuevo) && TengoBandera){
				TengoMiBandera = true;
				depura("has terminado!!!",1);
			}
			return true;
		}
		else
			return false;
	}
	
	/**
	 * Bucle de partida que acaba cuando se tienen las dos banderas. Pide una a una las acciones a realizar y 
	 * con ella actualiza la posici�n de jugador, bandera propia y bandera enemiga
	 */
	public static void 	play(){
	  
	  while (!(TengoBandera && TengoMiBandera)){
		  
		  Accion a = new Accion(Pensar.pensar());
		  boolean mueve = !mover(a); 
		  if (mueve || a.getAccion() == Constantes.NULA) depura("No te estas moviendo :" + getPosJ(),2);
		  else if (depuracion >1 ) getTablero().pintarTablero();
  }
	  if (depuracion >0 ) getTablero().pintarTablero();
  }
	public static void setAlgoritmo(int _algoritmo) {
		algoritmo = _algoritmo;
		
	}	
}
