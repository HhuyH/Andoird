import 'dart:async'; // Thư viện Dart hỗ trợ lập trình bất đồng bộ (async/await)
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart'; // Thư viện Flame cung cấp lớp FlameGame cho game logic
import 'package:flutter/material.dart'; // Thư viện Flutter để hỗ trợ giao diện người dùng
import 'package:flutter/services.dart';
import 'package:learning/2DGame/constants.dart';
import 'package:learning/2DGame/gameSystem/endmenu.dart';
import 'package:learning/2DGame/gameSystem/score.dart';
//import 'package:learning/2DGame/player.dart';
import 'package:learning/2DGame/gameSystem/world.dart'; // Import lớp Player từ file khác

/// - `FlameGame` là lớp cơ bản trong Flame framework, chứa các thành phần chính như
///   render, update, và quản lý thế giới game
class GoAcorn extends FlameGame<GoAcornWorld>
    with HorizontalDragDetector, KeyboardEvents, HasCollisionDetection {
  /// - `super.children`: Cho phép truyền các phần tử con để khởi tạo game nếu cần
  //GoAcorn({super.children});
  //camera: CameraComponent.withFixedResolution để cho vật thể không tràn màng hình khi qua chế độ web
  final Score score;
  //ko hoat dong
  double obstacleSpeed = 400; //tốc độ gốc của vật
  double speedIncrement = 100; //mức độ tăng tốc vật cản

  //đặt size màng hình cố định
  GoAcorn({
    required this.score,
    required this.endCallback,
  }) : super(
          world: GoAcornWorld(score),
          camera: CameraComponent.withFixedResolution(
              width: gameWidth, height: gameHeight),
        );

  final void Function() endCallback;

  void showEndMenu() {
    // Đặt một lớp overlay hoặc màn hình kết thúc lên game
    add(EndMenu() as Component); // Hiển thị màn hình EndMenu
  }

  /// Hàm `onLoad` được gọi khi game bắt đầu tải
  /// khởi tạo các đối tượng trong game khi mở game
  @override
  Future<void> onLoad() async {
    super.onLoad(); // Gọi hàm khởi tạo mặc định của lớp cha
    //gọi trang thái debug
    debugMode = false;
  }

  /// Hàm `backgroundColor` định nghĩa màu nền của trò chơi
  /// - Ở đây, màu nền được đặt là màu xanh lá cây
  @override
  Color backgroundColor() {
    return Color(0xFF5acdc0);
  }

  //di chuyển vật thể quá trái phải khi xài trên phone
  @override
  void onHorizontalDragUpdate(DragUpdateInfo info) {
    super.onHorizontalDragUpdate(info);
    world.player.move(info.delta.global.x);
    //lenh nay ko hoat dong
    //nếu trướt xuống thì tăng tốc độ vật rơi
    if (info.delta.global.y > 0) {
      obstacleSpeed += speedIncrement;
    }
  }

  //di chuyển vật thể cho mủi tên trái phải trên keyboard
  @override
  KeyEventResult onKeyEvent(
      KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    const double moveSpeed = 55.0;

    if (event is KeyDownEvent) {
      if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
        world.player.move(moveSpeed);
        return KeyEventResult.handled;
      } else if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
        world.player.move(-moveSpeed);
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }
}
