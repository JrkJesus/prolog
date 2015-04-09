package mente;

import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import mente.auxiliar.Constantes;
import mente.auxiliar.Nodo;


public class Tablero {

	int DX,DY;          // Dimension tablero
	int VX,VY;          // Dimension ventana
	char[] contenido;   // Contenido tablero
	

	Nodo BanderaM;  // Mi bandera
	Nodo BanderaC;  // Bandera Contraria
	
	Nodo BaseM;     // Mi base
	Nodo BaseC;     // Base Contraria
	
	
	
	public Tablero(int _dimx, int _dimy) {
		DX = VX = _dimx;
		DY = VY = _dimy;
		contenido = new char[DX*DY];
		Cerebro.PosJ = new Nodo(0,0);
	}
	
	
	/**
	 * Crea un Tablero a partir de un string de inicio separado con comas con el formato:
	 * "[ANCHO_MAPA],[ALTO_MAPA],[ANCHO_VENTANA],[ALTO_VENTANA],[POS_X],[POS_Y],[MAPA]"
	 * La ventana no se utiliza en esta versi—n , puede contener cualquier nœmero
	 * Actualiza la posicion del jugador y las banderas.
	 */
	/**
	 * @param linea
	 */
	public Tablero(String linea) {
		//"[ANCHO_MAPA],[ALTO_MAPA],[ANCHO_VENTANA],[ALTO_VENTANA],[POS_X],[POS_Y],[MAPA]"
		
	//	Cerebro.Equipo = 7;

		StringTokenizer st = new StringTokenizer(linea,",");
		if (st.countTokens() == 7) {
			DY = Integer.parseInt(st.nextToken());
			DX = Integer.parseInt(st.nextToken());
			VY = Integer.parseInt(st.nextToken());
			VX = Integer.parseInt(st.nextToken());
			Cerebro.PosJ = new Nodo(
					Integer.parseInt(st.nextToken()),   // Y
					Integer.parseInt(st.nextToken()));  // X
			contenido = st.nextToken().toCharArray();

			char p;
			
			for(int y=0;y<DY;y++) {
				for(int x=0;x<DX;x++) {
					p = contenido[y*DX + x];
					switch(p) {
					
					case Constantes.PARED:
					case Constantes.VACIO:
						break;
						
					case Constantes.BANDERA_AZUL:
						Cerebro.depura("La bandera azul est‡ en " + x + "," + y,2);
						if (Cerebro.EquipoXXX == 7) 
							BanderaM = new Nodo(y,x);
						else	
							BanderaC = new Nodo(y,x);
						break;
						
					case Constantes.BANDERA_ROJA:
						Cerebro.depura("La bandera roja est‡¡ en " + x + "," + y,2);
						if (Cerebro.EquipoXXX == 8)
							BanderaM = new Nodo(y,x);
						else	
							BanderaC = new Nodo(y,x);
						break;
						
					case Constantes.BASE_AZUL:
						if (Cerebro.EquipoXXX == 7) 
							BaseM = new Nodo(y,x);
						else	
							BaseC = new Nodo(y,x);
						break;
						
					case Constantes.BASE_ROJA:
						if (Cerebro.EquipoXXX == 8) 
							BaseM = new Nodo(y,x);
						else	
							BaseC = new Nodo(y,x);
						break;
					
					default:
						Cerebro.depura("Caracter NO reconocido" + p,2);
					
					}
		}
					
			}					
			
			if (BaseM == null) {
				BaseM = BanderaM;
			}
			if (BaseC == null) {
				BaseC = BanderaC;
			}


			Cerebro.depura("BANDERA CONTRARIA: " + BanderaC.toString(),2);
			Cerebro.depura("Mi BANDERA: " + BanderaM.toString(),2);

			Cerebro.depura("La base CONTRARIA est‡ en: " + BaseC.toString(),2);
			Cerebro.depura("Mi base est‡ en: " + BaseM.toString(),2);
			
			
		} else {
			System.out.println("OJO!!  CREACION TABLERO ERRONEA");
		}
	}
	
	
	
	
	
	
	
	public void actualizarTablero(String _cont) {
		contenido = _cont.toCharArray();		
	}
	
	public void actualizarVentana(int _x, int _y, String _cont) {
		Cerebro.PosJ.setXY(_x,_y);
		for (int i=0;i<VY;i++) {
			for (int j=0;j<VX;j++) {
				contenido[(j+_x)+(i+_y)*DX] = _cont.charAt(j+i*DX );
			}
		}
	}
	
	
	/**
	 * Saca por pantalla in
	 */
	public void pintarTablero() {

		char[] temp = contenido.clone();
		
		Cerebro.depura("*********************** Posici—n jugador: (" + Cerebro.PosJ.getX() +","+ Cerebro.PosJ.getY()+ ")",1);
		
		
		temp[indiceJ()] = 'J';
		
		for(int y=0;y<DY;y++) {
			for(int x=0;x<DX;x++) {
				System.out.print(temp[x+(y*DX)]);				
			}
			System.out.println();
		}
		
	}
	public void pintarTablero(List reco, char c) {

		char[] temp = contenido.clone();
				
		Iterator<Nodo> i = reco.iterator();
		while (i.hasNext()) {
			Nodo n = i.next();
			temp[n.getX()+(n.getY()*DX)] = c;
		}
		
		temp[indiceJ()] = 'J';
		
		for(int y=0;y<DY;y++) {
			for(int x=0;x<DX;x++) {
				System.out.print(temp[x+(y*DX)]);				
			}
			System.out.println();
		}
	}
	
	
	
	
	private int indiceJ() {
		return Cerebro.PosJ.getX() + DX*Cerebro.PosJ.getY();
	}
	
	private char getCasilla(int _x, int _y) {
		return contenido[_x + DX*_y];
	}
	
	

	public Nodo getBaseM() {
		return BaseM;
	}

	public Nodo getBaseC() {
		return BaseC;
	}
	
	public Nodo getBanderaM() {
		return BanderaM;
	}

	public Nodo getBanderaC() {
		return BanderaC;
	}
	
	
	public boolean casillaValida(Nodo _p) {
		return getCasilla(_p.getX(),_p.getY()) != Constantes.PARED;
	}
	
	
	
	
	public int costeCelda(Nodo _p) {
		return 1;
	}
	
	public int costeCelda(int _y,int _x) {
		return 1;
	}


	public void setcontenido(int x, int y, char c) {
		contenido[x+(y*DX)] = c;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
