import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:design_intermediate/src/theme/theme.dart';
import 'package:design_intermediate/src/widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Expanded(child: MiSlideShow()),
      Expanded(child: MiSlideShow())
    ]));
  }
}

class MiSlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Slideshow(
        bulletPrimario: 18,
        bulletSecundario: 12,
        // puntosArriba: true,
        colorPrimario: appTheme.darkTheme
            ? appTheme.currentTheme.accentColor
            : Color(0xffFF5A7E),
        colorSecundario: appTheme.darkTheme
            ? appTheme.currentTheme.primaryColorLight
            : Colors.red[100],
        slides: <Widget>[
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-2.svg'),
          SvgPicture.asset('assets/svgs/slide-3.svg'),
          SvgPicture.asset('assets/svgs/slide-4.svg'),
          SvgPicture.asset('assets/svgs/slide-5.svg')
          // Text('Hola Mundo'),
          // Container(width: 200, height: 200, color: Colors.blue)
        ]);
  }
}
