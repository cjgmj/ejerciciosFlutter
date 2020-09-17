import 'package:flutter/material.dart';

class ZapatoSizePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
          width: double.infinity,
          height: 430,
          decoration: BoxDecoration(
              color: Color(0xffFFCF53),
              borderRadius: BorderRadius.circular(50)),
          child: Column(
            children: <Widget>[
              // Zapato con sombre
              _ZapatoConSombra()

              // TODO: tallas
            ],
          )),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50),
      child: Stack(
          children: <Widget>[Image(image: AssetImage('assets/imgs/azul.png'))]),
    );
  }
}
