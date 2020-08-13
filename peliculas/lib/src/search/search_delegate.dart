import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';

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

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la
    // persona escribe
    final listaSugerida = (query.isEmpty)
        ? peliculasRecientes
        : peliculas
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
        itemCount: listaSugerida.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.movie),
              title: Text(listaSugerida[index]),
              onTap: () {
                seleccion = listaSugerida[index];
                showResults(context);
              });
        });
  }
}
