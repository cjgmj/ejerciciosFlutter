import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:ui';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
              child:
                  Column(children: <Widget>[_titulos(), _botonesRedondeados()]))
        ]),
        // bottomNavigationBar: BottomNavigationBar(
        //     // Cambia el color del seleccionado
        //     fixedColor: Colors.pink,
        //     items: <BottomNavigationBarItem>[
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.calendar_today), title: Container()),
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.pie_chart_outlined), title: Container()),
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.supervised_user_circle), title: Container())
        //     ])
        bottomNavigationBar: _bottomNavigationBar(context));
  }

  Widget _fondoApp() {
    final gradiente = Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(52, 54, 101, 1),
          Color.fromRGBO(35, 37, 57, 1)
        ], begin: FractionalOffset(0, 0.6), end: FractionalOffset(0, 1))));

    final cajaRosa = Transform.rotate(
        angle: -pi / 5,
        child: Container(
            height: 360,
            width: 360,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(236, 98, 188, 1),
                  Color.fromRGBO(241, 142, 172, 1)
                ]))));

    return Stack(
      children: <Widget>[gradiente, Positioned(top: -100, child: cajaRosa)],
    );
  }

  Widget _titulos() {
    return SafeArea(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Classify transaction',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  Text('Classify this transaction into a particular category',
                      style: TextStyle(color: Colors.white, fontSize: 18))
                ])));
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Color.fromRGBO(55, 57, 84, 1),
            primaryColor: Colors.pinkAccent,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1)))),
        child: BottomNavigationBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, size: 30), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.bubble_chart, size: 30), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle, size: 30),
              title: Container()),
        ]));
  }

  Widget _botonesRedondeados() {
    return Table(children: <TableRow>[
      TableRow(children: <Widget>[
        _crearBotonRedondeado(Colors.blue, Icons.border_all, 'General'),
        _crearBotonRedondeado(Colors.purpleAccent, Icons.directions_bus, 'Bus')
      ]),
      TableRow(children: <Widget>[
        _crearBotonRedondeado(Colors.pinkAccent, Icons.shop, 'Buy'),
        _crearBotonRedondeado(Colors.orange, Icons.insert_drive_file, 'File')
      ]),
      TableRow(children: <Widget>[
        _crearBotonRedondeado(
            Colors.blueAccent, Icons.movie_filter, 'Entertainment'),
        _crearBotonRedondeado(Colors.green, Icons.cloud, 'Grocery')
      ]),
      TableRow(children: <Widget>[
        _crearBotonRedondeado(Colors.red, Icons.collections, 'Photos'),
        _crearBotonRedondeado(Colors.teal, Icons.help_outline, 'Help')
      ])
    ]);
  }

  Widget _crearBotonRedondeado(Color color, IconData icon, String texto) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(62, 66, 107, 0.7),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(height: 5),
                        CircleAvatar(
                            child: Icon(icon, color: Colors.white, size: 30),
                            radius: 35,
                            backgroundColor: color),
                        Text(texto, style: TextStyle(color: color)),
                        SizedBox(height: 5)
                      ])))),
    );
  }
}
