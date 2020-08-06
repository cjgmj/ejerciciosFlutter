import 'package:flutter/material.dart';

void main() {
  // Inicia la aplicación recibiendo un Widget
  runApp(new MyApp());
}

// Widget
// Todos los Widgets son clases
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Este Widget permite la configuración global de la aplicación
    return MaterialApp(home: Center(child: Text('Hola Mundo')));
  }
}
