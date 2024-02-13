import 'dart:async';

import 'package:flame/game.dart';
import 'package:switch_off/components/bed.dart';


class SwitchGame extends FlameGame{
  late Bed bed;
    @override
  Future<void> onLoad() async {
    await super.onLoad();
  bed=Bed();
  add(bed);
    startDayNightCycle();
  }

  void startDayNightCycle() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      bed.toggleDayNight(); // Toggle between day and night every 5 seconds
    });
  }
}