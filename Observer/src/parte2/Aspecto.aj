package parte2;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.After;
import java.awt.event.ActionEvent;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

@Aspect
public aspect Aspecto {
    @After("execution(* VentanaColor.actionPerformed(..)) && args(e)")
    public void afterCambiarColor(ActionEvent e) {
        try {
            FileWriter fileWriter = new FileWriter("historial.txt", true);
            PrintWriter printWriter = new PrintWriter(fileWriter);
            printWriter.println(LocalDateTime.now() + " - Se ha cambiado el color a: " + e.getActionCommand());
            printWriter.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
