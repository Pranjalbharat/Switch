import 'dart:async';
import 'package:flame/components.dart';
import 'package:switch_off/game.dart';

class Background extends SpriteComponent with HasGameRef<SwitchGame> {
  bool isNight = false;
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Load the image for the Angry Bird sprite
    sprite = await Sprite.load(
        'backgroundWith_day.png'); 
   
      size = Vector2(game.width,game.height);
    anchor = Anchor.center;
    position = gameRef.size/2;
 
    print(size);
  }

  void switchToNight() async {
    final nightSprite = await Sprite.load('backgroundWith_night_on.png');
    sprite = nightSprite;
    isNight = true;
  }

  void switchToDay() async {
    final daySprite = await Sprite.load('backgroundWith_day.png');
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
