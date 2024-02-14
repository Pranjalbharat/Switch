import 'package:flame/components.dart';
import 'package:switch_off/game.dart';

class Door extends SpriteComponent with HasGameRef<SwitchGame>{
  bool isNight = false; 
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Load the image for the Angry Bird sprite
    sprite = await Sprite.load('door_day.png'); // Adjust the path to your image
    size = Vector2(1200, 700); // Adjust size as needed
    position = Vector2(-60,355); 
    anchor=Anchor.centerLeft;
  }

  void switchToNight() async {
    final nightSprite = await Sprite.load('door_night.png');
    sprite = nightSprite;
    isNight=true;
  
  }

    void switchToDay() async {
    final daySprite = await Sprite.load('door_day.png');
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