import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:learning/2DGame/constants.dart';
import 'package:learning/2DGame/gameSystem/nutty_acorn.dart';
import 'package:learning/2DGame/gameSystem/world.dart';
//import 'package:flutter/material.dart';

// Lớp Player kế thừa từ CircleComponent, dùng để đại diện cho một người chơi trong game.
// class Player extends CircleComponent {
//   /// Constructor của lớp Player
//   /// - `position`: Vị trí của player trên màn hình, kiểu Vector2.
//   /// - `radius`: Bán kính của hình tròn đại diện cho player.
//   /// - `color`: Màu sắc của player, mặc định là màu trắng.
//   Player({
//     required super.position, // Vị trí trung tâm của hình tròn, sử dụng từ lớp cha.
//     required double radius, // Bán kính hình tròn.
//     Color color = Colors.white, // Màu của hình tròn, mặc định là màu trắng.
//   }) : super(
//           anchor: Anchor.center, // Neo của hình tròn, đặt ở trung tâm.
//           radius: radius, // bán kính vào lớp cha.
//           paint: Paint() // Tạo đối tượng Paint để vẽ hình tròn.
//             ..color = color // Gán màu cho hình tròn.
//             ..style = PaintingStyle.fill, // Vẽ đầy hình tròn.
//         );
// }

// Lớp player sữ dụng sprite và lấy nhân vật từ ảnh
class Player extends SpriteComponent with HasGameRef<GoAcorn> {
  final GoAcornWorld world;

  Player({required this.world});
  @override
  FutureOr<void> onLoad() async {
    //load ảnh
    sprite = await Sprite.load("flying_squir.png");
    //size ảnh
    size = Vector2(playerWidth, playerHeight);
    //đặt vị trí cho vật
    position = Vector2(0, -(gameHeight / 5));
    anchor = Anchor.center;

    //xoay vật thể <0 xoay phải >0 xoay trái
    //angle = -1;

    //tạo thư viện chỉnh size cho vat thể branch
    final polygonHitbox = PolygonHitbox([
      Vector2(125, 0), // Điểm 1 (góc trái trên)
      Vector2(size.x - 35, 30), // Điểm 2 (góc phải trên)
      Vector2(size.x - 50, size.y - 25), // Điểm 3 (góc phải dưới)
      Vector2(40, size.y), // Điểm 4 (góc trái dưới)
    ]);

    add(polygonHitbox);
  }

  //cho player rơi xuống
  @override
  void update(double dt) {
    super.update(dt);

    //tốc độ rời của player
    double newY = position.y + (dt * 400);

    //cho player rơi xuống và dùng lại ở vị trí nữa trên màng hình
    //vì chướng ngại vật đã tự động chạy từ dưới lên nên ko cần phải chay xuong tiep
    //hiện tại đã cho nhân vật trực tiếp xuất hiện ở vị trí 1/5 trên của
    //màng hình để tránh bị khựng lại khi cho nhân vật dừng lại ở vị trí đó
    if (!GoAcornWorld.stopObstacles) {
      if (newY > -(gameHeight / 5)) {
        newY = -(gameHeight / 5);
      }
    }

    // if (newY > (gameRef.size.y / 2) - (size.y / 2)) {
    //   newY = (gameRef.size.y / 2) - (size.y / 2);
    // }
    position.y = newY;
    //
  }

  //điều kiển vật qua trái phải
  void move(double deltaX) {
    double newX = position.x + deltaX;
    double minX = -(gameRef.size.x / 2) + size.x / 2;
    double maxX = (gameRef.size.x / 2) - size.x / 2;
    newX = newX.clamp(minX, maxX);

    position.x = newX;
  }
}
