/**
 * 
 */
package mente;
import java.io.*;
import java.util.Random;
/**
 *Stub de servidor para pruebas en batch. 
 *En ve de lanzar la plataforma JADE, llama directametne al alumno.pensar y simula su jego en un tablero aparte
 *
 */
public class Server {


	/**
	 * @param args
	 * como parametro1: el mapa a cargar, debe estar en el mismo directorio que la clase
	 * Parametros opcionales: 
	 * par 2 :Algoritmo 1,2,3,4
	 * pqr 3 Nivel de depuraci—n de -1 a 2 : 0 pr defecto
	 * par 5 :Activaci—n de la traza sobre el mapa. 0/1. Activada por defecto
	 * par 4,5 : Posici—n inicial del Jugador. Si no se incluye se realiza aleatoriamente
	 */
	public static void main(String[] args){
		int dx=0;
		int dy=0,posy=7, posx=13;
		String fichero = "mapa00.txt";
		if (args.length>0){//fichero 
			fichero=args[0];
			if (args.length>1)//Algoritmo
		    	{Cerebro.setAlgoritmo( Integer.parseInt( args[1]));  
		    	
		    }
			
		    if (args.length>2)//depuraci—n
		    	{Cerebro.setDepuracion( Integer.parseInt( args[2]));  
		    	
		    }
		    	
		    if (args.length>3)//traza recorrido
		    {if (Integer.parseInt( args[3])==0) Cerebro.setTraza(false);
		    }
	    	if (args.length>5) {
	    		posx =  Integer.parseInt( args[4]);
	    		posy =  Integer.parseInt( args[5]);
	          	}
	    	

		}	
	    	
		
		String texto = new String();
		String mapa = new String();
		try {
		FileReader fr = new FileReader(fichero);
		BufferedReader entrada = new BufferedReader(fr);
		String s;
		
		try {
			while((s = entrada.readLine()) != null){
				mapa += s + "\n";
				texto += s;
				if (dx ==0) dx = s.length();
				dy++;
			}
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		try {
			entrada.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		catch(java.io.FileNotFoundException fnfex) {
			System.out.println("Archivo no encontrado: " + fnfex);}
		
		 if (args.length < 5) {
				
			 posx =  (int) Math.round(Math.random()*dx); 
			 posy =  (int) Math.round(Math.random()*dy); ;
			 
		 }	
		//TODO componentes aleatorias de inicio
		Cerebro.depura(texto,3);
		texto = ""+ dy +","+ dx + ",3,3," + posy + "," + posx + "," + texto;
		Cerebro.EquipoXXX = 7;
		Cerebro.crearTablero(texto);
		Cerebro.depura(mapa,1);
	    Cerebro.play();
	    
		}
	
	}

	


