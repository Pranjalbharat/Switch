import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:switch_off/game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
Flame.device.fullScreen();
Flame.device.setLandscape();

  runApp(GameWidget(game: SwitchGame()));
}


