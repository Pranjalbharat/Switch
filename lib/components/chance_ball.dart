import 'package:flame/components.dart';
import 'package:switch_off/game.dart';

class ChanceBall extends  SpriteComponent with HasGameRef<SwitchGame>{
    bool isGrey = false;
    Future<void> onLoad() async {
    await super.onLoad();
    // Load the image for the Angry Bird sprite
    sprite = await Sprite.load('chance_ball.png'); // Adjust the path to your image
    size = Vector2(100,100);// Adjust size as needed
    // position = Vector2((game.size.x/2),(game.size.y/2-500));  
    anchor=Anchor.center;
  }

    void switchToGrey() async {
    final greySprite = await Sprite.load('chance_grey.png');
    sprite = greySprite;
    isGrey=true;
  }
    void resetToRed() async {
    final redsprite = await Sprite.load('chance_ball.png');
    sprite=redsprite;
    isGrey = false;
  }
}