

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:switch_off/components/background.dart';
import 'package:switch_off/flame_splash_screen.dart';
import 'package:switch_off/game.dart';





import 'package:flutter/widgets.dart';





void main() {

  WidgetsFlutterBinding.ensureInitialized();
Flame.device.fullScreen();
Flame.device.setLandscape();
  //runApp( GameWidget(game: SwitchGame()))
  runApp(MyApp());
  ;} 

 



  