import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// MyApp là widget gốc của ứng dụng, dùng để cấu hình theme và điều hướng chính.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Phương thức build để xây dựng giao diện của ứng dụng.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning', // Tiêu đề của ứng dụng.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(
                77, 41, 16, 16)), // Màu chủ đề được xác định từ màu hạt giống.
        useMaterial3: true, // Sử dụng Material Design 3.
      ),
      home: const MyHomePage(title: 'Flutter learning'),
    );
  }
}

// MyHomePage là widget chính chứa nội dung của ứng dụng.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title; // Tiêu đề của MyHomePage.

  @override
  State<MyHomePage> createState() =>
      _MyHomePageState(); // Tạo trạng thái cho MyHomePage.
}

// _MyHomePageState là lớp trạng thái của MyHomePage, chứa các biến và phương thức quản lý trạng thái.
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            square('Square 1', const Color.fromARGB(255, 218, 115, 220)),
            const SizedBox(width: 10),
            square('Square 2', const Color.fromARGB(255, 137, 110, 110)),
            const SizedBox(width: 10),
            square('Square 3', const Color.fromARGB(106, 79, 81, 223)),
          ],
        ),
      ),
      //
    );
  }

  Widget square(String text, Color color) {
    return Container(
      width: 100, // Chiều rộng
      height: 100, // Chiều cao
      alignment: Alignment.center, // Căn giữa nội dung
      color: color,
      child: Text(
        text,
      ),
    );
  }
}
