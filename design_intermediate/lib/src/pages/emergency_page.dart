import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:design_intermediate/src/widgets/headers.dart';
import 'package:design_intermediate/src/widgets/boton.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Boton()
            // PageHeader()
            ));
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
        subtitulo: 'Haz solicitado',
        titulo: 'Asistencia Médica',
        color1: Color(0xff526BF6),
        color2: Color(0xff67ACF2));
  }
}
