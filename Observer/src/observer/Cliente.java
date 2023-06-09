package observer;

public class Cliente implements Observe {
	
	private String nombre; 
	
	public Cliente(String nombre) {
		
		this.nombre = nombre;
		
	}
	
	@Override
	public void update(Auto auto) {
		
		System.out.println(nombre + ": El auto " + auto.getMarca() + " de color " + auto.getColor() + " ha sido actualizado.");
		
	}
}
