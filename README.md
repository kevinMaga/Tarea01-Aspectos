# Tarea01-Aspectos

#Funcionalidad adicional:
Aspecto de Persistencia de Archivos
Para demostrar la separación de concerns que se puede lograr con la programación orientada a aspectos, se ha añadido un aspecto de persistencia de archivos utilizando AspectJ. Este aspecto se encuentra en la clase PersistenciaColorAspecto.

Cada vez que se cambia el color de fondo de la ventana (es decir, después de que se ejecuta el método actionPerformed en la clase VentanaColor), el aspecto PersistenciaColorAspecto se activa. Este aspecto escribe en el archivo "historial.txt" la fecha y hora actuales, seguidas de una cadena que indica el nuevo color de fondo.
