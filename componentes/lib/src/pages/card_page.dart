import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards Page')),
      body: ListView(padding: EdgeInsets.all(10),
          // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: <Widget>[
            _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
            SizedBox(height: 30),
            _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
            SizedBox(height: 30),
            _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
            SizedBox(height: 30),
            _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
            SizedBox(height: 30),
            _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
            SizedBox(height: 30),
            _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
            SizedBox(height: 30),
            _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2()
          ]),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Soy el título de esta tarjeta'),
            subtitle: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(child: Text('Cancelar'), onPressed: () {}),
              FlatButton(child: Text('Ok'), onPressed: () {})
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      // final card = Card(
      // Evita que el contenido rebase los bordes de la tarjeta
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 300,
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/c/c8/Untersberg_Mountain_Salzburg_Austria_Landscape_Photography_%28256594075%29.jpeg')),

          // Image(
          //     image: NetworkImage(
          //         'https://upload.wikimedia.org/wikipedia/commons/c/c8/Untersberg_Mountain_Salzburg_Austria_Landscape_Photography_%28256594075%29.jpeg')),

          Container(
              padding: EdgeInsets.all(10), child: Text('Texto de la imagen'))
        ],
      ),
    );

    return Container(
        child: ClipRRect(child: card, borderRadius: BorderRadius.circular(30)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(2, 10)),
            ]));
  }
}
