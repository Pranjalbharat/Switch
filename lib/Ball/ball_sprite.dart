import 'package:flame/components.dart';
import 'package:switch_off/Ball/stamp.dart';
import 'package:switch_off/game.dart';

class BallSprite extends SpriteComponent with HasGameRef<SwitchGame> {
  BallSprite()
      : super(
          size: Vector2(250, 250),
          anchor: Anchor.topLeft,
        );

  double diameter = 250;
  final double bias = 10.0;
  bool isThrowed = false;
  late double velocityX;
  late double velocityY;
  double gravity = 10.0;
  double mass = 1;
  double timeY = 0;
  double heightY = 0;
  double totalTime = 0;
  double bounceTime = 0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('ball_night.png');
    position = Vector2((game.size.x / 2) + 50, (game.size.y / 2) + 100);
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  void throwBall(Vector2 direction) {
    isThrowed = true;
    velocityX = direction.x * bias;
    velocityY = direction.y * bias;

    timeY = (velocityY / bias) / gravity;
    timeY = timeY.abs();
    heightY = ((velocityY / bias) * (velocityY / bias)) / (2 * gravity);
  }

  bool countBounceTime = false;
  bool timeToBounce = false;
  bool isStampAdded = false;
  late Stamp stamp;
  @override
  void update(double dt) {
    super.update(dt);
    totalTime += dt;

    if (countBounceTime) {
      bounceTime += dt;
    }

    if (bounceTime > 6) {
      game.resetGame();
    }

    size = Vector2(diameter, diameter);
    if (timeToBounce) {
      countBounceTime = true;
      position.y += dt * -150;
      totalTime = 0;
      isThrowed = true;
      velocityY = velocityY / 1.02;
      velocityX = velocityX / 1.03;
      timeToBounce = false;
    }

    if (isThrowed) {
      double positionY = ((velocityY / bias) * totalTime) +
          (gravity * totalTime * totalTime / 2);

      position.y += positionY;
      // position.y += dt * velocityY;
      position.x += dt * velocityX;
      if (diameter < 150) {
        if (position.x < 150 || position.x > 2020) {
          velocityX = -1 * velocityX;
        }
        if (position.x > 1350) {
          if (position.y > ((game.height * (6 / 10)) - 60)) {
            // stop ball movement
            isThrowed = false;
            timeToBounce = true;
          }
        } else if (position.y > (game.height * (4 / 6))) {
          // stop ball movement
          isThrowed = false;
          timeToBounce = true;
        }

        checkStamp(position);
        increaseGravity();
      } else {
        setDiameter(diameter - 1.25);
      }
    } else {}
    if (position.x < -width ||
        position.y > game.size.y ||
        position.x > game.size.x) {
      game.resetGame();
    }
  }

  void setDiameter(double newDiameter) {
    if (diameter < 20) {
      return;
    } else {
      diameter = newDiameter;
    }
  }

  void increaseGravity() {
    if (gravity == 10) {
      gravity = 12;
    } else {
      return;
    }
  }

  void checkStamp(Vector2 pos) {
    if (!isStampAdded) {
      stamp = Stamp()..position = pos;
      game.checkCollision(pos);
      game.world.add(stamp);
      isStampAdded = true;
    } else {
      return;
    }
  }
}
