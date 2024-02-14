import 'package:flame/components.dart';
import 'package:switch_off/game.dart';

class Lamp extends SpriteComponent with HasGameRef<SwitchGame>{
  bool isNight = false; 
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Load the image for the Angry Bird sprite
    sprite = await Sprite.load('lamp_left.png'); // Adjust the path to your image
    size = Vector2(800, 600); // Adjust size as needed
    position = Vector2(450,320); 
    anchor=Anchor.center;
  }

  void switchToNight() async {
    final nightSprite = await Sprite.load('lamp_left_night.png');
    sprite = nightSprite;
    isNight=true;
  
  }

    void switchToDay() async {
    final daySprite = await Sprite.load('lamp_left.png');
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

