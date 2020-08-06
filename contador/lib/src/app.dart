import 'package:flutter/material.dart';

// import 'package:contador/src/pages/home_page.dart';
import 'package:contador/src/pages/contador_page.dart';

// Widget
// Todos los Widgets son clases
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Este Widget permite la configuración global de la aplicación
    // return MaterialApp(home: Center(child: HomePage()));
    return MaterialApp(
        // Quita el banner de debug
        debugShowCheckedModeBanner: false,
        home: Center(child: ContadorPage()));
  }
}
