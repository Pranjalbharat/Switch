import 'dart:async';


import 'package:flame/game.dart';
import 'package:switch_off/components/background.dart';
import 'package:switch_off/components/bed.dart';
import 'package:switch_off/components/borderline.dart';

import 'package:switch_off/components/door.dart';
import 'package:switch_off/components/lamp_right.dart';
import 'package:switch_off/components/screen.dart';
import 'package:switch_off/components/lamp_left.dart';


class SwitchGame extends FlameGame{
  late Bed bed;
  late Background background;
  late Screen screen;
  late BorderLine borderline;
  late Door door;
  late Lamp lamp;
  late Lamp2 lamp2;

  
    @override
  Future<void> onLoad() async {
    await super.onLoad();
   
  background=Background();
  add(background);
   screen=Screen();
    add(screen);
borderline=BorderLine();
add(borderline);
door=Door();
add(door);

    bed=Bed();
  add(bed);
  lamp=Lamp();
  add(lamp);
  lamp2=Lamp2();
  add(lamp2);
 
    startDayNightCycle();
  }

  void startDayNightCycle() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      bed.toggleDayNight();
      background.toggleDayNight(); 
      door.toggleDayNight();
      lamp.toggleDayNight();
      lamp2.toggleDayNight();
     // Toggle between day and night every 5 seconds
    });
  }
}