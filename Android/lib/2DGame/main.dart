import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:learning/2DGame/gameSystem/score.dart';
import 'package:learning/2DGame/game_app.dart';
import 'package:provider/provider.dart';

void main() {
  //kết nối với Flutter Engine để môi trường Flutter để Flame hoạt động
  WidgetsFlutterBinding.ensureInitialized();
  //ẩn thanh trạng thái (status bar) và thanh điều hướng (navigation bar) trên thiết bị
  Flame.device.fullScreen();
  //đặt hướng màn hình cố định ở chế độ dọc (Portrait Mode) không thể xoay ngang
  Flame.device.setPortrait();
  runApp(
    ChangeNotifierProvider(
      create: (context) => Score(),
      child: GameApp(),
    ),
  );
}
