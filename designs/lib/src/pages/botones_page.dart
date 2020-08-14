import 'package:flutter/material.dart';

import 'dart:math';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[_fondoApp()],
    ));
  }

  Widget _fondoApp() {
    final gradiente = Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(52, 54, 101, 1),
          Color.fromRGBO(35, 37, 57, 1)
        ], begin: FractionalOffset(0, 0.6), end: FractionalOffset(0, 1))));

    final cajaRosa = Transform.rotate(
        angle: -pi / 5,
        child: Container(
            height: 360,
            width: 360,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(236, 98, 188, 1),
                  Color.fromRGBO(241, 142, 172, 1)
                ]))));

    return Stack(
      children: <Widget>[gradiente, Positioned(top: -100, child: cajaRosa)],
    );
  }
}
