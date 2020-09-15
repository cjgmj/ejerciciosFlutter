import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.pink, title: Text('Notifications Page')),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigation());
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            title: Text('Bones'), icon: FaIcon(FontAwesomeIcons.bone)),
        BottomNavigationBarItem(
            title: Text('Notifications'),
            icon: Stack(children: <Widget>[
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                  top: 0,
                  right: 0,
                  // child: Icon(Icons.brightness_1,
                  //     color: Colors.redAccent, size: 8))
                  child: Container(
                      child: Text('6',
                          style: TextStyle(color: Colors.white, fontSize: 7)),
                      alignment: Alignment.center,
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          color: Colors.redAccent, shape: BoxShape.circle))),
            ])),
        BottomNavigationBarItem(
            title: Text('My Dog'), icon: FaIcon(FontAwesomeIcons.dog))
      ],
    );
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.pink,
        child: FaIcon(FontAwesomeIcons.play),
        onPressed: () {});
  }
}
