import 'package:flame/components.dart';
import 'package:switch_off/game.dart';

class WindowL extends SpriteComponent with HasGameRef<SwitchGame>{
  bool isNight = false; 
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Load the image for the Angry Bird sprite
    sprite = await Sprite.load('window_close_left.png'); // Adjust the path to your image
      size = Vector2(210,381); // Adjust size as needed
    position = Vector2(game.size.x/2-970,game.size.y/2-30); 
    anchor=Anchor.center;
  }

  void switchToNight() async {
    final nightSprite = await Sprite.load('window_close_left.png');
    sprite = nightSprite;
    isNight=true;
  
  }

    void switchToDay() async {
    final daySprite = await Sprite.load('window_left.png');
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