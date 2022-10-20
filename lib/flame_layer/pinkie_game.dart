import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';

import '../actors/actor.dart';
import '../blocks/score/score_bloc.dart';

class PinkieGame extends FlameGame with HasCollisionDetection {
  final ScoreBloc scoreBloc;

  PinkieGame({required this.scoreBloc});

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    camera.viewport = FixedResolutionViewport(Vector2(14000, 784));
    add(SpriteComponent(sprite: await loadSprite("background.png"))
      ..size = size);

    add(FlameBlocProvider.value(value: scoreBloc, children: [
      Treasure(treasurePosition: Vector2(300, 100)),
      Treasure(treasurePosition: Vector2(600, 100)),
      Treasure(treasurePosition: Vector2(800, 100)),
      Pinkie(),
    ]));
  }
}
