import 'package:estados_app/src/controllers/usuario_controller.dart';
import 'package:estados_app/src/models/usuario.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

// import 'package:estados_app/src/pages/pagina2_page.dart';
class Pagina1Page extends StatelessWidget {
  // Para navegar con get es muy sencillo basta con llamar el Get y .to() hacia la pantalla a navegar, inyectamos nuestro usuarioController  como una inyeccion de dependencias a nuestro context

  @override
  Widget build(BuildContext context) {
    // Inyeccion del controllador a mi context, lo eleva al context y obtengo la misma instancia del UsuarioController
    final usuarioCtrl = Get.put(UsuarioController());
    // Podemos usar la funcion Obx que al cambiar una propiedad redibujara un widget
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pagina 1'),
      ),
      body: Obx(() =>
          usuarioCtrl.existeUsuario.value 
            ? InformacionUsuario(usuario: usuarioCtrl.usuario.value,) 
            : NoInfo()
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        // onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        // onPressed: () => Get.to(()=>Pagina2Page()),
        onPressed: () => Get.toNamed('pagina2',
            arguments: {'nombre': 'Fernando', 'edad': 35}),
      ),
    );
  }
}

// Widget para usuario No establecido
class NoInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('No hay Usuario seleccionado')),
    );
  }
}

// Widget para contener la informacion del usuario
class InformacionUsuario extends StatelessWidget {
  // Recibe la informacion a trabajar
  final Usuario usuario;

  InformacionUsuario({Key key, @required this.usuario}) : super(key: key);

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
            title: Text('Nombre: ${this.usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${this.usuario.edad}'),
          ),
          Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          if(usuario.profesiones != null)
            ...usuario.profesiones.map((profesion) => ListTile(
              title: Text(profesion),
            )).toList()
        ],
      ),
    );
  }
}
