import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:switch_off/game.dart';

class Door extends SpriteComponent with HasGameRef<SwitchGame>{
  bool isNight = false; 
     @override
  late  double width=size.x;
  @override
  late double height=width/(1.44);
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Load the image for the Angry Bird sprite
    sprite = await Sprite.load('door_day.png'); // Adjust the path to your image

    size = Vector2(gameRef.size.x,gameRef.size.y); // Adjust size as needed
  
    position = Vector2((game.size.x/2),(game.size.y/2));  

    anchor=Anchor.center;
  print(position);
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