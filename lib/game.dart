import 'dart:async';
import 'dart:html';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:switch_off/Ball/ball.dart';
import 'package:switch_off/components/background.dart';
import 'package:switch_off/components/bed.dart';
import 'package:switch_off/components/borderline.dart';
import 'package:switch_off/components/bulb.dart';
import 'package:switch_off/components/door.dart';
import 'package:switch_off/components/lamp_right.dart';
import 'package:switch_off/components/screen.dart';
import 'package:switch_off/components/lamp_left.dart';
import 'package:switch_off/components/switch.dart';
import 'package:switch_off/components/window_left.dart';
import 'package:switch_off/components/window_right.dart';

class SwitchGame extends FlameGame with PanDetector, KeyboardEvents {
  late Bed bed;
  late Background background;
  late Screen screen;
  late BorderLine borderline;
  late Door door;
  late Lamp lamp;
  late Lamp2 lamp2;
  late WindowL windowl;
  late WindowR windowr;
  late Bulb bulb;
  late SwitchOn _switch;

  //ball
  late Ball ball;
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    background = Background();
    add(background);
    screen = Screen();
    add(screen);
borderline=BorderLine();
add(borderline);
door=Door();
add(door);
bulb=Bulb();
add(bulb);

    bed=Bed();
  add(bed);
  lamp=Lamp();
  add(lamp);
  lamp2=Lamp2();
  add(lamp2);
  windowl=WindowL();
  add(windowl);
  windowr=WindowR();
  add(windowr);
 
    borderline = BorderLine();
    add(borderline);
    door = Door();
    add(door);

    bed = Bed();
    add(bed);
    _switch=SwitchOn();
    add(_switch);
    

    // startDayNightCycle();

    // add ball
    ball = Ball();
    add(ball..position = Vector2((size.x / 2) + 50, (size.y / 2) + 100));

    startDayNightCycle();
  }

  void startDayNightCycle() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      bed.toggleDayNight();
      background.toggleDayNight();
      door.toggleDayNight();
      lamp.toggleDayNight();
      lamp2.toggleDayNight();
      windowl.toggleDayNight();
      windowr.toggleDayNight();
     // Toggle between day and night every 5 seconds

      bulb.toggleDayNight();
      _switch.toggleDayNight();
      // Toggle between day and night every 5 seconds
    });
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    double velocity = info.delta.global.length;
    Vector2 direction = info.delta.global;
    ball.move(info.delta.global);
    ball.throwBall(velocity, direction);
  }

  void resetGame() {
    ball.position = Vector2((size.x / 2) + 50, (size.y / 2) + 100);
    ball.radius = 50;
    ball.isThrowed = false;
    ball.totalTime = 0;
    ball.mass = 1;
    ball.timeY = 0;
    ball.heightY = 0;
    ball.gravity = 10;
    // Reset other game variables as needed
  }

  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isR = keysPressed.contains(LogicalKeyboardKey.keyR);

    if (isR) {
      resetGame();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}
