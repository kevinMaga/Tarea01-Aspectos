package parte2;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.Timer;

class ColorScroller {
    private static Color[] colors;
    private static int currentIndex;
    private static Timer timer;

    public static void startColorScrolling(Window window, Color color1, Color color2, Color color3) {
        if (timer != null && timer.isRunning()) {
            // Detener el desplazamiento automático si ya está en progreso
            timer.stop();
            System.out.println("Desplazamiento automático detenido");
        } else {
            // Colores para el desplazamiento automático
            colors = new Color[] { color1, color2, color3 };
            currentIndex = 0;

            // Temporizador para cambiar el color automáticamente
            timer = new Timer(1000, new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    // Obtener el color actual del desplazamiento automático
                    Color currentColor = colors[currentIndex];
                    // Establecer el color en la ventana
                    window.setBackgroundColor(currentColor);
                    // Incrementar el índice para pasar al siguiente color
                    currentIndex = (currentIndex + 1) % colors.length;
                }
            });

            // Iniciar el desplazamiento automático
            timer.start();
            System.out.println("Desplazamiento automático iniciado");
        }
    }
}