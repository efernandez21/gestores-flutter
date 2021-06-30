import 'dart:async';

import 'package:estados_app/src/models/usuario.dart';

// Clase para servicio del usuario, con una instancia de la clase de forma global o unica
class _UsuarioService {
  Usuario _usuario;
  // StreamController
  StreamController<Usuario> _usuarioStreamController = new StreamController<Usuario>.broadcast();

  // Creamos las propiedades espuestas para este streamController, podriamos usar el sink para solo llamar esta instancia y agregar el usuario al flujo
  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  // Getters y setters
  Usuario get usuario => this._usuario;

  // Comprobacion de la existencia del usuario
  bool get existeUsuario => (this._usuario != null) ? true : false;

  // Metodo para cargar el usuario o establecerlo
  void cargarUsuario(Usuario user) {
    this._usuario = user;
    _usuarioStreamController.add(user);
  }

  // Cambio de la edad
  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    _usuarioStreamController.add(this._usuario);
  }

  // Dispose del streamController
  dispose() {
    _usuarioStreamController?.close();
  }
}

final usuarioService = new _UsuarioService();
// Esta es la forma mas sencilla de crear un singleton, tambien se puede manejar como en los cursos anteriores
