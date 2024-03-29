import 'package:flame/components.dart';
import 'package:switch_off/game.dart';

class Screen extends SpriteComponent with HasGameRef<SwitchGame>{
    @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Load the image for the Angry Bird sprite
    sprite = await Sprite.load('screen_day.png'); // Adjust the path to your image
    // size = Vector2(300, 300); // Adjust size as needed
    // position = Vector2(200,400); 
  size = Vector2(gameRef.size.x,gameRef.size.y);
    anchor=Anchor.center;
    position = gameRef.size/2;
    
  }
}