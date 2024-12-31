import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:learning/2DGame/constants.dart';
import 'package:learning/2DGame/gameSystem/nutty_acorn.dart';
import 'package:learning/2DGame/sprites/player.dart';
//import 'package:learning/2DGame/gameSystem/world.dart';

class Obstacle extends SpriteComponent
    with HasGameRef<GoAcorn>, CollisionCallbacks {
  Obstacle({
    required this.spritePath,
    Vector2? size, //tạo biến có thay đổi kích thước ko
  }) {
    //nếu không truyền, mặc định là `obstancleSize`
    this.size = size ?? Vector2.all(obstancleSize);
  }

  final String spritePath;

  @override
  Future<void> onLoad() async {
    //load ảnh
    sprite = await Sprite.load(spritePath);
    //size ảnh
    size = Vector2.all(obstancleSize);
    anchor = Anchor.center;
  }

  //làm vật thế biến mất khi bị trạm vào vật cản
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    //nếu vật thể chạm vào là Player thì sẽ biến mất khỏi
    if (other is Player) {
      // other.removeFromParent();
      // //và mở màng hình game over
      //gameRef.endCallback();
      // GoAcornWorld.stopObstacles = true;
      gameRef.pauseEngine(); // Dừng game lại
      // Kích hoạt overlay để hiển thị màn hình EndMenu
      gameRef.overlays.add('EndMenuOverlay');
    }
    super.onCollision(intersectionPoints, other);
  }
}

class ObstacleLeaf extends Obstacle {
  ObstacleLeaf() : super(spritePath: 'leaf.png');
  //
  @override
  Future<void> onLoad() async {
    //load ảnh
    sprite = await Sprite.load(spritePath);
    //size ảnh
    size = Vector2.all(obstancleSize);
    anchor = Anchor.center;

    //tạo thư viện chỉnh size cho vat thể branch
    final polygonHitbox = PolygonHitbox([
      Vector2(10, 30), // Điểm 1 (góc trái trên)
      Vector2(size.x - 20, 50), // Điểm 2 (góc phải trên)
      Vector2(size.x - 45, size.y - 50), // Điểm 3 (góc phải dưới)
      Vector2(55, size.y - 20), // Điểm 4 (góc trái dưới)
    ]);

    add(polygonHitbox);
  }
  //
}

class ObstacleMaple extends Obstacle {
  ObstacleMaple() : super(spritePath: 'maple-leaf.png');
  //
  @override
  Future<void> onLoad() async {
    //load ảnh
    sprite = await Sprite.load(spritePath);
    //size ảnh
    size = Vector2.all(obstancleSize);
    anchor = Anchor.center;

    //tạo thư viện chỉnh size cho vat thể branch
    final polygonHitbox = PolygonHitbox([
      Vector2(40, 30), // Điểm 1 (góc trái trên)
      Vector2(size.x - 20, 50), // Điểm 2 (góc phải trên)
      Vector2(size.x - 15, size.y - 30), // Điểm 3 (góc phải dưới)
      Vector2(25, size.y - 40), // Điểm 4 (góc trái dưới)
    ]);

    add(polygonHitbox);
  }
  //
}

class ObstacleBranch extends Obstacle {
  ObstacleBranch() : super(spritePath: 'branch2.png');

  //
  @override
  Future<void> onLoad() async {
    //load ảnh
    sprite = await Sprite.load(spritePath);
    //size ảnh
    size = Vector2.all(obstancleSize);
    anchor = Anchor.center;

    //tạo thư viện chỉnh size cho vat thể branch
    final polygonHitbox = PolygonHitbox([
      Vector2(10, 90), // Điểm 1 (góc trái trên)
      Vector2(size.x, 100), // Điểm 2 (góc phải trên)
      Vector2(size.x, size.y - 100), // Điểm 3 (góc phải dưới)
      Vector2(25, size.y - 60), // Điểm 4 (góc trái dưới)
    ]);

    add(polygonHitbox);
  }
  //
}

// class ObstacleBird extends Obstacle {
//   ObstacleBird() : super(spritePath: 'freedom.png');
// }

class Ground extends Obstacle {
  Ground() : super(spritePath: "soil.png");

  @override
  Future<void> onLoad() async {
    //load ảnh
    sprite = await Sprite.load(spritePath);
    //size ảnh
    size = Vector2.all(obstancleSize);
    anchor = Anchor.center;

    //tạo thư viện chỉnh size cho vat thể branch
    final polygonHitbox = PolygonHitbox([
      Vector2(10, 90), // Điểm 1 (góc trái trên)
      Vector2(size.x, 100), // Điểm 2 (góc phải trên)
      Vector2(size.x, size.y - 100), // Điểm 3 (góc phải dưới)
      Vector2(25, size.y - 60), // Điểm 4 (góc trái dưới)
    ]);

    add(polygonHitbox);
  }
}
