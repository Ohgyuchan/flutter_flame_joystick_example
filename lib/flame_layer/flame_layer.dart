import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_joystick_example/flame_layer/pinkie_game.dart';

class FlameLayer extends StatelessWidget {
  const FlameLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: PinkieGame(),
    );
  }
}
