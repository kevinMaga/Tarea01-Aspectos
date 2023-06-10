/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package observer;

/**
 *
 * @author Kevin Magallanes
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
    	
    	Auto auto = new Auto("Chevrolet Civic", "Negro");
    	
    	Cliente cliente1 = new Cliente("Kevin");
    	Cliente cliente2 = new Cliente("Andres");
    	
    	Concesionaria concesionaria = new Concesionaria();
    	concesionaria.addObserver(cliente1);
    	concesionaria.addObserver(cliente2);
    	
    	concesionaria.addAuto(auto);
    	
    	   	
    	
    	auto.setColor("Rojo");
    	
    	concesionaria.removeObserver(cliente2);
    	
    	auto.setMarca("Ford");
    	
    }
    
}
