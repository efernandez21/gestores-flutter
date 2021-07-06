import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estados_app/src/services/usuario_service.dart';
import 'package:estados_app/src/pages/pagina1_page.dart';
import 'package:estados_app/src/pages/pagina2_page.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        // El lazy se usa para crear la instancia apenas se necesite, el false permite crear la instancia tan pronto se cree este widget
        ChangeNotifierProvider(create: ( _ ) => new UsuarioService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1' : (_) => Pagina1Page(),
          'pagina2' : (_) => Pagina2Page(),
        },
      ),
    );
  }
}