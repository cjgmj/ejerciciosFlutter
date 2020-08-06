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
        floatingActionButton: _crearBotones());
  }

  Widget _crearBotones() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      SizedBox(width: 30),
      FloatingActionButton(onPressed: _reset, child: Icon(Icons.exposure_zero)),
      Expanded(child: SizedBox()),
      FloatingActionButton(onPressed: _sustraer, child: Icon(Icons.remove)),
      SizedBox(width: 5),
      FloatingActionButton(onPressed: _agregar, child: Icon(Icons.add))
    ]);
  }

  void _agregar() {
    setState(() => _cont++);
  }

  void _sustraer() {
    setState(() => _cont--);
  }

  void _reset() {
    setState(() => _cont = 0);
  }
}
