import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:design_intermediate/src/theme/theme.dart';
import 'package:design_intermediate/src/pages/launcher_page.dart';
import 'package:design_intermediate/src/pages/launcher_tablet_page.dart';

void main() => runApp(
    ChangeNotifierProvider(create: (_) => new ThemeChanger(2), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
        theme: currentTheme,
        debugShowCheckedModeBanner: false,
        title: 'Diseños App',
        home: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
          // print('Orientarion $orientation');

          // return Container(child: LauncherPage());

          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        }));
  }
}
