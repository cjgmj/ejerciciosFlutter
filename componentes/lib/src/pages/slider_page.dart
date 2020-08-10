import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Sliders')),
        body: Container(
            // padding: EdgeInsets.only(top: 50),
            child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ],
        )));
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño de la imagen',
        // divisions: 20,
        value: _valorSlider,
        min: 10,
        max: 400,
        onChanged: _bloquearCheck
            // bloquea el slider
            ? null
            : (valor) {
                setState(() {
                  // print(valor);
                  _valorSlider = valor;
                });
              });
  }

  Widget _crearCheckBox() {
    // return Checkbox(
    //     value: _bloquearCheck,
    //     onChanged: (valor) {
    //       setState(() {
    //         _bloquearCheck = valor;
    //       });
    //     });

    return CheckboxListTile(
        title: Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }

  Widget _crearImagen() {
    return FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
        image: NetworkImage(
            'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ce40bded-2727-4182-ad87-5583e7317c09/d9xd4ff-fcb069e3-8ba6-42d0-8be1-ee76e2f7806e.png/v1/fill/w_1024,h_1154,strp/captain_america__civil_war___iron_man_01_png_by_imangelpeabody_d9xd4ff-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3siaGVpZ2h0IjoiPD0xMTU0IiwicGF0aCI6IlwvZlwvY2U0MGJkZWQtMjcyNy00MTgyLWFkODctNTU4M2U3MzE3YzA5XC9kOXhkNGZmLWZjYjA2OWUzLThiYTYtNDJkMC04YmUxLWVlNzZlMmY3ODA2ZS5wbmciLCJ3aWR0aCI6Ijw9MTAyNCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19._l2w3ETI4Gh3D0kdLy42wRWDdNHWpmtFKpWWJuoQszQ'),
        width: _valorSlider,
        fit: BoxFit.contain);
  }
}
