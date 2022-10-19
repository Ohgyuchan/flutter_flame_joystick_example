import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter_flame_joystick_example/actors/pinkie.dart';

class PinkieGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(SpriteComponent(sprite: await loadSprite("background.png"))
      ..size = size);
    add(Pinkie());
  }
}
