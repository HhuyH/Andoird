import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:learning/2DGame/gameSystem/nutty_acorn.dart';
import 'package:learning/2DGame/sprites/obstacle.dart';
import 'package:learning/2DGame/sprites/player.dart';

class Acorn extends SpriteComponent
    with HasGameRef<GoAcorn>, CollisionCallbacks {
  Acorn({
    required this.spritePath,
  });

  final String spritePath;

  @override
  Future<void> onLoad() async {
    //load ảnh
    sprite = await Sprite.load(spritePath);
    anchor = Anchor.center;
    add(RectangleHitbox());
  }

  @override
  bool onComponentTypeCheck(PositionComponent other) {
    if (other is Obstacle || other is Acorn) {
      return false;
    }
    return super.onComponentTypeCheck(other);
  }
}

class AcornSeed extends Obstacle {
  //gán đường dẫn ảnh
  AcornSeed() : super(spritePath: "acorn16.png");
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) {
      other.removeFromParent();
      //win state set
      //game.endCallback();
      gameRef.overlays.add('EndMenuOverlay');
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  Future<void> onLoad() async {
    //load ảnh
    sprite = await Sprite.load(spritePath);
    anchor = Anchor.center;
    add(RectangleHitbox());
  }
}
