package parte2;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class Window implements Serializable {
	// Lista de observadores que recibirán notificaciones de cambios de color
    private List<ColorObserver> observers = new ArrayList<>();
    // Color de fondo actual de la ventana
    private Color backgroundColor;
    // Panel de la ventana
    private JPanel panel;
    private JButton colorButton1;
    private JButton colorButton2;
    private JButton colorButton3;

    public void addObserver(ColorObserver observer) {
        observers.add(observer);
    }
    // Método para establecer el color de fondo de la ventana
    public void setBackgroundColor(Color color) {
        backgroundColor = color;
        panel.setBackground(backgroundColor);
        notifyObservers();
    }
    // Método para notificar a los observadores del cambio de color
    private void notifyObservers() {
        for (ColorObserver observer : observers) {
            observer.update(backgroundColor);
        }
    }

    public static void main(String[] args) {
        Window window = new Window();
        window.initialize();
    }
    // Método para inicializar la ventana
    private void initialize() {
        JFrame frame = new JFrame("Ventana con Observer");
        JPanel panel = createPanel();

        this.panel = panel;

        ColorObserver observer1 = new ColorObserver();
        ColorObserver observer2 = new ColorObserver();

        addObserver(observer1);
        addObserver(observer2);
     // Botón para iniciar/detener el desplazamiento automático
        JButton startButton = new JButton("Iniciar Desplazamiento Automático");
        startButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                ColorScroller.startColorScrolling(Window.this, colorButton1.getBackground(), colorButton2.getBackground(), colorButton3.getBackground());
            }
        });
        panel.add(startButton);
        
        colorButton1 = addColorButton(panel, "Color 1", Color.yellow);
        colorButton2 = addColorButton(panel, "Color 2", Color.blue);
        colorButton3 = addColorButton(panel, "Color 3", Color.black);

        frame.add(panel);
        frame.setSize(300, 200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
    // Método para crear el panel de la ventana
    private JPanel createPanel() {
        JPanel panel = new JPanel();
        return panel;
    }
    public void setBackgroundColor1(Color color) {
        backgroundColor = color;
        panel.setBackground(backgroundColor);
        notifyObservers();
    }
    
 // Método para agregar un botón con un color al panel
    private JButton  addColorButton(JPanel panel, String text, Color color) {
        JButton button = new JButton(text);
        button.setBackground(color);
        button.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                setBackgroundColor(color);
            }
        });
        panel.add(button);
        return button;
    }
	public Color getBackgroundColor() {
		return backgroundColor;
	}
}
//Clase observadora que imprime el color de fondo cuando se actualiza
class ColorObserver implements Serializable{
    public void update(Color backgroundColor) {
        System.out.println("Nuevo color de fondo: " + backgroundColor);
    }
}

