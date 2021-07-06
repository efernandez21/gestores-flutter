import 'package:flutter/material.dart';

import 'package:estados_app/src/models/usuario.dart';

// Clase de UsuarioService para contener su info, esto trabaja con el inheritedWidget
class UsuarioService with ChangeNotifier {
  Usuario _usuario;

  Usuario get usuario => this._usuario;
  bool get existeUsuario => (this._usuario != null) ? true : false;

  // Notifique a los listeners para trabajar con lo necesario
  set usuario(Usuario user) {
    this._usuario = user;
    notifyListeners();
  }

  // Metodo para cambiar edad
  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    notifyListeners();
  }

  // Metodo para eliminar el usuario
  void removerUsuario() {
    this._usuario = null;
    notifyListeners();
  }
  // Agregacion de una profesion a la lista de usuarios
  void agregarProfesion() {
    this._usuario.profesiones.add('Profesion ${this._usuario.profesiones.length + 1}');
    notifyListeners();
  }
}
