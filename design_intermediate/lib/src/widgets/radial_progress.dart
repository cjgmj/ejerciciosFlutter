import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;

  RadialProgress({this.porcentaje});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  // Con el atributo widget se acceden a las propiedades del Widget
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: _MiRadialProgress(widget.porcentaje),
        ));
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;

  _MiRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    // Círculo completo
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final center = new Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.orange
      ..style = PaintingStyle.stroke;

    // Parte que se irá rellenando
    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
