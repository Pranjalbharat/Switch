import 'package:flame/components.dart';
import 'package:switch_off/game.dart';
// import 'package:flutter/material.dart';


class SwitchOn extends SpriteComponent with HasGameRef<SwitchGame>{
    bool isNight = false; 
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Load the image for the Angry Bird sprite
    sprite = await Sprite.load('switch_day.png'); // Adjust the path to your image
    size = Vector2(730,500);// Adjust size as needed
    position = Vector2(530,260); 
    anchor=Anchor.center;
  }

  void switchToNight() async {
    final nightSprite = await Sprite.load('switch_night.PNG');
    sprite = nightSprite;
    isNight=true;
  }

    void switchToDay() async {
    final daySprite = await Sprite.load('switch_day.png');
    sprite = daySprite;
    isNight = false;
  }

    void toggleDayNight() {
    if (isNight) {
      switchToDay();
    } else {
      switchToNight();
    }
  }


}