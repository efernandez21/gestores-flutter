import 'package:estados_app/src/controllers/usuario_controller.dart';
import 'package:estados_app/src/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Llamamos los argumentos pasados en la navegacion con el get
    // print(Get.arguments);
    // Encontrar instancia de mi Usuario Controller algo parecido al provider, con la que trabajaremos a cambiar la data dinamicamente
    final usuarioCtrl = Get.find<UsuarioController>();

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
                  // Añadiendo mi data al controller del get, debo inicializar las profesiones esto debido a que no se inicializa se trabaja en null
                  usuarioCtrl.cargarUsuario(Usuario(nombre: 'Fernando', edad: 35, profesiones: ["FullStack Developer"]));
                  // Creamos un snackbar con un showSnackbar(), o se puede trabajr con un snackbar ya presiseñado
                  Get.snackbar(
                    'Prueba de SnackBar', 
                    'Esto es una prueba de ejecucion del Snackbar',
                    backgroundColor: Colors.white,
                    boxShadows: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 10
                      )
                    ]
                  );
                }),
            MaterialButton(
                color: Colors.blue,
                child: Text(
                  'Cambiar Edad',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  usuarioCtrl.cambiarEdad(25);
                }),
            MaterialButton(
                color: Colors.blue,
                child: Text(
                  'Añadir Profesion',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  usuarioCtrl.agregarProfesion('Profesion #${usuarioCtrl.profesionesCount + 1}');
                }),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Cambiar Tema',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                // Forma de cambiar el tema de una forma mas facil y rapida
                Get.changeTheme( Get.isDarkMode ? ThemeData.light() : ThemeData.dark().copyWith());
              }
            ),
          ],
        ),
      ),
    );
  }
}
