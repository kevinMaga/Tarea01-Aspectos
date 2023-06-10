package parte2;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class Window {
    private List<ColorObserver> observers = new ArrayList<>();
    private Color backgroundColor;
    private JPanel panel;

    public void addObserver(ColorObserver observer) {
        observers.add(observer);
    }

    public void setBackgroundColor(Color color) {
        backgroundColor = color;
        panel.setBackground(backgroundColor);
        notifyObservers();
    }

    private void notifyObservers() {
        for (ColorObserver observer : observers) {
            observer.update(backgroundColor);
        }
    }

    public static void main(String[] args) {
        Window window = new Window();
        window.initialize();
    }

    private void initialize() {
        JFrame frame = new JFrame("Ventana con Observer");
        JPanel panel = createPanel();

        this.panel = panel;

        ColorObserver observer1 = new ColorObserver();
        ColorObserver observer2 = new ColorObserver();

        addObserver(observer1);
        addObserver(observer2);

        addColorButton(panel, "Color 1", Color.yellow);
        addColorButton(panel, "Color 2", Color.blue);
        addColorButton(panel, "Color 3", Color.black);

        frame.add(panel);
        frame.setSize(300, 200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }

    private JPanel createPanel() {
        JPanel panel = new JPanel();
        return panel;
    }

    private void addColorButton(JPanel panel, String text, Color color) {
        JButton button = new JButton(text);
        button.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                setBackgroundColor(color);
            }
        });
        panel.add(button);
    }
}

class ColorObserver {
    public void update(Color backgroundColor) {
        System.out.println("Nuevo color de fondo: " + backgroundColor);
    }
}

