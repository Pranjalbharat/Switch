import 'dart:async';


import 'package:flame/game.dart';
import 'package:switch_off/components/background.dart';
import 'package:switch_off/components/bed.dart';
import 'package:switch_off/components/borderline.dart';

import 'package:switch_off/components/door.dart';
import 'package:switch_off/components/screen.dart';


class SwitchGame extends FlameGame{
  late Bed bed;
  late Background background;
  late Screen screen;
  late BorderLine borderline;
  late Door door;

  
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
 
    startDayNightCycle();
  }

  void startDayNightCycle() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      bed.toggleDayNight();
      background.toggleDayNight(); 
      door.toggleDayNight();
     // Toggle between day and night every 5 seconds
    });
  }
}