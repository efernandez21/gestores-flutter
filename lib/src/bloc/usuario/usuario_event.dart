part of 'usuario_bloc.dart';

// Acciones que recibe el bloc para modificar el state
// Permite decir que clase de eventos recibira el bloc con el abstract
@immutable
abstract class UsuarioEvent {}

// Montaje de Eventos, accion o funciones que seran disparados desde cualquier lugar
// Evento que activa un usuario
class ActivarUsuario extends UsuarioEvent {
  final Usuario usuario;
  // Constructor
  ActivarUsuario(this.usuario);
  // Establecer usuario
}

// Evento para cambiar la edad recibiremos un valor para cambiar la edad
class CambiarEdad extends UsuarioEvent {
  // Usualmente las propiedades de los eventos son final porque no cambiaran
  final int edad;
  // Constructor para el evento que recibe la edad
  CambiarEdad(this.edad);
}

// Evento para agregar una profesion al usuario y enviaremos esto al estado
class AgregarProfesion extends UsuarioEvent {
  final String profesion;
  // Agregamos la profesion
  AgregarProfesion(this.profesion);

}
// Evento para borrar un usuario en si
class BorrarUsuario extends UsuarioEvent{

}
