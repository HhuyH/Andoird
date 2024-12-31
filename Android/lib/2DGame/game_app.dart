import 'package:flutter/material.dart';
import 'package:learning/2DGame/gameSystem/router.dart';

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  @override
  Widget build(BuildContext context) {
    final router = goRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false, // Ẩn chữ debug trên đầu bên phải
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor:
            Colors.transparent, // Màu nền mặc định của scaffold
      ),
      builder: (context, child) {
        // Sử dụng Container làm nền
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/background.jpg'), // Đường dẫn đến hình nền của bạn
              fit: BoxFit.none, //phóng to thu nhỏ hình ảnh
            ),
          ),
          child: child,
        );
      },
    );
  }
}
