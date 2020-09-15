import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NotificationModel(),
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.pink, title: Text('Notifications Page')),
          floatingActionButton: BotonFlotante(),
          bottomNavigationBar: BottomNavigation()),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;

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
                      child: Text('$numero',
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
        onPressed: () {
          int numero =
              Provider.of<_NotificationModel>(context, listen: false).numero;
          numero++;

          Provider.of<_NotificationModel>(context, listen: false).numero =
              numero;
        });
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;

  int get numero => this._numero;

  set numero(int numero) {
    this._numero = numero;

    notifyListeners();
  }
}
