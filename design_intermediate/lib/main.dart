import 'package:flutter/material.dart';

// import 'package:design_intermediate/src/pages/headers_page.dart';
// import 'package:design_intermediate/src/pages/animaciones_page.dart';
// import 'package:design_intermediate/src/retos/cuadrado_animado_page.dart';
// import 'package:design_intermediate/src/labs/circular_progress_page.dart';
// import 'package:design_intermediate/src/pages/graficas_circulares_page.dart';
import 'package:design_intermediate/src/pages/slideshow_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diseños App',
        home: SlideShowPage());
  }
}
