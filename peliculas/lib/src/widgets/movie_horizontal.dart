import 'package:flutter/material.dart';

import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        // print('Cargar siguientes películas');
        siguientePagina();
      }

      if (_pageController.position.pixels <=
          _pageController.position.minScrollExtent + 80) {
        _pageController.position.animateTo(_screenSize.width * 0.3,
            duration: Duration(milliseconds: 600),
            curve: Curves.linearToEaseOut);
      }
    });

    return Container(
        height: _screenSize.height * 0.25,
        child: PageView.builder(
            pageSnapping: false,
            // children: _tarjetas(context),
            itemCount: peliculas.length,
            itemBuilder: (context, index) =>
                _tarjeta(context, peliculas[index]),
            controller: _pageController));
  }

  Widget _tarjeta(BuildContext context, Pelicula pelicula) {
    final tarjeta = Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(children: <Widget>[
        Hero(
          tag: pelicula.id,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(pelicula.getPosterImg()),
                fit: BoxFit.cover,
                height: 160),
          ),
        ),
        SizedBox(height: 5),
        Text(
          pelicula.title,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.caption,
        )
      ]),
    );

    return GestureDetector(
        child: tarjeta,
        onTap: () {
          // print('Título: ${pelicula.title}');

          Navigator.pushNamed(context, 'detalle', arguments: pelicula);
        });
  }

  // List<Widget> _tarjetas(BuildContext context) {
  //   return peliculas.map((pelicula) {
  //     return _tarjeta(context, pelicula);
  //   }).toList();
  // }
}
