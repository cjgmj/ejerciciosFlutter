import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  final List<PinterestButton> items;

  PinterestMenu(
      {this.mostrar = true,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.black,
      this.inactiveColor = Colors.blueGrey,
      @required this.items});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _MenuModel(),
        child: AnimatedOpacity(
          opacity: (mostrar) ? 1 : 0,
          duration: Duration(milliseconds: 250),
          child: Builder(builder: (context) {
            final menuModel = Provider.of<_MenuModel>(context, listen: false);

            menuModel.backgroundColor = backgroundColor;
            menuModel.activeColor = activeColor;
            menuModel.inactiveColor = inactiveColor;

            return _PinterestMenuBackground(child: _MenuItems(items));
          }),
        ));
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  _PinterestMenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
        child: child,
        width: 250,
        height: 60,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(100)),
            boxShadow: <BoxShadow>[
              BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
            ]));
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length,
          (index) => _PinterestMenuButton(index, menuItems[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final menuModel = Provider.of<_MenuModel>(context);

    return GestureDetector(
        onTap: () {
          Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
              index;
          item.onPressed();
        },
        // Añadido porque en algunos dispositivos
        // no funciona bien el onTap
        behavior: HitTestBehavior.translucent,
        child: Container(
            child: Icon(item.icon,
                size: menuModel.itemSeleccionado == index ? 35 : 25,
                color: menuModel.itemSeleccionado == index
                    ? menuModel.activeColor
                    : menuModel.inactiveColor)));
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int itemSeleccionado) {
    this._itemSeleccionado = itemSeleccionado;
    notifyListeners();
  }

  Color get backgroundColor => this._backgroundColor;

  set backgroundColor(Color backgroundColor) {
    this._backgroundColor = backgroundColor;
  }

  Color get activeColor => this._activeColor;

  set activeColor(Color activeColor) {
    this._activeColor = activeColor;
  }

  Color get inactiveColor => this._inactiveColor;

  set inactiveColor(Color inactiveColor) {
    this._inactiveColor = inactiveColor;
  }
}
