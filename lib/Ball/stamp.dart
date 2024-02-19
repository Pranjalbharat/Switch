import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:switch_off/game.dart';

class Stamp extends PositionComponent with HasGameRef<SwitchGame> {
  Stamp()
      : super(
          size: Vector2(100, 100), // a vector2 is like a tuple of python.
          anchor: Anchor.center,
        );
  static final _paint = Paint()..color = Colors.grey.withOpacity(0.5);

  @override
  void render(Canvas canvas) {
    double radius = 60.0;
    double centerY = (height / 2) + (radius);
    double centerX = (width / 2) +
        50; // these additions are adjustment to match the original ball position.

    // Now, draw the circle:
    canvas.drawCircle(Offset(centerX, centerY), radius, _paint);
  }
}
