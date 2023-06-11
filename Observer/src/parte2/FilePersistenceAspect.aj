package parte2;
import java.awt.Color;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public aspect FilePersistenceAspect {
    // Pointcut para capturar la llamada al método setBackgroundColor de la clase parte2.Window
    pointcut setBackgroundColorCall(Window window, Color color) :
        call(void Window.setBackgroundColor(Color)) && target(window) && args(color);

    // Advice que se ejecutará después de cambiar el color de fondo de la ventana
    after(Window window, Color color) returning : setBackgroundColorCall(window, color) {
        saveWindowState(window);
    }

    // Pointcut para capturar la llamada al método initialize de la clase parte2.Window
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
            FileOutputStream fileIn = new FileOutputStream(file);
            ObjectOutputStream in = new ObjectOutputStream(fileIn);
            in.writeObject(window);
            in.close();
            fileIn.close();
           
            System.out.println("Estado de la ventana guardado en 'window_state.ser'");
        } catch (Exception  e) {
            e.printStackTrace();
        }
    }

    // Método para cargar el estado de la ventana desde un archivo de texto
    private void loadWindowState(Window window) {
        Path filePath = Paths.get("window_state.ser");
        try {
            if (Files.exists(filePath)) {
            	FileInputStream fis = new FileInputStream("window_state.ser");
            	try (ObjectInputStream ois = new ObjectInputStream(fis)) {
					Window tempWind = (Window) ois.readObject();
					
					window.setBackgroundColor(tempWind.getBackgroundColor());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            	System.out.println("Estado de la ventana cargado desde window_state.ser");
            } else {
                System.out.println("No se encontró el archivo window_state.ser. Se usará el color predeterminado.");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
   
}

