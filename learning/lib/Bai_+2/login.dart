import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp()); // Khởi động ứng dụng với widget gốc là MyApp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning', // Tiêu đề của ứng dụng.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(119, 255, 255,
                255)), // Màu chủ đề được xác định từ màu hạt giống.
        useMaterial3: true, // Sử dụng Material Design 3.
      ),
      home: LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final ScrollController listScrollController = ScrollController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
        appBar: AppBar(
            // Thiết lập màu nền cho AppBar từ theme hiện tại.
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Center(
              child: Text("Login"),
            )),
        //
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //
              const SizedBox(
                height: 50,
              ),
              //
              Image.asset(
                'assets/exercise1.png', // Đường dẫn đến hình ảnh
                width: 250, // Chiều rộng hình ảnh
                height: 200, // Chiều cao hình ảnh
              ),
              //
              const SizedBox(
                height: 20,
              ),
              //

              //text trên textfield username
              // const Padding(
              //   padding: EdgeInsets.only(
              //       left: 16.0, right: 16), // Thêm khoảng cách xung quanh
              //   child: Align(
              //     alignment: Alignment.centerLeft,
              //     child: Text(
              //       'Username?',
              //       style: TextStyle(
              //         color: Color.fromARGB(255, 0, 0, 0), // Màu chữ
              //         fontSize: 16.0, // Kích thước chữ
              //       ),
              //     ),
              //   ),
              // ),

              //
              //Tạo text field
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0,
                    bottom: 16,
                    right: 16), // Khoảng cách xung quanh TextField.
                child: TextField(
                  controller:
                      _userController, // Kết nối TextField với controller.
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(), // Đường viền cho TextField.
                    labelText: 'Username', // Nhãn cho TextField.
                  ),
                ),
              ),
              //

              //text trên textfield password
              // const Padding(
              //   padding: EdgeInsets.only(
              //       left: 16.0, right: 16), // Thêm khoảng cách xung quanh

              //   child: Align(
              //     alignment: Alignment.centerLeft,
              //     child: Text(
              //       'Password?',
              //       style: TextStyle(
              //         color: Color.fromARGB(255, 0, 0, 0), // Màu chữ
              //         fontSize: 16.0, // Kích thước chữ
              //       ),
              //     ),
              //   ),
              // ),

              //Tạo chữ bên trong text field
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0,
                    bottom: 16,
                    right: 16), // Khoảng cách xung quanh TextField.
                child: TextField(
                  controller:
                      _passController, // Kết nối TextField với controller.
                  obscureText: true, // Ẩn ký tự
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(), // Đường viền cho TextField.
                    labelText: 'Password', // Nhãn cho TextField.
                  ),
                ),
              ),
              //

              //
              const SizedBox(
                height: 50,
              ),
              //

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //
                  ElevatedButton(
                    onPressed: () {
                      // Điều hướng đến Home khi nhấn nút "Login"
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(
                            150, 50), // Đặt kích thước tối thiểu cho nút
                        backgroundColor:
                            const Color.fromARGB(190, 130, 130, 236)),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white, // Màu chữ
                        fontSize: 16.0, // Kích thước chữ
                        fontWeight: FontWeight.bold, // Độ đậm chữ
                      ),
                    ),
                  ),
                  //

                  //
                  const SizedBox(
                    width: 40,
                  ),
                  //

                  //nút sign in
                  ElevatedButton(
                    onPressed: () {
                      // Điều hướng
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const HomePage()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(
                            150, 50), // Đặt kích thước tối thiểu cho nút
                        backgroundColor:
                            const Color.fromARGB(238, 220, 44, 194)),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white, // Màu chữ
                        fontSize: 16.0, // Kích thước chữ
                        fontWeight: FontWeight.bold, // Độ đậm chữ
                      ),
                    ),
                  ),
                  //

                  //
                ],
              )
            ],
          )),
        ));
  }
}
