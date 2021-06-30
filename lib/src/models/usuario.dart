// Import del paquete para el required
import 'package:meta/meta.dart';

// Clase Usuario para trabajar con la informacion de mi aplicacion
class Usuario {
  String nombre;
  int edad;
  List<String> profesiones;

  // Constructor de mi modelo, con la comprobacion de error en su construccion con el assert, si no se cumple su valor reventara la aplicacion
  Usuario({@required this.nombre, this.edad, this.profesiones})
      : assert(nombre != null);
}
