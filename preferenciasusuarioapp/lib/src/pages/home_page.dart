import 'package:flutter/material.dart';

import 'package:preferenciasusuarioapp/src/pages/settings_page.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Preferencias de Usuario'),
        ),
        drawer: _crearMenu(context),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Color secundario:'),
              Divider(),
              Text('Género:'),
              Divider(),
              Text('Nombre usuario:'),
              Divider(),
            ]));
  }

  Drawer _crearMenu(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu-img.jpg'),
                    fit: BoxFit.cover))),
        ListTile(
          leading: Icon(Icons.pages, color: Colors.blue),
          title: Text('Home'),
          onTap: () =>
              Navigator.pushReplacementNamed(context, HomePage.routeName),
        ),
        ListTile(
          leading: Icon(Icons.party_mode, color: Colors.blue),
          title: Text('Party mode'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.people, color: Colors.blue),
          title: Text('People'),
          onTap: () {},
        ),
        ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Settings'),
            onTap: () {
              // Cambiar la pantalla principal pudiendo volver a la anterior
              // Cierra el menú
              // Navigator.pop(context);

              // Navigator.pushNamed(context, SettingsPage.routeName);

              // Cambiar pantalla principal sin poder volver a la pantalla anterior
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            })
      ],
    ));
  }
}
