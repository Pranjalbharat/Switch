import 'package:flame/components.dart';
import 'package:switch_off/game.dart';

class Background extends SpriteComponent with HasGameRef<SwitchGame>{
  bool isNight = false; 
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Load the image for the Angry Bird sprite
    sprite = await Sprite.load('background_day.png'); // Adjust the path to your image
    // size = Vector2(300, 300); // Adjust size as needed
    // position = Vector2(200,400); 
    size = gameRef.size; 
    anchor=Anchor.center;
    position = gameRef.size / 2;
  }

  void switchToNight() async {
    final nightSprite = await Sprite.load('background_night.png');
    sprite = nightSprite;
    isNight=true;
  
  }

    void switchToDay() async {
    final daySprite = await Sprite.load('background_day.png');
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