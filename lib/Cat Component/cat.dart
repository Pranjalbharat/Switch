import 'package:flame/components.dart';
import 'package:switch_off/game.dart';

class Cat extends SpriteAnimationComponent with HasGameRef<SwitchGame> {
  Cat()
      : super(
            size: Vector2.all(400), // a vector2 is like a tuple of python.
            anchor: Anchor.center,
            position: Vector2(500, 740));

  double currentX = 500;
  double targetX = 1900;
  bool running = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    animation = await game.loadSpriteAnimation(
      'cat_idle.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: .2,
        textureSize: Vector2.all(48),
        loop: true,
      ),
    );

    currentX = position.x;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (currentX != targetX) {
      double distanceToTarget = targetX - currentX;
      int direction = distanceToTarget > 0 ? 1 : -1;
      setAnimationToRunning(direction);
      double speed = 500 * dt;
      double movement = speed.clamp(0.0, distanceToTarget.abs());
      currentX += movement * direction;
      position.x = currentX;
      if (currentX > 1350) {
        position.y = 680;
      } else {
        position.y = 740;
      }
    } else {
      setAnimationToIdle();
      targetX = setTargetX();
    }
    // move currentX closer to targetX by 20 pixel. where currentX and TargetX are x coordinate.
  }

  void moveTo(Vector2 destination) {
    Vector2 start = position;
  }

  void setAnimationToRunning(int direction) async {
    if (running == false) {
      running = true;
      if (direction == 1) {
        animation = await game.loadSpriteAnimation(
            'cat_walk.png',
            SpriteAnimationData.sequenced(
              amount: 4,
              stepTime: .2,
              textureSize: Vector2.all(48),
              loop: true,
            ));
      } else {
        animation = await game.loadSpriteAnimation(
            'cat_reverse_walk.png',
            SpriteAnimationData.sequenced(
              amount: 4,
              stepTime: .2,
              textureSize: Vector2.all(48),
              loop: true,
            ));
      }
    }
  }

  void setAnimationToIdle() async {
    if (running) {
      running = false;

      animation = await game.loadSpriteAnimation(
          'cat_idle.png',
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: .2,
            textureSize: Vector2.all(48),
            loop: true,
          ));
    }
  }

  double setTargetX() {
    if (targetX == 1900) {
      return 500;
    } else {
      return 1900;
    }
  }
}
