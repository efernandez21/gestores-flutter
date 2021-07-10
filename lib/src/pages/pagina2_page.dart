import 'package:estados_app/src/bloc/usuario/usuario_cubit.dart';
import 'package:estados_app/src/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Llamado al mi usuarioCubit
    final usuarioCubit = context.bloc<UsuarioCubit>();

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
                  // Realizamos la llamada al bloc para hacer el cambio del estado, ademas especificamos que tipo de context buscar en el bloc
                  final newUser = new Usuario(
                      nombre: 'Fernando Herrera',
                      edad: 34,
                      profesiones: [
                        'FullStack Developer',
                        'Videojugador Veterano'
                      ]);
                  // Enviamos mi info al bloc
                  usuarioCubit.seleccionarUsuario(newUser);
                }),
            MaterialButton(
                color: Colors.blue,
                child: Text(
                  'Cambiar Edad',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // Enviandole al cubit para cambiar la edad
                  usuarioCubit.cambiarEdad(30);
                }),
            MaterialButton(
                color: Colors.blue,
                child: Text(
                  'Añadir Profesion',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  usuarioCubit.agregarProfesion();
                }),
          ],
        ),
      ),
    );
  }
}
