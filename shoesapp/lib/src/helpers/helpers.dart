import 'package:flutter/material.dart';

import 'package:flutter/services.dart' as services;

void cambiarStatusLight() {
  services.SystemChrome.setSystemUIOverlayStyle(services
      .SystemUiOverlayStyle.light
      .copyWith(statusBarColor: Colors.transparent));
}

void cambiarStatusDark() {
  services.SystemChrome.setSystemUIOverlayStyle(services
      .SystemUiOverlayStyle.dark
      .copyWith(statusBarColor: Colors.transparent));
}
