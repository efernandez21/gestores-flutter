// Archivo para manejar el controlador de manera global

import 'package:estados_app/src/models/usuario.dart';
import 'package:get/get.dart';

// Controlador de Getx
class UsuarioController extends GetxController {
  // Propiedades del usuario, para convertirlas en observables, se deja en var por simplicidad, el observable es parecido a un stream, ademas de crear el observable lo estamos definiendo con valores ya determinados
  var existeUsuario = false.obs;
  var usuario = new Usuario().obs;
  // get para manejar el numero de profesiones, devolver la longitud de su lista
  int get profesionesCount {
    return this.usuario.value.profesiones.length;
  }
  // Metodo para el cambio de Usuario
  void cargarUsuario(Usuario pUsuario) {
    // Cambiando los valores del observable, añadimos a nuestro stream del observable esos valores
    this.existeUsuario.value = true;
    this.usuario.value = pUsuario;
  }

  // Metodo para cambiar Edad
  void cambiarEdad(int pEdad) {
    // Para cambiar el valor de una propiedad de mi usuario usamos el update
    this.usuario.update((val) {
      val.edad = pEdad;
    });
  }

  // Metodo para agregar Profesion
  void agregarProfesion(String profesion) {
    this.usuario.update((val) {
      // Actualizacion de profesiones mediante el spread
      val.profesiones = [...val.profesiones, profesion];
    });
  }
}
