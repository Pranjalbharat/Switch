import 'package:flame/components.dart';
import 'package:switch_off/game.dart';

class BorderLine extends SpriteComponent with HasGameRef<SwitchGame>{
    @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Load the image for the Angry Bird sprite
    sprite = await Sprite.load('borderline_night.png'); // Adjust the path to your image
    // size = Vector2(300, 300); // Adjust size as needed
    // position = Vector2(200,400); 
    size = Vector2(game.size.x,(game.size.x/1.44));
    anchor=Anchor.center;
    position = gameRef.size/2;
  }
}