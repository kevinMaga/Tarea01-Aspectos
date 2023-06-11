# Tarea01-Aspectos

# Funcionalidad adicional:
En el nuevo aspecto llamado "FilePersistenceAspect", se definen dos puntos de corte: uno para capturar la llamada al método setBackgroundColor y otro para capturar la llamada al método initialize de la clase Window.

El advice después del punto de corte setBackgroundColorCall se ejecutará después de que se establezca el color de fondo de la ventana, y guardará el estado de la ventana en un archivo utilizando la serialización de objetos.

El advice después del punto de corte initializeCall se ejecutará después de que se inicialice la ventana y cargará el estado de la ventana desde el archivo guardado previamente.

Estos aspectos proporcionan la funcionalidad adicional necesaria para la persistencia de archivos en la clase Window, permitiendo guardar y cargar el estado de la ventana desde un archivo