package parte2;

import java.awt.Color;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public aspect FilePersistenceAspect {
	// Pointcut para capturar la llamada al método que establece el color de fondo de la ventana
    pointcut setBackgroundColorCall(Window window, Color color) :
        call(void Window.setBackgroundColor(Color)) && target(window) && args(color);

    // Advice que se ejecutará después de establecer el color de fondo de la ventana
    after(Window window, Color color) returning : setBackgroundColorCall(window, color) {
        saveWindowState(window);
    }

    // Método para guardar el estado de la ventana en un archivo
    private void saveWindowState(Window window) {
        try {
            FileOutputStream fileOut = new FileOutputStream("window_state.ser");
            ObjectOutputStream out = new ObjectOutputStream(fileOut);
            out.writeObject(window);
            out.close();
            fileOut.close();
            System.out.println("Estado de la ventana guardado en 'window_state.ser'");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Pointcut para capturar la llamada al método initialize de la ventana
    pointcut initializeCall(Window window) : call(void Window.initialize()) && target(window);

    // Advice que se ejecutará después de inicializar la ventana
    after(Window window) returning : initializeCall(window) {
        loadWindowState(window);
    }

    // Método para cargar el estado de la ventana desde un archivo
    private void loadWindowState(Window window) {
        try {
            FileInputStream fileIn = new FileInputStream("window_state.ser");
            ObjectInputStream in = new ObjectInputStream(fileIn);
            Window loadedWindow = (Window) in.readObject();
            in.close();
            fileIn.close();
            window.setBackgroundColor(loadedWindow.getBackgroundColor());
            System.out.println("Estado de la ventana cargado desde 'window_state.ser'");
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

}
