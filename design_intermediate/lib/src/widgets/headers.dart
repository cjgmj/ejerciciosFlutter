import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        // Para añadir colores hexadecimales quitar el # y añadir 0xff
        color: Color(0xff615AAB));
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        // Para añadir colores hexadecimales quitar el # y añadir 0xff
        decoration: BoxDecoration(
            color: Color(0xff615AAB),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70))));
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.05,
      child: Container(
          height: 300,
          // Para añadir colores hexadecimales quitar el # y añadir 0xff
          color: Color(0xff615AAB)),
    );
  }
}
