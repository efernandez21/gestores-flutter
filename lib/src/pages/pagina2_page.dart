import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_app/src/models/usuario.dart';
import 'package:estados_app/src/bloc/usuario/usuario_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);
    // si se tuviera un listen si se necesita tabajar con un statefulwidget para llamar el close de este listen

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                color: Colors.blue,
                child: Text(
                  'Establecer Usuario',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  final newUser = new Usuario(
                      nombre: 'Elkin Fernandez',
                      edad: 35,
                      profesiones: ['Fullstack Developer']);
                  // Trabajar o enviar un evento al bloc y este caera a mi metodo mapEventtoState
                  usuarioBloc.add(ActivarUsuario(newUser));
                }),
            MaterialButton(
                color: Colors.blue,
                child: Text(
                  'Cambiar Edad',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // Cambio de edad agregado al bloc, esto posee un listen por defecto al estar en un statelessWidget no hay problema con cerrar el sink debido a el stateless widget
                  usuarioBloc.add(CambiarEdad(30));
                }),
            MaterialButton(
                color: Colors.blue,
                child: Text(
                  'Añadir Profesion',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // Agregar una profesion
                  usuarioBloc.add(AgregarProfesion('Nueva Profesion'));
                }),
          ],
        ),
      ),
    );
  }
}
