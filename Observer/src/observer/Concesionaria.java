package observer;

import java.util.ArrayList;
import java.util.List;


public class Concesionaria {
	
	private List<Observe> observers = new ArrayList<>();
	private List<Auto> autos = new ArrayList<>();
	
	public void addObserver(Observe observer) {
		
		observers.add(observer);
				
	}
	
	public void removeObserver(Observe observer) {
		
		observers.remove(observer);
		
	}
	
	public void addAuto(Auto auto) {
		
		autos.add(auto);
		notifyObservers(auto);
		
		
	}
	
	public void notifyObservers(Auto auto) {
		
		for(Observe observers : observers) {
			observers.update(auto);
		}
		
	}
}
