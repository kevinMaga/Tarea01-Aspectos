package parte2;

import java.awt.Color;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public aspect FilePersistenceAspect {
    // Pointcut para capturar la llamada al método startColorScrolling de la clase parte2.ColorScroller
    pointcut startColorScrollingCall(Window window, Color... colorArray) :
        call(void ColorScroller.startColorScrolling(Window, Color[])) && target(window) && args(colorArray);

    // Advice que se ejecutará después de iniciar el desplazamiento automático
    after(Window window, Color... colorArray) returning : startColorScrollingCall(window, colorArray) {
        String event = "Inicio del desplazamiento automático";
        logColorScrollEvent(event);
    }

    // Pointcut para capturar la llamada al método setBackgroundColor de la clase parte2.Window
    pointcut setBackgroundColorCall(Window window, Color color) :
        call(void Window.setBackgroundColor(Color)) && target(window) && args(color);

    // Advice que se ejecutará después de cambiar el color de fondo de la ventana
    after(Window window, Color color) returning : setBackgroundColorCall(window, color) {
        String event = "Cambio de color a " + color.toString();
        logColorScrollEvent(event);
    }

    // Pointcut para capturar la llamada al método stopColorScrolling de la clase parte2.ColorScroller
    pointcut stopColorScrollingCall(Window window) :
        call(void ColorScroller.stopColorScrolling(Window)) && target(window);

    // Advice que se ejecutará después de detener el desplazamiento automático
    after(Window window) returning : stopColorScrollingCall(window) {
        String event = "Fin del desplazamiento automático";
        logColorScrollEvent(event);
    }

    // Método para registrar un evento del desplazamiento automático en el archivo de registro
    private void logColorScrollEvent(String event) {
        String currentTime = getCurrentTime();
        String logEntry = currentTime + " - " + event;

        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter("color_scroll_log.txt", true));
            writer.write(logEntry);
            writer.newLine();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Método para obtener la hora actual en formato HH:mm:ss
    private String getCurrentTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        Date now = new Date();
        return sdf.format(now);
    }
}
