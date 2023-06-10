package parte2;

import java.awt.Color;

public aspect ColorChangeAspect {
    private Color Window.backgroundColor;

    // Pointcut para capturar la llamada al método que cambia el color de fondo de la ventana
    pointcut changeBackgroundColorCall(Window window, Color color) :
        call(void Window.setBackgroundColor(Color)) && target(window) && args(color);

    // Advice que se ejecutará después de cambiar el color de fondo de la ventana
    after(Window window, Color color) returning : changeBackgroundColorCall(window, color) {
        System.out.println("Nuevo color de fondo: " + color);
    }

    // Pointcut para capturar la llamada al método addObserver del objeto Window
    pointcut addObserverCall(Window window, ColorObserver observer) :
        call(void Window.addObserver(ColorObserver)) && target(window) && args(observer);

    // Advice que se ejecutará después de agregar un observador a la ventana
    after(Window window, ColorObserver observer) returning : addObserverCall(window, observer) {
        System.out.println("Observador agregado: " + observer);
    }
}


