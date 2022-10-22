import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_flame_joystick_example/blocks/score/score_bloc.dart';

import '../flame_layer/pinkie_game.dart';
import 'actor.dart';

class Treasure extends SpriteComponent
    with HasGameRef<PinkieGame>, CollisionCallbacks {
  final Vector2 treasurePosition;
  Treasure({required this.treasurePosition})
      : super(position: treasurePosition, size: Vector2.all(100)) {
    debugMode = true;
  }

  late Sprite redGem;
  late Sprite pinkGem;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
    redGem = await gameRef.loadSprite("red_gem.png", srcSize: Vector2.all(32));
    pinkGem =
        await gameRef.loadSprite("pink_gem.png", srcSize: Vector2.all(32));
    sprite = redGem;
  }

  @override
  void update(double dt) {}

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Pinkie) {
      // ignore: avoid_print
      print("There is a hit!");
      gameRef.scoreBloc.add(IncreaseScoreEvent());
      removeFromParent(); // When there is collision, it will be removed from view.
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
