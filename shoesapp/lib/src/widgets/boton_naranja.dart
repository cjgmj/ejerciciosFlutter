import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  final String texto;
  final double alto;
  final double ancho;

  const BotonNaranja({@required this.texto, this.alto = 50, this.ancho = 150});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: this.ancho,
        height: this.alto,
        decoration: BoxDecoration(
            color: Color(0xffF1A23A), borderRadius: BorderRadius.circular(100)),
        child: Text(texto, style: TextStyle(color: Colors.white)));
  }
}
