import 'package:flutter/material.dart';

class HomeTempPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Componente Temp')),
        body: ListView(
          children: <Widget>[
            ListTile(title: Text('ListTile Title')),
            Divider(),
            ListTile(title: Text('ListTile Title')),
            Divider(),
            ListTile(title: Text('ListTile Title')),
          ],
        ));
  }
}
