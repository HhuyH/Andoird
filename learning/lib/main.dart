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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final TextEditingController _textController =
      TextEditingController(); // Controller để quản lý nội dung của TextField.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Thiết lập màu nền cho AppBar từ theme hiện tại.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title), // Hiển thị tiêu đề trên AppBar.
      ),
      //
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Căn trên các widget con trong Column.
          children: <Widget>[
            //căn lè trái cho test
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('What your name?'),
            ),

            //Tạo text field
            Padding(
              padding: const EdgeInsets.all(
                  16.0), // Khoảng cách xung quanh TextField.
              child: TextField(
                controller:
                    _textController, // Kết nối TextField với controller.
                decoration: const InputDecoration(
                  border: OutlineInputBorder(), // Đường viền cho TextField.
                  labelText: 'Enter text here', // Nhãn cho TextField.
                ),
              ),
            ),

            //nút ko có nền
            TextButton(
              onPressed: () {
                String name = _textController.text;
                print('Hello, $name!');
              },
              child: Text("Say Hello"), // nội dung cho nút
            ),
            //
          ],
        ),
      ),
      //
    );
  }
}
