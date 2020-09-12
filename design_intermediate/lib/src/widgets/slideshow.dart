import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;

  Slideshow(
      {@required this.slides,
      this.puntosArriba = false,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _SlideshowModel(),
        child: SafeArea(
            child: Center(child: Builder(builder: (BuildContext context) {
          final slideshowModel = Provider.of<_SlideshowModel>(context);

          slideshowModel.colorPrimario = this.colorPrimario;
          slideshowModel.colorSecundario = this.colorSecundario;

          return _CrearEstructuraSlideshow(
              puntosArriba: puntosArriba, slides: slides);
        }))));
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      if (this.puntosArriba) _Dots(this.slides.length),
      Expanded(child: _Slides(this.slides)),
      if (!this.puntosArriba) _Dots(this.slides.length)
    ]);
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 70,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(totalSlides, (index) => _Dot(index))));
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    // final pageViewIndex = Provider.of<_SlideshowModel>(context).currentPage;
    final slideshowModel = Provider.of<_SlideshowModel>(context);

    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: 12,
        height: 12,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: (slideshowModel.currentPage >= index - 0.5 &&
                    slideshowModel.currentPage < index + 0.5)
                ? slideshowModel.colorPrimario
                : slideshowModel.colorSecundario,
            shape: BoxShape.circle));
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView(
            controller: pageViewController,
            children: widget.slides.map((slide) => _Slide(slide)).toList()));
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30),
        child: slide);
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;

  set colorPrimario(Color colorPrimario) {
    this._colorPrimario = colorPrimario;
    notifyListeners();
  }

  Color get colorSecundario => this._colorSecundario;

  set colorSecundario(Color colorSecundario) {
    this._colorSecundario = colorSecundario;
    notifyListeners();
  }
}
