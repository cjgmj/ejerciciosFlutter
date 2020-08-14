import 'package:flutter/material.dart';

import 'package:designs/src/pages/basico_page.dart';
import 'package:designs/src/pages/scroll_page.dart';
import 'package:designs/src/pages/botones_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diseños',
        initialRoute: 'botones',
        routes: {
          'basico': (BuildContext context) => BasicoPage(),
          'scroll': (BuildContext context) => ScrollPage(),
          'botones': (BuildContext context) => BotonesPage()
        });
  }
}
