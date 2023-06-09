package observer;
import java.util.List;
import java.util.ArrayList;

public aspect ObserverAspect {
	
	private List<Auto> Auto.observers = new ArrayList<>();

    pointcut addObserverPointcut(Auto auto, Observe observer):
    target(auto) && call(void addAuto(Auto)) && args(auto) && target(Concesionaria) && args(observer);
    
    
    pointcut removeObserverPointcut(Auto auto, Observe observer):
    target(auto) && call(void removeObserver(Observe)) && args(observer) && target(Concesionaria);

    pointcut updatePointcut(Auto auto):
    target(auto) && call(void set*(String)) && args(String);

    after(Auto auto, Observe observer): addObserverPointcut(auto, observer) {
        auto.observers.add(observer);
    }

    after(Auto auto, Observe observer): removeObserverPointcut(auto, observer) {
        auto.observers.remove(observer);
    }

    after(Auto auto): updatePointcut(auto) {
        for (Observe observer : auto.observers) {
            observer.update(auto);
        }
    }
	
}
