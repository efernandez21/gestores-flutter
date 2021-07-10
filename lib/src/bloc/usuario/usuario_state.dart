// Contiene los estados del Cubit
// Es un archivo hijo que forma parte de usuario_cubit
part of 'usuario_cubit.dart';

// Colocamos que esta clase nunca va a cambiar que sera inmutable
@immutable
abstract class UsuarioState {}

// Estado inicial de mi app, la app tendra las propiedades de mi clase UsuarioInitial
class UsuarioInitial extends UsuarioState {
  // Esta variable me indica que no hay usuario, no necesitare referenciar el Usuario para trabajarlo en este estado inicial
  final existeUsuario = false;
}

// Estado posible en mi aplicacion, para el usuario activo
class UsuarioActivo extends UsuarioState {
  // Propiedades posibles en este estado
  final existeUsuario = true;
  final Usuario usuario;
  // Constructor para inicializar mi propiedad final de usuario Activo
  UsuarioActivo(this.usuario);
}
