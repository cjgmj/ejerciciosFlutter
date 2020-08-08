import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Avatar Page'),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://lh5.ggpht.com/-O97UXKgJn2g/TmspedhwbjI/AAAAAAAAJcY/qUtlXcduCwA/s72-c/image%25255B3%25255D.png'),
                  radius: 30),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                  child: Text('JD'), backgroundColor: Colors.brown),
            )
          ],
        ),
        body: Center(
            child: FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                fadeInDuration: Duration(milliseconds: 200),
                image: NetworkImage(
                    'https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg'))));
  }
}
