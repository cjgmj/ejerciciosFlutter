import 'package:flutter/material.dart';

import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculaDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: CustomScrollView(
      // Son los children
      slivers: <Widget>[
        _crearAppbar(pelicula),
        SliverList(
            // Son los children
            delegate: SliverChildListDelegate([
          SizedBox(height: 10),
          _posterTitulo(context, pelicula),
          _descripcion(pelicula)
        ]))
      ],
    ));
  }

  Widget _crearAppbar(Pelicula pelicula) {
    return SliverAppBar(
        elevation: 2,
        backgroundColor: Colors.indigo,
        expandedHeight: 200,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(pelicula.title,
                style: TextStyle(color: Colors.white, fontSize: 16)),
            background: FadeInImage(
                placeholder: AssetImage('assets/img/loading.gif'),
                image: NetworkImage(pelicula.getBackgroundImg()),
                fadeInDuration: Duration(milliseconds: 200),
                fit: BoxFit.cover)));
  }

  Widget _posterTitulo(BuildContext context, Pelicula pelicula) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                  image: NetworkImage(pelicula.getPosterImg()), height: 150)),
          SizedBox(width: 20),
          Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Text(pelicula.title,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis),
                Text(pelicula.originalTitle,
                    style: Theme.of(context).textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis),
                Row(children: <Widget>[
                  Icon(Icons.star_border),
                  Text(pelicula.voteAverage.toString(),
                      style: Theme.of(context).textTheme.subtitle1)
                ])
              ]))
        ]));
  }

  Widget _descripcion(Pelicula pelicula) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Text(pelicula.overview, textAlign: TextAlign.justify));
  }
}
