import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:design_intermediate/src/routes/routes.dart';

import 'package:design_intermediate/src/theme/theme.dart';

class LauncherTabletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
        appBar: AppBar(
            title: Text('Diseños en Flutter - Tablet'),
            backgroundColor: currentTheme.accentColor),
        drawer: _MenuPrincipal(),
        body: _ListaOpciones());
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) =>
            Divider(color: currentTheme.primaryColorLight),
        itemCount: pageRoutes.length,
        itemBuilder: (context, index) => ListTile(
            leading:
                FaIcon(pageRoutes[index].icon, color: currentTheme.accentColor),
            title: Text(pageRoutes[index].titulo),
            trailing:
                Icon(Icons.chevron_right, color: currentTheme.accentColor),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => pageRoutes[index].page));
            }));
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Drawer(
        child: Container(
            child: Column(children: <Widget>[
      SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: 200,
          child: CircleAvatar(
              backgroundColor: accentColor,
              child: Text('JD', style: TextStyle(fontSize: 50))),
        ),
      ),
      Expanded(child: _ListaOpciones()),
      ListTile(
        leading: Icon(Icons.lightbulb_outline, color: accentColor),
        title: Text('Dark Mode'),
        trailing: Switch.adaptive(
            value: appTheme.darkTheme,
            activeColor: accentColor,
            onChanged: (value) => appTheme.darkTheme = value),
      ),
      SafeArea(
        bottom: true,
        top: false,
        left: false,
        right: false,
        child: ListTile(
          leading: Icon(Icons.add_to_home_screen, color: accentColor),
          title: Text('Custom Theme'),
          trailing: Switch.adaptive(
              value: appTheme.customTheme,
              activeColor: accentColor,
              onChanged: (value) => appTheme.customTheme = value),
        ),
      )
    ])));
  }
}
