import 'dart:async';
// import 'dart:html';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:switch_off/Ball/ball.dart';
import 'package:switch_off/Ball/ball_sprite.dart';
import 'package:switch_off/Cat%20Component/cat.dart';
import 'package:switch_off/components/background.dart';
import 'package:switch_off/components/bulb.dart';
import 'package:switch_off/components/chance_ball.dart';
import 'package:switch_off/components/config.dart';
import 'package:switch_off/components/lamp_right.dart';
import 'package:switch_off/components/overlay_menu.dart';
import 'package:switch_off/components/screen.dart';
import 'package:switch_off/components/lamp_left.dart';
import 'package:switch_off/components/switch.dart';
import 'package:switch_off/components/window_left.dart';
import 'package:switch_off/components/window_right.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(game: SwitchGame(context: context)), // pass context here
    );
  }
}

class SwitchGame extends FlameGame with PanDetector, KeyboardEvents {
  final BuildContext context;
  SwitchGame({required this.context})
      : super(
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  double get width => size.x;
  double get height => size.y;
  // late Background background;
  late Screen screen;
  late Cat cat;

  Lamp lamp = Lamp();
  Lamp2 lamp2 = Lamp2();
  WindowL windowl = WindowL();
  WindowR windowr = WindowR();
  Bulb bulb = Bulb();
  SwitchOn _switch = SwitchOn();
  ChanceBall _chanceBall = ChanceBall();
  bool isDay = true;
  double timeSinceLastToggle = 0.0;
  double toggleDuration = 5.0;
  double timeSinceLastSwitch = 0.0;
  double switchChange = 20.0;
  int _score = 0;
  int chancesLeft = 3;
  List<ChanceBall> chanceBalls = [];
  Background background = Background();
  bool reset = false;

  void increaseScore() {
    _score += 10;
    print('Score: $_score');
  }

  late BallSprite ball;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    camera.viewfinder.anchor = Anchor.topLeft;

    world.add(background);
    // screen = Screen();
    // world.add(screen);

    for (int i = 0; i <= 2; i++) {
      _chanceBall = ChanceBall();
      world.add(_chanceBall
        ..position =
            Vector2(size.x / 2 - 1230 + (i + 1) * 110, size.y / 2 - 510));
      chanceBalls.add(_chanceBall);
    }
    bulb = Bulb();
    world.add(bulb);
    lamp = Lamp();
    world.add(lamp);
    lamp2 = Lamp2();
    world.add(lamp2);
    windowl = WindowL();
    world.add(windowl);
    windowr = WindowR();
    world.add(windowr);
    _switch = SwitchOn();
    world.add(_switch);

    cat = Cat();
    world.add(cat);

    ball = BallSprite();
    world.add(ball..position = Vector2((size.x / 2) + 50, (size.y / 2) + 100));
  }

  @override
  void update(double dt) {
    super.update(dt);

    // timeSinceLastToggle += dt;
    // timeSinceLastSwitch += dt;

    // if (timeSinceLastToggle >= toggleDuration) {
    //   startDayNightCycle();
    //   timeSinceLastToggle = 0.0;
    // }
    // // if (timeSinceLastSwitch >= switchChange) {
    //   _switch.changeSwitchPosition();
    //   timeSinceLastSwitch = 0.0;
    // }
// print("running");
    // void setvalue(){
    // reset=true;
    // // print(reset);
    //   }

    // print(reset);
    if (reset) {
      // print(reset);
      startDayNightCycle();
      resetAllBallsToRed();
      reset = false;
    }
  }

  void startDayNightCycle() {
    // bed.toggleDayNight();
    background.toggleDayNight();
    // door.toggleDayNight();
    lamp.toggleDayNight();
    lamp2.toggleDayNight();
    // windowl.toggleDayNight();
    // windowr.toggleDayNight();
    bulb.toggleDayNight();
    _switch.toggleDayNight();
  }

  void startLightToggle() {
    _switch.toggleLightOff();
    lamp.toggleLightOff();
    lamp2.toggleLightOff();
    ball.switchToLightOffDay();
    bulb.toggleLightOff();
    background.toggleLightOff();
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    Vector2 direction = info.delta.global;
    ball.move(direction);
    // ball.move(info.delta.global);
    // ball.throwBall(velocity, direction);
    ball.throwBall(direction);
  }

  // returns true if ball hit the area around switch.
  bool checkCollision(Vector2 hitPosition) {
    Vector2 switchPosition = _switch.position;

    double distance = hitPosition.distanceTo(switchPosition);
    print(distance);

    if (distance <= 100) {
      increaseScore();
      startLightToggle();

      Future.delayed(Duration(seconds: 3), () {
        callback();
        resetAllBallsToRed();
        _switch.changeSwitchPosition();
      });

      // Navigate to OverlayMenuPage
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => OverlayMenuPage(score: _score,)),
      // );
      return true; // You may change this return value according to your needs
    } else {
      if (chancesLeft > 0) {
        handleChanceBallAppearance();
        chancesLeft--; // Decrease the number of chances left
      }
      if (chancesLeft == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OverlayMenuPage(
                    score: _score,
                    reset: setvalue,
                  )),
        );
      }
      return false;
    }
    // return distance <= 100;
  }

  void resetAllBallsToRed() {
    // print("DONE");
    // Iterate over all ChanceBall instances and reset them to red
    for (ChanceBall ball in chanceBalls) {
      ball.resetToRed();
    }
    chancesLeft = 3;
  }

  void setvalue() {
    reset = true;
    // print(reset);
  }

  void resetGame() {
    // ball.position = Vector2((size.x / 2) + 50, (size.y / 2) + 100);
    // ball.radius = 100;
    // ball.isThrowed = false;
    // ball.totalTime = 0;
    // ball.mass = 1;
    // ball.timeY = 0;
    // ball.heightY = 0;
    // ball.gravity = 10;
    // if (ball.isStampAdded) {
    //   ball.stamp.removeFromParent();
    // }
    // ball.isStampAdded = false;
    // Reset other game variables as needed

    ball.position = Vector2((size.x / 2) + 50, (size.y / 2) + 100);
    ball.isThrowed = false;
    ball.totalTime = 0;
    ball.mass = 1;
    ball.timeY = 0;
    ball.heightY = 0;
    ball.gravity = 10;
    if (ball.isStampAdded) {
      ball.stamp.removeFromParent();
    }
    ball.isStampAdded = false;
    ball.size = Vector2(250, 250);
    ball.diameter = 250;
    ball.timeToBounce = false;
    ball.bounceTime = 0;
    ball.countBounceTime = false;
    // Reset other game variables as needed
  }

  void callback() {
    bulb.toggleLightOn();
    _switch.toggleLightOn();
    lamp.toggleLightOn();
    lamp2.toggleLightOn();
    background.toggleLightOn();
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

  void handleChanceBallAppearance() {
    if (chancesLeft > 0) {
      // Find the index of the ChanceBall to change its image
      int ballIndex = 3 -
          chancesLeft; // Adjust the index based on the number of chances left

      // Change the sprite image of the ball at the calculated index
      if (ballIndex >= 0 && ballIndex < chanceBalls.length) {
        // Change the sprite image of the ball to grey to indicate loss of chance
        chanceBalls[ballIndex].switchToGrey();
      }
    }
  }
}
