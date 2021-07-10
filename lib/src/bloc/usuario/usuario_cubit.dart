// Archivo que cambiara el estado, y controlara este
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_app/src/models/usuario.dart';
// Importacion especial que indica que usuario_state forma parte de este, esto en busqueda de importaciones mas limpias
part 'usuario_state.dart';

// La clase extiende de Cubit y recibe el tipo de informacion que fluye en el, ademas de agregar su informacion inicial o estado inicial
class UsuarioCubit extends Cubit<UsuarioState> {
  // Constructor con el estado inicial
  UsuarioCubit() : super(UsuarioInitial());
  // Metodo para seleccionar usuario
  void seleccionarUsuario(Usuario user) {
    // Emitimos un nuevo estado, al seleccionar el usuario
    emit(new UsuarioActivo(user));
  }

  // Metodo para cambiar la edad
  void cambiarEdad(int edad) {
    // Validacion en el caso de no estar en el estado necesario
    final currentState = state;
    if (currentState is UsuarioActivo) {
      // Hacemos la copia al usuario y le enviamos esta al estado activo con la info del nuevo usuario
      final newUser = currentState.usuario.copyWith(edad: 30);
      // Debemos emitir un nuevo estado, no mutarlo
      emit(UsuarioActivo(newUser));
    }
  }

  // Metodo para añadir una profesion a la lista
  void agregarProfesion() {
    // Agregar una profesion al arreglo
    final currentState = state;
    if (currentState is UsuarioActivo) {
      // Creamos el usuario respectivo basado en una copia de este
      final newProfesiones = [
        ...currentState.usuario.profesiones,
        'Profesión ${currentState.usuario.profesiones.length + 1}'
      ];
      // Otra forma de agregar profesiones
      // final newUser = currentState.usuario.copyWith(profesiones: currentState.usuario.profesiones..add(profesion));
      final newUser =
          currentState.usuario.copyWith(profesiones: newProfesiones);
      emit(UsuarioActivo(newUser));
    }
  }

  // Metodo para borrar Usuario, o el cambio de estado al estado inicial
  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
