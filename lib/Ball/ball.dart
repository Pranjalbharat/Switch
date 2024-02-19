// import 'package:flame/components.dart';
// import 'package:flutter/material.dart';
// import 'package:switch_off/game.dart';

// class Ball extends PositionComponent with HasGameRef<SwitchGame> {
//   Ball()
//       : super(
//           size: Vector2(100, 100), // a vector2 is like a tuple of python.
//           anchor: Anchor.center,
//         );
//   static final _paint = Paint()..color = Colors.white;

//   final double bias = 10.0;
//   bool isThrowed = false;
//   late double velocityX;
//   late double velocityY;
//   double radius = 50.0; //! radius should be calculated according to z axis.
//   double gravity = 10.0;
//   double mass = 1;
//   double timeY = 0;
//   double heightY = 0;
//   double totalTime = 0;
//   @override
//   void render(Canvas canvas) {
//     double centerY = height / 2;
//     double centerX = width / 2;

//     // Now, draw the circle:
//     canvas.drawCircle(Offset(centerX, centerY), radius, _paint);
//   }

//   void move(Vector2 pos) {
//     position.add(pos);
//   }

//   void throwBall(double velocity, Vector2 direction) {
//     isThrowed = true;
//     velocityX = direction.x * bias;
//     velocityY = direction.y * bias;

//     timeY = (velocityY / bias) / gravity;
//     timeY = timeY.abs();
//     heightY = ((velocityY / bias) * (velocityY / bias)) / (2 * gravity);

//     // print("x: $velocityX and y: $velocityY");
//     // print("time: $timeY");
//     // print("height: $heightY");
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);
//     totalTime += dt;

//     if (isThrowed) {
//       double positionY = ((velocityY / bias) * totalTime) +
//           (gravity * totalTime * totalTime / 2);

//       position.y += positionY;
//       // position.y += dt * velocityY;
//       position.x += dt * velocityX;
//       if (radius < 25) {
//         gravity = 15;
//       } else {
//         setRadius(radius - 0.3);
//       }
//     }
//     if (position.x < -width ||
//         position.y > game.size.y ||
//         position.x > game.size.x) {
//       game.resetGame();
//     }
//   }

//   void setRadius(double newRadius) {
//     if (radius < 20) {
//       return;
//     } else {
//       radius = newRadius;
//     }
//   }
// }

// /*  z axis:
//     y-axis
//       ^     .
//       |    /
//       |   /
//       |  /
//       | /
//       |/
//       |________________> x-axis
// */