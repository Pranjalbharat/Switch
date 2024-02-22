import 'package:flame/components.dart';
import 'package:switch_off/game.dart';
// import 'package:flutter/material.dart';

class Bulb extends SpriteComponent with HasGameRef<SwitchGame>{
    bool isNight = false; 
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Load the image for the Angry Bird sprite
    sprite = await Sprite.load('bulb_day_on.png'); // Adjust the path to your image
    size = Vector2(124,171);// Adjust size as needed
    position = Vector2((game.size.x/2),(game.size.y/2-500));  
    anchor=Anchor.center;
  }

  void switchToLightOffDay() async {
    final nightSprite = await Sprite.load('bulb_day_off.png');
    sprite = nightSprite;
    // isNight = true;
  }

    void switchToLightOffNight() async {
    final nightSprite = await Sprite.load('bulb_night_off.png');
    sprite = nightSprite;
    // isNight = true;
  }

    void switchToLightOnDay() async {
    final nightSprite = await Sprite.load('bulb_day_on.png');
    sprite = nightSprite;
    // isNight = true;
  }

    void switchToLightOnNight() async {
    final nightSprite = await Sprite.load('bulb_night_on.png');
    sprite = nightSprite;
    // isNight = true;
  }

  void switchToNight() async {
    final nightSprite = await Sprite.load('bulb_night_on.png');
    sprite = nightSprite;
    isNight=true;
  }

    void switchToDay() async {
    final daySprite = await Sprite.load('bulb_day_on.png');
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
  
  // void switchToLightOnNight() {

  // }



}