package observer;

public class Auto {
	
	private String marca;
	private String color;
	
	public Auto(String marca, String color) {
		this.marca = marca;
		this.color = color;
		
	}
	
	// Getters y setters
	
	public String getMarca() {
		return marca;
	}
	
	public void setMarca(String marca) {
		this.marca = marca;
	}
	
	public String getColor() {
		return color;
	}
	
	public void setColor(String color) {
		this.color = color;
	}
	
	
}
