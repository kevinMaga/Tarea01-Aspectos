package observer;


public aspect ObserverAspect {
	
    pointcut notifyObservers():
    	call(void Concesionaria.notifyObservers(String));
    
    after() returning(Auto message): notifyObservers(){
    	
    	Concesionaria observe = (Concesionaria) thisJoinPoint.getTarget();
    	observe.notifyObservers(message);
    }
    
    
}

