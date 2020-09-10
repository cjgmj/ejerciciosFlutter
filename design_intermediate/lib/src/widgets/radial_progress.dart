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
    return Container(child: Text('${widget.porcentaje}'));
  }
}
