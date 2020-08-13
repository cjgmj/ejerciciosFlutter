import 'package:flutter/material.dart';

import 'package:peliculas/src/providers/peliculas_provider.dart';

import 'package:peliculas/src/models/pelicula_model.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';
  final peliculasProvider = new PeliculasProvider();

  final peliculas = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam!',
    'Ironman',
    'Capitán América',
    'Superman',
    'Ironman 2',
    'Ironman 3'
  ];
  final peliculasRecientes = ['Spiderman', 'Capitán América'];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro AppBar. Ej: Icono para limpiar texto
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return Center(
        child: Container(
            height: 100,
            width: 100,
            color: Colors.blueAccent,
            child: Text(seleccion)));
  }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // Son las sugerencias que aparecen cuando la
  //   // persona escribe
  //   final listaSugerida = (query.isEmpty)
  //       ? peliculasRecientes
  //       : peliculas
  //           .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
  //           .toList();

  //   return ListView.builder(
  //       itemCount: listaSugerida.length,
  //       itemBuilder: (context, index) {
  //         return ListTile(
  //             leading: Icon(Icons.movie),
  //             title: Text(listaSugerida[index]),
  //             onTap: () {
  //               seleccion = listaSugerida[index];
  //               showResults(context);
  //             });
  //       });
  // }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la
    // persona escribe
    if (query.isEmpty) return Container();

    return FutureBuilder(
        future: peliculasProvider.buscarPelicula(query),
        builder:
            (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
          if (snapshot.hasData) {
            final peliculas = snapshot.data;

            return ListView(
                children: peliculas.map((pelicula) {
              return ListTile(
                  leading: FadeInImage(
                      placeholder: AssetImage('assets/img/no-image.jpg'),
                      image: NetworkImage(pelicula.getPosterImg()),
                      width: 50,
                      fit: BoxFit.contain),
                  title: Text(pelicula.title),
                  subtitle: Text(pelicula.originalTitle),
                  onTap: () {
                    close(context, null);
                    pelicula.uniqueId = '';
                    Navigator.pushNamed(context, 'detalle',
                        arguments: pelicula);
                  });
            }).toList());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
