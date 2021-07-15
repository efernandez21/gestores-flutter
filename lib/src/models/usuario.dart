// Clase Usuario para trabajar con la informacion de mi aplicacion
class Usuario {
  // Propiedades finales para no generar mutaciones en los estaods
  final String nombre;
  final int edad;
  final List<String> profesiones;

  // Constructor de mi modelo
  Usuario({this.nombre, this.edad, this.profesiones});

  // Metodo para crear una copia del usuario, si no se recibe el valor usara el que ya posee
  Usuario copyWith({String nombre, int edad, List<String> profesiones}) =>
      Usuario(
        nombre: nombre  ?? this.nombre,
        edad: edad ?? this.edad,
        profesiones: profesiones ?? this.profesiones
      );
}
