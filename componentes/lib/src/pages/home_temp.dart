import 'package:flutter/material.dart';

class HomeTempPage extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Componente Temp')),
        body: ListView(
          // children: _crearItems(),
          children: _crearItemsCorto(),
        ));
  }

  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(title: Text(opt));

      lista..add(tempWidget)..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorto() {
    return opciones
        .map((opt) => Column(
              children: [
                ListTile(
                  title: Text(opt),
                  subtitle: Text('Subtítulo $opt'),
                  leading: Icon(Icons.account_circle),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                Divider()
              ],
            ))
        .toList();
  }
}
