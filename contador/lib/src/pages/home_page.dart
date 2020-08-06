import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final estiloTexto = TextStyle(fontSize: 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Título'), centerTitle: true),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text('Número de taps:', style: estiloTexto),
              Text('0', style: estiloTexto)
            ])),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            // Si lo pasas a null es como si estuviera deshabilitado
            onPressed: () {
              print('Hola Mundo!');
            }));
  }
}
