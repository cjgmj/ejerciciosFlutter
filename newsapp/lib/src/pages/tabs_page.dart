import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => new _NavegacionModel(),
        child: Scaffold(body: _Paginas(), bottomNavigationBar: _Navegacion()));
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), title: Text('Para ti')),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), title: Text('Encabezados')),
        ]);
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
        // physics: BouncingScrollPhysics(),
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(color: Colors.red),
          Container(color: Colors.green)
        ]);
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;

    // Notifica de los cambios a los Widgets suscritos
    notifyListeners();
  }
}
