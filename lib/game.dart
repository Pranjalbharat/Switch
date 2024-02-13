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
    Timer(const Duration(seconds: 5), () {
      bed.switchToNight();
    }); 
  }
}