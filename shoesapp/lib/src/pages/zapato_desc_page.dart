import 'package:flutter/material.dart';

import 'package:shoesapp/src/widgets/custom_widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      ZapatoSizePreview(fullScreen: true),
      Expanded(
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
        ZapatoDescripcion(
            titulo: 'Nike Air Max 720',
            descripcion:
                "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
        _PrecioBuyNow(),
        _ColoresYMas()
      ])))
    ]));
  }
}

class _ColoresYMas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(children: <Widget>[
          Expanded(
              child: Stack(children: <Widget>[
            Positioned(left: 90, child: _BotonColor(Color(0xffC6D642))),
            Positioned(left: 60, child: _BotonColor(Color(0xffFFAD29))),
            Positioned(left: 30, child: _BotonColor(Color(0xff2099F1))),
            _BotonColor(Color(0xff364D56)),
          ])),
          BotonNaranja(
            texto: 'More related items',
            alto: 30,
            ancho: 170,
            color: Color(0xffFFC675),
          )
        ]));
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;

  const _BotonColor(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle));
  }
}

class _PrecioBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(children: <Widget>[
              Text('\$180.0',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              Spacer(),
              BotonNaranja(
                  texto: 'Buy now',
                  ancho: 120,
                  alto: 40,
                  color: Color(0xffF1A23A))
            ])));
  }
}
