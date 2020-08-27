import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondo = Container(
        height: size.height * 0.4,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
          Color.fromRGBO(63, 63, 156, 1),
          Color.fromRGBO(90, 70, 178, 1)
        ])));

    final circulo = Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    final texto = Container(
        padding: EdgeInsets.only(top: 80),
        child: Column(children: <Widget>[
          Icon(Icons.person_pin_circle, color: Colors.white, size: 100),
          SizedBox(height: 10, width: double.infinity),
          Text('John Doe', style: TextStyle(color: Colors.white, fontSize: 25))
        ]));

    return Stack(
      children: <Widget>[
        fondo,
        Positioned(top: 90, left: 30, child: circulo),
        Positioned(top: -40, right: -30, child: circulo),
        Positioned(bottom: -50, right: -10, child: circulo),
        Positioned(bottom: 120, right: 20, child: circulo),
        Positioned(bottom: -50, left: -20, child: circulo),
        texto
      ],
    );
  }
}
