import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
      ),
      body: Center(
        child: Text('Página 1'),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.transform), onPressed: () {}),
    );
  }
}
