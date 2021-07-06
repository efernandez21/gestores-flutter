import 'package:estados_app/src/models/usuario.dart';
import 'package:estados_app/src/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Llamamos la referencia a mi usuarioService
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app), 
            // Removemos el usuario y esto automaticamente cambiara mi widgets
            onPressed: () => usuarioService.removerUsuario()
            
          )
        ],
      ),
      body: (usuarioService.existeUsuario)
          ? InformacionUsuario(usuarioService.usuario)
          : Center(
              child: Text('No hay Usuario Seleccionado'),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
    );
  }
}

// Widget para contener la informacion del usuario
class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  InformacionUsuario( this.usuario);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          // Mapear la lista de profesiones, y usamos la destructuracion de un arreglo que envia los elementos de la lista en uno a uno
          ...usuario.profesiones.map((profesion) => ListTile(
            title: Text(profesion),
          )).toList()
          // ListTile(
          //   title: Text('Profesion 1'),
          // ),
        ],
      ),
    );
  }
}
