import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _playing = false;

  Duration _songDuration = new Duration(milliseconds: 0);
  Duration _current = new Duration(milliseconds: 0);

  String get songTotalDuration => this.printDuration(this._songDuration);
  String get currentSecond => this.printDuration(this._current);

  double get porcentaje => (this.songDuration.inSeconds > 0)
      ? this._current.inSeconds / this._songDuration.inSeconds
      : 0;

  AnimationController _controller;
  set controller(AnimationController controller) {
    this._controller = controller;
  }

  AnimationController get controller => this._controller;

  bool get playing => this._playing;

  set playing(bool playing) {
    this._playing = playing;
    notifyListeners();
  }

  Duration get songDuration => this._songDuration;

  set songDuration(Duration songDuration) {
    this._songDuration = songDuration;
    notifyListeners();
  }

  Duration get current => this._current;

  set current(Duration current) {
    this._current = current;
    notifyListeners();
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}
