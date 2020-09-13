import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import 'package:design_intermediate/src/widgets/headers.dart';
import 'package:design_intermediate/src/widgets/boton.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
              duration: Duration(milliseconds: 250),
              child: Boton(
                  icon: item.icon,
                  texto: item.texto,
                  color1: item.color1,
                  color2: item.color2,
                  onPress: () {
                    print('Click!');
                  }),
            ))
        .toList();

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[SizedBox(height: 80), ...itemMap])),
        _Encabezado(),
      ],
    ));
  }
}

class _Encabezado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconHeader(
          icon: FontAwesomeIcons.plus,
          color1: Color(0xff526BF6),
          color2: Color(0xff67ACF2),
          titulo: 'Asistencia Médica',
          subtitulo: 'Has solicitado',
        ),
        Positioned(
            right: 0,
            top: 45,
            child: RawMaterialButton(
                onPressed: () {},
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white)))
      ],
    );
  }
}

class BotonTemp extends StatelessWidget {
  const BotonTemp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Boton(
        icon: FontAwesomeIcons.carCrash,
        texto: 'Motor Accident',
        color1: Color(0xff6989F5),
        color2: Color(0xff906EF5),
        onPress: () {
          print('Click!');
        });
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
        icon: FontAwesomeIcons.plus,
        subtitulo: 'Has solicitado',
        titulo: 'Asistencia Médica',
        color1: Color(0xff526BF6),
        color2: Color(0xff67ACF2));
  }
}
