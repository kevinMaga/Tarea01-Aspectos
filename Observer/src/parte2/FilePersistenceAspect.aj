package parte2;

import java.awt.Color;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public aspect FilePersistenceAspect {
    // Pointcut para capturar la llamada al método setBackgroundColor de la clase Window
    pointcut setBackgroundColorCall(Window window, Color color) :
        call(void Window.setBackgroundColor(Color)) && target(window) && args(color);

    // Advice que se ejecutará después de cambiar el color de fondo de la ventana
    after(Window window, Color color) returning : setBackgroundColorCall(window, color) {
        saveWindowState(window);
    }

    // Pointcut para capturar la llamada al método initialize de la clase Window
    pointcut initializeCall(Window window) : call(void Window.initialize()) && target(window);

    // Advice que se ejecutará después de inicializar la ventana
    after(Window window) returning : initializeCall(window) {
        loadWindowState(window);
    }

    // Método para guardar el estado de la ventana en un archivo de texto
    private void saveWindowState(Window window) {
        try {
        	File file = new File("window_state.ser");
        	if (!file.exists()) {
        	    file.createNewFile();
        	}
            FileInputStream fileIn = new FileInputStream(file);
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

    // Método para cargar el estado de la ventana desde un archivo de texto
    private void loadWindowState(Window window) {
        Path filePath = Paths.get("window_state.txt");
        try {
            if (Files.exists(filePath)) {
                String colorValue = Files.readString(filePath).trim();
                Color color = new Color(Integer.parseInt(colorValue));
                window.setBackgroundColor(color);
                System.out.println("Estado de la ventana cargado desde window_state.txt");
            } else {
                System.out.println("No se encontró el archivo window_state.txt. Se usará el color predeterminado.");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

