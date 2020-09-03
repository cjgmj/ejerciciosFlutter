import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView(physics: BouncingScrollPhysics(), children: <Widget>[
      Container(color: Colors.red),
      Container(color: Colors.green)
    ]));
  }
}
