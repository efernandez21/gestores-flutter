import 'package:estados_app/src/models/usuario.dart';
import 'package:estados_app/src/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Pagina2Page extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    // El listen en false para no trabajar el intento de redibujar un metodo
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: (usuarioService.existeUsuario)
          ? Text(usuarioService.usuario.nombre)
          : Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              color: Colors.blue,
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white),),
              onPressed: (){
                final newUser = new Usuario(
                  nombre: 'Fernando Herrera', 
                  edad: 34,
                  profesiones: [
                    'Fullstack Developer',
                    'Video Jugador Experto'
                  ]
                );
                usuarioService.usuario = newUser;
              }
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white),),
              onPressed: (){
                usuarioService.cambiarEdad(25);
              }
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Añadir Profesion', style: TextStyle(color: Colors.white),),
              onPressed: (){
                usuarioService.agregarProfesion();
              }
            ),

          ],
        ),
      ),
    );
  }
}