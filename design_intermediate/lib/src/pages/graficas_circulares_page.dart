import 'package:flutter/material.dart';

import 'package:design_intermediate/src/widgets/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                porcentaje += 10;

                if (porcentaje > 100) {
                  porcentaje = 0;
                }
              });
            }),
        body: Center(
            child: Container(
                width: 300,
                height: 300,
                color: Colors.red,
                child: RadialProgress(porcentaje: 40.0))
            // child: Text('$porcentaje %', style: TextStyle(fontSize: 50))
            ));
  }
}
