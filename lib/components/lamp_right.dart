import 'package:flame/components.dart';
import 'package:switch_off/game.dart';

class Lamp2 extends SpriteComponent with HasGameRef<SwitchGame>{
  bool isNight = false; 
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Load the image for the Angry Bird sprite
    sprite = await Sprite.load('lamp_day_on.png'); 
    size = Vector2(106,165); // Adjust size as needed
    position = Vector2(game.size.x/2+570,game.size.y/2-460); 
    anchor=Anchor.center;
  }

  // void switchToNight() async {
  //   final nightSprite = await Sprite.load('lamp_night_on.png');
  //   sprite = nightSprite;
  //   isNight=true;
  
  // }

  //     void switchToLightOffDay() async {
  //   final nightSprite = await Sprite.load('lamp_day_off.png');
  //   sprite = nightSprite;
  //   isNight = true;
  // }

  //     void switchToLightOnDay() async {
  //   final nightSprite = await Sprite.load('lamp_day_on.png');
  //   sprite = nightSprite;
  //   // isNight = true;
  // }

  //   void switchToDay() async {
  //   final daySprite = await Sprite.load('lamp_day_on.png');
  //   sprite = daySprite;
  //   isNight = false;
  
  // }

  //   void toggleDayNight() {
  //   if (isNight) {
  //     switchToDay();
  //   } else {
  //     switchToNight();
  //   }
  // }

  
      void switchToLightOffDay() async {
    final nightSprite = await Sprite.load('lamp_day_off.png');
    sprite = nightSprite;
    // isNight = true;
  }

    void switchToLightOffNight() async {
    final nightSprite = await Sprite.load('lamp_night_off.png');
    sprite = nightSprite;
    // isNight = true;
  }

    void switchToLightOnDay() async {
    final nightSprite = await Sprite.load('lamp_day_on.png');
    sprite = nightSprite;
    // isNight = true;
  }

    void switchToLightOnNight() async {
    final nightSprite = await Sprite.load('lamp_night_on.png');
    sprite = nightSprite;
    // isNight = true;
  }

  void switchToNight() async {
    final nightSprite = await Sprite.load('lamp_night_on.png');
    sprite = nightSprite;
    isNight=true;
  
  }

  //   void switchToLightOffDay() async {
  //   final nightSprite = await Sprite.load('lamp_day_off.png');
  //   sprite = nightSprite;
  //   // isNight = true;
  // }

  //     void switchToLightOnDay() async {
  //   final nightSprite = await Sprite.load('lamp_day_on.png');
  //   sprite = nightSprite;
  //   // isNight = true;
  // }

    void switchToDay() async {
    final daySprite = await Sprite.load('lamp_day_on.png');
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
}

