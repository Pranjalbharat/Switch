import 'dart:async';
// import 'dart:html';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:switch_off/Ball/ball.dart';
import 'package:switch_off/components/background.dart';
import 'package:switch_off/components/bulb.dart';
import 'package:switch_off/components/config.dart';
import 'package:switch_off/components/lamp_right.dart';
import 'package:switch_off/components/screen.dart';
import 'package:switch_off/components/lamp_left.dart';
import 'package:switch_off/components/switch.dart';
import 'package:switch_off/components/window_left.dart';
import 'package:switch_off/components/window_right.dart';


class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(game: SwitchGame())
    );
  }
}




class SwitchGame extends FlameGame with PanDetector, KeyboardEvents {
SwitchGame()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  double get width => size.x;
  double get height => size.y;


  late Background background;
  late Screen screen;


  late Lamp lamp;
  late Lamp2 lamp2;
  late WindowL windowl;
  late WindowR windowr;
  late Bulb bulb;
  late SwitchOn _switch;
  bool isDay = true;
  double timeSinceLastToggle = 0.0;
  double toggleDuration = 5.0;




  late Ball ball;


  @override
  Future<void> onLoad() async {
    await super.onLoad();
   
  camera.viewfinder.anchor = Anchor.topLeft;
  background = Background();
  world.add(background);
    screen = Screen();
    world.add(screen);

bulb=Bulb();
world.add(bulb);


  lamp=Lamp();
  world.add(lamp);
  lamp2=Lamp2();
  world.add(lamp2);
  windowl=WindowL();
  world.add(windowl);
  windowr=WindowR();
  world.add(windowr);
 


  
    _switch=SwitchOn();
    world.add(_switch);
    print(width);
    print(height);
  
    ball = Ball();
    world.add(ball..position = Vector2((size.x / 2) + 50, (size.y / 2) + 100));

  }

  @override
  void update(double dt) {
    super.update(dt);

 
    timeSinceLastToggle += dt;

  
    if (timeSinceLastToggle >= toggleDuration) {
      startDayNightCycle();
      timeSinceLastToggle = 0.0; 
    }
  }



  void startDayNightCycle() {
  
      // bed.toggleDayNight();
      background.toggleDayNight();
      // door.toggleDayNight();
      lamp.toggleDayNight();
      lamp2.toggleDayNight();
      windowl.toggleDayNight();
      windowr.toggleDayNight();
      bulb.toggleDayNight();
      _switch.toggleDayNight();
  
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
