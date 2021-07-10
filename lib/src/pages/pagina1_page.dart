import 'package:estados_app/src/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:estados_app/src/bloc/usuario/usuario_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // El blocbulder consume mi cubit
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pagina 1'),
        actions: [
          // Ejecucion de la llamada al context para actualizar el estado
          IconButton(
            icon: Icon(Icons.exit_to_app), 
            onPressed: ()=> context.bloc<UsuarioCubit>().borrarUsuario()
          )
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
    );
  }
}

// Construccion del widget a traves del cubit
class BodyScaffold extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        // Basado en el state tengo la informacion en la que se encuentra mi estado
        // print(state);
        
        // Si el estado actual es instancia del estado inicial entonces retornamos cierto widget, podriamos usar un switch pero por ahora usaremos esta condicion simple
        switch (state.runtimeType) {
          case UsuarioInitial:
            return Center( child: Text('No hay Informacion del usuario'));
          break;
          case UsuarioActivo:
          // Casteamos el state al tipo elegido, porque sabemos que pertenece a este
            return InformacionUsuario( (state as UsuarioActivo).usuario );
          break;
          default:
            return  Center(child: Text('Estado no reconocido'),);
        }
        // if (state is UsuarioInitial) {
        //   return Center(
        //     child: Text('No hay Informacion del usuario'),
        //   );
        // } else if (state is UsuarioActivo) {
        //   // en el state tenemos el usuario
        //   return InformacionUsuario(state.usuario);
        // } else {
        //   return Center(child: Text('Estado no reconocido'),);
        // }
      },
    );
  }
}

// Widget para contener la informacion del usuario
class InformacionUsuario extends StatelessWidget {
  // Espero revibir la informacion de un usuario
  final Usuario usuario;

  InformacionUsuario(this.usuario);

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
          // Spread para seleccionar los elementos en cadena
          ...usuario.profesiones.map((profesion) => ListTile(title: Text(profesion))).toList()
        ],
      ),
    );
  }
}
