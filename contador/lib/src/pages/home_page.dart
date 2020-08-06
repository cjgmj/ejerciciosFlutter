import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final estiloTexto = TextStyle(fontSize: 25);
  final cont = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Stateless'), centerTitle: true),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text('Número de taps:', style: estiloTexto),
              Text('$cont', style: estiloTexto)
            ])),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            // Si lo pasas a null es como si estuviera deshabilitado
            onPressed: () {
              print('Hola Mundo!');
            }));
  }
}
