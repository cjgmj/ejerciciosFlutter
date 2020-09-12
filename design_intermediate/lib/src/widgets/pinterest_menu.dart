import 'package:flutter/material.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final List<PinterestButton> items = [
    PinterestButton(
        icon: Icons.pie_chart,
        onPressed: () {
          print('Icons pie_chart');
        }),
    PinterestButton(
        icon: Icons.search,
        onPressed: () {
          print('Icons search');
        }),
    PinterestButton(
        icon: Icons.notifications,
        onPressed: () {
          print('Icons notifications');
        }),
    PinterestButton(
        icon: Icons.supervised_user_circle,
        onPressed: () {
          print('Icons supervised_user_circle');
        })
  ];

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text('Hola Mundo')));
  }
}
