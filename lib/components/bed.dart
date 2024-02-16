import 'package:flame/components.dart';
import 'package:switch_off/game.dart';

class Bed extends SpriteComponent with HasGameRef<SwitchGame>{
  bool isNight = false; 
  @override
  Future<void> onLoad() async {
    await super.onLoad();
   
    sprite = await Sprite.load('bed_day.png'); 
      size = Vector2(gameRef.size.x,gameRef.size.y);
    position = Vector2(game.size.x/2,game.size.y/2); 
    anchor=Anchor.center;
  }


  void switchToNight() async {
    final nightSprite = await Sprite.load('bed_night.png');
    sprite = nightSprite;
    isNight=true;
  }


    void switchToDay() async {
    final daySprite = await Sprite.load('bed_day.png');
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