import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController firstName = TextEditingController(); //hàm lưu họ
  final TextEditingController lastName = TextEditingController(); //hàm lưu tên
  final TextEditingController Email = TextEditingController(); //hàm lưu Email
  //hàm lưu mật khẩu
  final TextEditingController passWord = TextEditingController();
  bool _isChecked = false; //hàm đánh dấu checkbox
  //_ ở đầu tức là biến này là biến private ko thể thay đổi từ ben ngoài

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            //Chữ đăng ký tài khoản ở trên đầu
            Padding(
              padding: EdgeInsets.only(top: 100, bottom: 50),
              child: Text(
                "Đăng ký tài khoản",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold, // in đậm
                  fontStyle: FontStyle.italic, // kiểu chữ
                ),
              ),
            ),
            //

            //Text field ho
            Padding(
              padding:
                  EdgeInsets.only(top: 50, left: 50, bottom: 20, right: 50),
              child: TextField(
                controller: firstName,
                decoration: const InputDecoration(
                  labelText: 'Họ',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            //

            //Text field tên
            Padding(
              padding: EdgeInsets.only(left: 50, bottom: 20, right: 50),
              child: TextField(
                controller: lastName,
                decoration: const InputDecoration(
                  labelText: 'Tên',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            //Text field Email
            Padding(
              padding: EdgeInsets.only(left: 50, bottom: 20, right: 50),
              child: TextField(
                controller: Email,
                decoration: const InputDecoration(
                  labelText: 'Địa chỉ Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            //Text field mật khẩu
            Padding(
              padding: EdgeInsets.only(left: 50, bottom: 20, right: 50),
              child: TextField(
                controller: passWord,
                decoration: const InputDecoration(
                  labelText: 'Mật khẩu',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            //
            Text("Phải có ít nhất 6 ký tự có chữ và ký tư đặc biệt "),

            //Nút checkbox điều khoản
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                  ),
                  //nút text đề người dung nhấn vào sẽ mỡ ra danh muc dieu khoản
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Để đăng ký tài khoản ngân hàng bạn cần phải chấp nhận",
                          softWrap: true, // Cho phép xuống dòng khi cần thiết
                          overflow: TextOverflow
                              .visible, // Hiển thị toàn bộ text nếu không vừa
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding:
                                EdgeInsets.zero, // bỏ khoảng cách xung quanh
                            minimumSize: Size(
                                0, 0), // giảm kích thước tối thiểu của button
                            tapTargetSize: MaterialTapTargetSize
                                .shrinkWrap, // thu nhỏ diện tích nhấn
                          ),
                          child: Text(
                            "Điều khoản của ngân hàng",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration:
                                  TextDecoration.underline, // gạch chân văn bản
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //nút thuc hiện đăng ký
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50),
                    backgroundColor: Colors.blue, // màu nền
                    foregroundColor: Colors.white, // màu chữ
                  ),
                  child: const Text('Đăng ký'),
                ),
                //
                SizedBox(width: 20),

                //nút hủy hủy trang5 thái đăng ký tài khoản
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(150, 50),
                    side: BorderSide(color: Colors.blue), // đường viền
                  ),
                  child: Text('Hủy bỏ'),
                ),
                //
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                //Chữ hỏi nếu đã có tài khoản thì quay lai đăng nhập
                Text("Đã đang ký? "),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // bỏ khoảng cách xung quanh
                    minimumSize:
                        Size(0, 0), // giảm kích thước tối thiểu của button
                    tapTargetSize: MaterialTapTargetSize
                        .shrinkWrap, // thu nhỏ diện tích nhấn
                  ),
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline, // gạch chân văn bản
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
