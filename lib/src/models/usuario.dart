// Clase Usuario para trabajar con la informacion de mi aplicacion
class Usuario {
  final String nombre;
  final int edad;
  final List<String> profesiones;

  // Constructor de mi modelo
  Usuario({this.nombre, this.edad, this.profesiones});
  // Metodo para crear una nueva instancia de un usuario, basada en otra y no tener problema con los final
  Usuario copyWith({String nombre, int edad, List<String> profesiones}) =>
    // Tomara el nombre que se le indique, pero si no recibe nada tomara el de la instancia ya creada
    Usuario(
      nombre: nombre ?? this.nombre,
      edad: edad ?? this.edad,
      profesiones: profesiones ?? this.profesiones,
    );
  
}
