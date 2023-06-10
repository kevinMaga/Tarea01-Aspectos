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

    public void addObserver(ColorObserver observer) {
        observers.add(observer);
    }

    public void setBackgroundColor(Color color) {
        backgroundColor = color;
        notifyObservers();
    }

    private void notifyObservers() {
        for (ColorObserver observer : observers) {
            observer.update(backgroundColor);
        }
    }

    public static void main(String[] args) {
        JFrame frame = new JFrame("Ventana con Observer");
        JPanel panel = new JPanel();

        Window window = new Window();

        ColorObserver observer1 = new ColorObserver();
        ColorObserver observer2 = new ColorObserver();

        window.addObserver(observer1);
        window.addObserver(observer2);

        JButton button1 = new JButton("Color 1");
        button1.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                window.setBackgroundColor(Color.RED);
            }
        });

        JButton button2 = new JButton("Color 2");
        button2.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                window.setBackgroundColor(Color.GREEN);
            }
        });

        JButton button3 = new JButton("Color 3");
        button3.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                window.setBackgroundColor(Color.BLUE);
            }
        });

        panel.add(button1);
        panel.add(button2);
        panel.add(button3);

        frame.getContentPane().add(panel);
        frame.setSize(500, 500);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}

class ColorObserver {
    public void update(Color backgroundColor) {
        System.out.println("Nuevo color de fondo: " + backgroundColor);
    }
}


