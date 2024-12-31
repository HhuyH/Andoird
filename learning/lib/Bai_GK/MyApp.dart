import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const MyApp()); // Khởi động ứng dụng
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning', // tiêu đề của ứng dụng.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(
                246, 116, 139, 255)), // màu chủ đề của cả app
        useMaterial3: true,
      ),
      home: LoginForm(),
    );
  }
}
