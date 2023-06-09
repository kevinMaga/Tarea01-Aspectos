package observer;
import java.util.List;
import java.util.ArrayList;

public aspect ObserverAspect {
	private List<Auto> Concesionaria.autos = new ArrayList<>();

    pointcut addObserverPointcut(Concesionaria concesionaria, Observe observer):
        execution(void Concesionaria.addObserver(Observer)) && target(concesionaria) && args(observer);

    pointcut removeObserverPointcut(Concesionaria concesionaria, Observe observer):
        execution(void Concesionaria.removeObserver(Observer)) && target(concesionaria) && args(observer);

    pointcut addAutoPointcut(Concesionaria concesionaria, Auto auto):
        execution(void Concesionaria.addAuto(Auto)) && target(concesionaria) && args(auto);

    after(Concesionaria concesionaria, Observe observer): addObserverPointcut(concesionaria, observer) {
        System.out.println("Nuevo observador agregado: " + observer);
    }

    after(Concesionaria concesionaria, Observe observer): removeObserverPointcut(concesionaria, observer) {
        System.out.println("Observador removido: " + observer);
    }

    after(Concesionaria concesionaria, Auto auto): addAutoPointcut(concesionaria, auto) {
        autos.add(auto);
        System.out.println("Nuevo auto agregado: " + auto);
    }
}

