import 'package:flutter/material.dart';
import 'main.dart';
import 'register.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  //2 biến text edit để quản lý dữ liệu nhập vào
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  //biến để ẩn hiện mật khẩu
  bool passVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),

        //
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),

              //ảnh logo
              Image.asset(
                'assets/TravelLogoEdit.jpg', // Đường dẫn đến hình ảnh
                width: 350, // Chiều rộng hình ảnh
                height: 350, // Chiều cao hình ảnh
              ),
              //

              const SizedBox(
                height: 20,
              ),

              //chứa field điền tải khoản
              Padding(
                padding: const EdgeInsets.only(
                    left: 50,
                    bottom: 20,
                    right: 50), // khoảng cách xung quanh TextField.
                child: TextField(
                  controller:
                      _userController, // kết nối TextField với controller.
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(), // đường viền cho TextField.
                    prefixIcon: Icon(Icons.person), // icon bên trong TextField.
                    labelText: 'Username', // nhãn cho TextField.
                  ),
                ),
              ),

              //chứa field điền mật khẩu
              Padding(
                padding: const EdgeInsets.only(
                    left: 50,
                    bottom: 20,
                    right: 50), // Khoảng cách xung quanh TextField.
                child: TextField(
                  controller:
                      _passController, // Kết nối TextField với controller.
                  obscureText: passVisible, // Ẩn ký tự
                  decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(), // Đường viền cho TextField.
                      prefixIcon:
                          const Icon(Icons.lock), // Icon bên trong TextField.
                      labelText: 'Password', // Nhãn cho TextField.
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passVisible = !passVisible;
                            });
                          },
                          icon: const Icon(Icons.visibility))),
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
                  //nút login
                  ElevatedButton(
                    onPressed: () {
                      // chuyển đến Home khi nhấn nút "Login"
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(
                            150, 50), // đặt kích thước tối thiểu cho nút
                        backgroundColor:
                            const Color.fromARGB(190, 130, 130, 236)),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white, // màu chữ
                        fontSize: 16.0, // kích thước chữ
                        fontWeight: FontWeight.bold, // dộ đậm chữ
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
                ],
              ),
              Column(
                children: [
                  //
                  const SizedBox(
                    height: 50,
                  ),
                  //
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, // bỏ khoảng cách xung quanh
                      minimumSize:
                          Size(0, 0), // giảm kích thước tối thiểu của button
                      tapTargetSize: MaterialTapTargetSize
                          .shrinkWrap, // thu nhỏ diện tích nhấn
                    ),
                    child: Text(
                      "Quên mật khẩu",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration:
                            TextDecoration.underline, // gạch chân văn bản
                      ),
                    ),
                  ),
                  //
                  const SizedBox(
                    height: 10,
                  ),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //text hổi có tài khoản chưa chưa thì bấm vào để đang ký
                      Text("Chưa có tài khoản? "),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (Register())));
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // bỏ khoảng cách xung quanh
                          minimumSize: Size(
                              0, 0), // giảm kích thước tối thiểu của button
                          tapTargetSize: MaterialTapTargetSize
                              .shrinkWrap, // thu nhỏ diện tích nhấn
                        ),
                        child: Text(
                          "Đăng ký",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration:
                                TextDecoration.underline, // gạch chân văn bản
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          )),
        ));
  }
}
