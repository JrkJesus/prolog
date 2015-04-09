package mente.auxiliar;

import java.util.*;


public class ListaOrdenada2 extends LinkedList<Nodo> {
	
	public void insertar(Nodo c) {
		
		Iterator<Nodo> i = iterator();
		boolean encontrado = false;
		int indice = 0;
		while (i.hasNext() && !encontrado) {
			Nodo n = i.next();
			
			if (n.getF()>c.getF()) {
				encontrado = true;
			} else
				indice++;
			
		}
		add(indice, c);		
	}
	
	
	public String toString() {
		StringBuffer sb = new StringBuffer();
		
		Iterator<Nodo> i = iterator();
		while (i.hasNext()) {
			Nodo n = i.next();
			sb.append(n.toString()+"\n");
		}
		return sb.toString();
	}

}
