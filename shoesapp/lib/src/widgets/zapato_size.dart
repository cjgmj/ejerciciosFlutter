import 'package:flutter/material.dart';
import 'package:shoesapp/src/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;

  ZapatoSizePreview({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ZapatoDescPage()));
        }
      },
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: fullScreen ? 5 : 30, vertical: 5),
        child: Container(
            width: double.infinity,
            height: fullScreen ? 410 : 430,
            decoration: BoxDecoration(
                color: Color(0xffFFCF53),
                borderRadius: fullScreen
                    ? BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))
                    : BorderRadius.circular(50)),
            child: Column(
              children: <Widget>[
                // Zapato con sombre
                _ZapatoConSombra(),

                // Tallas
                if (!fullScreen) _ZapatoTallas()
              ],
            )),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _TallaZapatoCaja(7),
            _TallaZapatoCaja(7.5),
            _TallaZapatoCaja(8),
            _TallaZapatoCaja(8.5),
            _TallaZapatoCaja(9),
            _TallaZapatoCaja(9.5)
          ]),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  final double numero;

  const _TallaZapatoCaja(this.numero);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Text('${numero.toString().replaceAll('.0', '')}',
            style: TextStyle(
                color: this.numero == 9 ? Colors.white : Color(0xffF1A23A),
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: this.numero == 9 ? Color(0xffF1A23A) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              if (this.numero == 9)
                BoxShadow(
                    color: Color(0xffF1A23A),
                    blurRadius: 10,
                    offset: Offset(0, 5))
            ]));
  }
}

class _ZapatoConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50),
      child: Stack(children: <Widget>[
        Positioned(bottom: 20, right: 0, child: _ZapatoSombra()),
        Image(image: AssetImage('assets/imgs/azul.png'))
      ]),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
          width: 230,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: <BoxShadow>[
                BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)
              ])),
    );
  }
}
