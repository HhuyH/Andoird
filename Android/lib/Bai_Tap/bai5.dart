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
      home: const MyHomePage(
          title: 'Flutter Demo Home Page'), // Widget chính của ứng dụng.
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
  int _counter = 0; // Biến đếm để theo dõi số lần nút được nhấn.

  // Hàm để tăng giá trị của biến đếm (_counter).
  void _incrementCounter() {
    setState(() {
      _counter++; // Tăng giá trị _counter lên 1.
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--; // Tăng giá trị _counter lên 1.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Căn giữa các widget con trong Column.
          children: <Widget>[
            //
            Container(
                width: 200, // Chiều rộng
                height: 200, // Chiều cao
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 223, 106, 106), // Màu nền
                  shape: BoxShape.circle, // dung hình tròn
                  border: Border.all(
                      color: const Color.fromARGB(255, 6, 3, 3), width: 5),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$_counter',
                      style: const TextStyle(
                        fontSize: 42.0, // Kích thước chữ
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    const Text(
                      'Pullups',
                      style: TextStyle(
                        fontSize: 13.0, // Kích thước chữ
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                )),

            const SizedBox(
              height: 400,
            ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlinedButton(
                  onPressed: _incrementCounter,
                  style: OutlinedButton.styleFrom(
                    minimumSize:
                        const Size(150, 50), // Đặt kích thước tối thiểu cho nút
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20), // Khoảng cách bên trong nút
                  ), // Gọi hàm tăng biến đếm khi nhấn nút.
                  child: const Text('+ Rep'),
                ),
                const SizedBox(
                  width: 100,
                ),
                OutlinedButton(
                  onPressed: _decrementCounter,
                  style: OutlinedButton.styleFrom(
                    minimumSize:
                        const Size(150, 50), // Đặt kích thước tối thiểu cho nút
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20), // Khoảng cách bên trong nút
                  ), // Gọi hàm tăng biến đếm khi nhấn nút.
                  child: const Text('- Rep'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
