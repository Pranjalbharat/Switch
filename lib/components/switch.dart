import 'dart:math';
import 'package:flame/components.dart';
import 'package:switch_off/game.dart';
// import 'package:flutter/material.dart';
class SwitchOn extends SpriteComponent with HasGameRef<SwitchGame> {
  SwitchOn()
      : super(
          size: Vector2(148, 148),
          anchor: Anchor.topLeft,
        );
  bool isNight = false;
  bool isLight=true;
  late List<Vector2> switchPositions;
  late Random random;
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Load the image for the Angry Bird sprite
    sprite =
            await Sprite.load('switch_day_on.png'); // Adjust the path to your image
    size = Vector2(148, 148); // Adjust size as needed
    position = Vector2(game.size.x / 2, game.size.y / 2-100);

    switchPositions = [
      Vector2(game.size.x / 2 + 600, game.size.y / 2 - 100),
      Vector2(game.size.x / 2 + 400, game.size.y / 2 - 300),
      Vector2(game.size.x / 2 + 300, game.size.y / 2 - 100),
      Vector2(game.size.x / 2 + 180, game.size.y / 2 - 450),
      Vector2(game.size.x / 2 - 150, game.size.y / 2 - 470),
      Vector2(game.size.x / 2 - 500, game.size.y / 2 - 497),
      Vector2(game.size.x / 2 - 400, game.size.y / 2 - 300),
      Vector2(game.size.x / 2 - 650, game.size.y / 2 + 50),
      Vector2(game.size.x / 2 - 680, game.size.y / 2 - 180),
      // Vector2(300, 300),
      // Add more positions as needed
    ];

    random = Random();
  }

  void changeSwitchPosition() {
    int index = random.nextInt(switchPositions.length);
    position = switchPositions[index];
  }

  // void switchToLightOffDay() async {
  //   final nightSprite = await Sprite.load('switch_day_off.png');
  //   sprite = nightSprite;
  //   // isNight = true;
  // }

  //     void switchToLightOnDay() async {
  //   final nightSprite = await Sprite.load('switch_day_on.png');
  //   sprite = nightSprite;
  //   // isNight = true;
  // }

  // void switchToLightOffNight() async {
  //     final nightSprite = await Sprite.load('switch_night_off.png');
  //   sprite = nightSprite;
  //   // isNight = false;
  // }

    void switchToLightOffDay() async {
    final nightSprite = await Sprite.load('switch_day_off.png');
    sprite = nightSprite;
    // isNight = true;
  }

    void switchToLightOffNight() async {
    final nightSprite = await Sprite.load('switch_night_off.png');
    sprite = nightSprite;
    // isNight = true;
  }

    void switchToLightOnDay() async {
    final nightSprite = await Sprite.load('switch_day_on.png');
    sprite = nightSprite;
    // isNight = true;
  }

    void switchToLightOnNight() async {
    final nightSprite = await Sprite.load('switch_night_on.png');
    sprite = nightSprite;
    // isNight = true;
  }

  void switchToNight() async {
    final daySprite = await Sprite.load('switch_night_on.png');
    sprite = daySprite; 
    isNight=true;
  }

   void switchToDay() async {
    final daySprite = await Sprite.load('switch_day_on.png');
    sprite = daySprite;
    isNight=false;
  }


  void toggleDayNight() {
    if (isNight) {
      switchToDay();
    } else {
      switchToNight();
    }
  }

    void toggleLightOff() {
    if (isNight) {
      switchToLightOffNight();
    } else {
      switchToLightOffDay();
    }
  }

  void toggleLightOn() {
    if (isNight) {
      switchToLightOnNight();
    } else {
      switchToLightOnDay();
    }
  }
}
