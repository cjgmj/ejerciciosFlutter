import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:animate_do/animate_do.dart';

import 'package:music_player/src/helpers/helpers.dart';
import 'package:music_player/src/models/audioplayer_model.dart';

import 'package:music_player/src/widgets/custom_appbar.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Background(),
        Column(
          children: <Widget>[
            CustomAppBar(),
            ImagenDiscoDuracion(),
            TituloPlay(),
            Expanded(child: Lyrics())
          ],
        ),
      ],
    ));
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: screenSize.height * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.center,
              colors: <Color>[Color(0xff33333E), Color(0xff201E28)])),
    );
  }
}

class Lyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();
    return Container(
        child: ListWheelScrollView(
            physics: BouncingScrollPhysics(),
            itemExtent: 42,
            diameterRatio: 1.5,
            children: lyrics
                .map((linea) => Text(linea,
                    style: TextStyle(
                        fontSize: 20, color: Colors.white.withOpacity(0.6))))
                .toList()));
  }
}

class TituloPlay extends StatefulWidget {
  @override
  _TituloPlayState createState() => _TituloPlayState();
}

class _TituloPlayState extends State<TituloPlay>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  AnimationController playAnimation;

  @override
  void initState() {
    this.playAnimation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    super.initState();
  }

  @override
  void dispose() {
    this.playAnimation.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        margin: EdgeInsets.only(top: 40),
        child: Row(children: <Widget>[
          Column(children: <Widget>[
            Text('Far away',
                style: TextStyle(
                    fontSize: 30, color: Colors.white.withOpacity(0.8))),
            Text('Breaking Benjamin',
                style: TextStyle(
                    fontSize: 15, color: Colors.white.withOpacity(0.5)))
          ]),
          Spacer(),
          FloatingActionButton(
              elevation: 0,
              highlightElevation: 0,
              child: AnimatedIcon(
                  icon: AnimatedIcons.play_pause, progress: this.playAnimation),
              backgroundColor: Color(0xffF8CB51),
              onPressed: () {
                final audioPlayerModel =
                    Provider.of<AudioPlayerModel>(context, listen: false);

                if (this.isPlaying) {
                  this.playAnimation.reverse();
                  this.isPlaying = false;
                  audioPlayerModel.controller.stop();
                } else {
                  this.playAnimation.forward();
                  this.isPlaying = true;
                  audioPlayerModel.controller.repeat();
                }
              })
        ]));
  }
}

class ImagenDiscoDuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        margin: EdgeInsets.only(top: 70),
        child: Row(children: <Widget>[
          // Disco
          ImagenDisco(),
          SizedBox(width: 40),

          // Barra progreso
          BarraProgreso(),
          SizedBox(width: 20)
        ]));
  }
}

class BarraProgreso extends StatelessWidget {
  final estilo = TextStyle(color: Colors.white.withOpacity(0.4));
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('00:00', style: estilo),
          SizedBox(height: 10),
          Stack(
            children: <Widget>[
              Container(
                width: 3,
                height: 230,
                color: Colors.white.withOpacity(0.1),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 3,
                  height: 100,
                  color: Colors.white.withOpacity(0.8),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Text('00:00', style: estilo),
        ],
      ),
    );
  }
}

class ImagenDisco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);

    return Container(
      padding: EdgeInsets.all(20),
      width: 250,
      height: 250,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: Stack(alignment: Alignment.center, children: <Widget>[
            SpinPerfect(
                duration: Duration(seconds: 10),
                animate: false,
                infinite: true,
                manualTrigger: true,
                controller: (animationController) =>
                    audioPlayerModel.controller = animationController,
                child: Image(image: AssetImage('assets/aurora.jpg'))),
            Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(100))),
            Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                    color: Color(0xff1C1C25),
                    borderRadius: BorderRadius.circular(100)))
          ])),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: <Color>[Color(0xff484750), Color(0xff1E1C24)])),
    );
  }
}
