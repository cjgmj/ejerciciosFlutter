import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContadorPageState();
}

// Con el _ indicamos que la clase es privada
class _ContadorPageState extends State<ContadorPage> {
  final _estiloTexto = TextStyle(fontSize: 25);
  int _cont = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Stateful'), centerTitle: true),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text('Número de taps:', style: _estiloTexto),
              Text('$_cont', style: _estiloTexto)
            ])),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            // Si lo pasas a null es como si estuviera deshabilitado
            onPressed: () {
              // print('Hola Mundo!');

              // Redibujar componente
              setState(() {
                _cont++;
              });
            }));
  }
}
