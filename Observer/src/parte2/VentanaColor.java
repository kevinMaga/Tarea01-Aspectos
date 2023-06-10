package parte2;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class VentanaColor extends JFrame implements ActionListener {
	 private static final long serialVersionUID = 1L;
	 public VentanaColor() {
	        JButton botonRojo = new JButton("Rojo");
	        JButton botonVerde = new JButton("Verde");
	        JButton botonAzul = new JButton("Azul");
	        
	        botonRojo.addActionListener(this);
	        botonVerde.addActionListener(this);
	        botonAzul.addActionListener(this);
	        
	        setLayout(new FlowLayout());
	        add(botonRojo);
	        add(botonVerde);
	        add(botonAzul);
	        
	        setSize(300, 200);
	        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	        setVisible(true);
	    }


	public static void main(String[] args) {
		new VentanaColor();

	}


	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
	}

}
