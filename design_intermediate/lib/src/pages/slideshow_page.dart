import 'package:design_intermediate/src/widgets/slideshow.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Slideshow(
            // puntosArriba: true,
            // colorPrimario: Colors.red,
            // colorSecundario: Colors.red[50],
            slides: <Widget>[
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-2.svg'),
          SvgPicture.asset('assets/svgs/slide-3.svg'),
          SvgPicture.asset('assets/svgs/slide-4.svg'),
          SvgPicture.asset('assets/svgs/slide-5.svg')
          // Text('Hola Mundo'),
          // Container(width: 200, height: 200, color: Colors.blue)
        ]));
  }
}
