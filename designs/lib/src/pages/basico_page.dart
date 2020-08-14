import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 18, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      _crearImagen(),
      _crearTitulo(),
      _crearAcciones(),
      _crearTexto(),
      _crearTexto(),
      _crearTexto()
    ]));
  }

  Widget _crearImagen() {
    return Image(image: NetworkImage('https://i.redd.it/0y95chox5hvz.jpg'));
  }

  Widget _crearTitulo() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(children: <Widget>[
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Rakotzbrücke', style: estiloTitulo),
                  SizedBox(height: 7),
                  Text('Kromlau, Germany', style: estiloSubtitulo)
                ]),
          ),
          Icon(Icons.star, color: Colors.red, size: 30),
          Text('41', style: TextStyle(fontSize: 20))
        ]));
  }

  Widget _crearAcciones() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _crearAccion(Icons.call, 'CALL'),
          _crearAccion(Icons.near_me, 'ROUTE'),
          _crearAccion(Icons.share, 'SHARE')
        ]);
  }

  Widget _crearAccion(IconData icon, String texto) {
    return Column(children: <Widget>[
      Icon(icon, color: Colors.blue, size: 40),
      SizedBox(height: 5),
      Text(
        texto,
        style: TextStyle(fontSize: 15, color: Colors.blue),
      )
    ]);
  }

  Widget _crearTexto() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Text(
          'Lorem sit aliqua id pariatur ullamco nostrud enim minim quis enim id. Incididunt dolor enim do cupidatat in. Mollit consequat deserunt et aute eiusmod ut aliquip pariatur. Aute elit pariatur consequat sit nisi veniam nostrud. Veniam culpa dolore excepteur veniam est enim ea anim eiusmod laborum laboris do est do.',
          textAlign: TextAlign.justify),
    );
  }
}
