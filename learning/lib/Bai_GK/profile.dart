import 'package:flutter/material.dart';
import 'order.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController nameUser = TextEditingController(); //hàm lưu tên
  final TextEditingController bankAcc =
      TextEditingController(); //hàm lưu tài khoản ngân hàng
  final TextEditingController Email = TextEditingController(); //hàm lưu Email
  final TextEditingController passWord =
      TextEditingController(); //hàm lưu Password
  final TextEditingController phoneNum =
      TextEditingController(); //hàm lưu số điên thoại
  final TextEditingController Address =
      TextEditingController(); //hàm lưu dia chi
  final TextEditingController creditCard =
      TextEditingController(); //hàm lưu credit card

  //_ ở đầu tức là biến này là biến private ko thể thay đổi từ ben ngoài

  @override
  //initState khởi tao giá tri mặc định ban đầu và chỉ thưc hiện 1 lần khi khơi động chương chình
  void initState() {
    //super.initstate để đảm bảo rằng bất kỳ quá trình khởi tạo nào từ lớp cha đều được thực hiện
    super.initState();

    //giá trị mẫu cho các textfield
    nameUser.text = "Le le le le e le lelele";
    bankAcc.text = "63464364363";
    Email.text = "Email@gmail.com";
    passWord.text = "43534534345";
    phoneNum.text = "090123152";
    Address.text = "TPHCM cần thơ đà lac hà nơi thu duc viet nam phap lao ";
    creditCard.text = "34543765437";
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hồ sơ"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF6699FF), Color(0xFF0033FF)],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child:
              //
              Column(
            children: [
              //Chữ hồ sơ cá nhân ở trên đầu
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 20),
                child: Text(
                  "Hồ sơ cá nhận",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold, // in đậm
                    fontStyle: FontStyle.italic, // kiểu chữ
                  ),
                ),
              ),
              //

              // Padding chứa avatar và 2 textfield kế bên tên và tài khoản ngân hàng
              Padding(
                padding:
                    EdgeInsets.only(top: 0, left: 30, bottom: 10, right: 30),
                child: Row(children: [
                  //Ảnh tài khoản
                  Padding(
                    padding: EdgeInsets.only(top: 17),
                    child: Image.asset(
                      "assets/Man.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                  //

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Tên người dùng
                      Text(
                        'Tên',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 230,
                        height: 40,
                        child: TextField(
                          controller: nameUser,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            //căn chữ vertical theo chieu duoc horizontal theo chieu ngan
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 9, horizontal: 10),
                          ),
                        ),
                      ),

                      // tài khoản ngân hàng
                      Text(
                        'Ngân hàng',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 230,
                        height: 40,
                        child: TextField(
                          controller: bankAcc,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            //căn chữ vertical theo chieu duoc horizontal theo chieu ngan
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 9, horizontal: 10),
                          ),
                        ),
                      )
                    ],
                  ),
                  //
                ]),
              ),
              //

              //Text field cho nữa dưới email, pass, phone, address, credit card
              //Email
              Padding(
                  padding: EdgeInsets.only(left: 30, bottom: 10, right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        height: 40,
                        child: TextField(
                          controller: Email,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            //căn chữ vertical theo chieu duoc horizontal theo chieu ngan
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 9, horizontal: 10),
                          ),
                        ),
                      )
                    ],
                  )),
              //

              //Password
              Padding(
                  padding: EdgeInsets.only(left: 30, bottom: 10, right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        height: 40,
                        child: TextField(
                          controller: passWord,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            //căn chữ vertical theo chieu duoc horizontal theo chieu ngan
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 9, horizontal: 10),
                          ),
                        ),
                      )
                    ],
                  )),
              //

              //Phone
              Padding(
                  padding: EdgeInsets.only(left: 30, bottom: 10, right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Số điện thoại',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        height: 40,
                        child: TextField(
                          controller: phoneNum,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            //căn chữ vertical theo chieu duoc horizontal theo chieu ngan
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 9, horizontal: 10),
                          ),
                        ),
                      )
                    ],
                  )),
              //

              //Địa chỉ
              Padding(
                  padding: EdgeInsets.only(left: 30, bottom: 10, right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Địa chỉ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        height: 60,
                        child: TextField(
                          controller: Address,
                          maxLines: null, //Cho tự động xuống hàng
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            //căn chữ vertical theo chieu duoc horizontal theo chieu ngan
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 9, horizontal: 10),
                          ),
                        ),
                      )
                    ],
                  )),
              //

              //Credit card
              Padding(
                  padding: EdgeInsets.only(left: 30, bottom: 20, right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Credit | Debit Card',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        height: 40,
                        child: TextField(
                          controller: creditCard,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            //căn chữ vertical theo chieu duoc horizontal theo chieu ngan
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 9, horizontal: 10),
                          ),
                        ),
                      )
                    ],
                  )),
              //

              //dòng mêu tả bên dưới
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 5, right: 50),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "flajwoil nifloanw ifailn failnwfilnailfn ilaw flawilfln wgegweg",
                            softWrap: true, // Cho phép xuống dòng
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //

              //nút lưu thông tin
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50),
                  backgroundColor: Colors.blue, // màu nền
                  foregroundColor: Colors.white, // màu chữ
                ),
                child: const Text('Lưu'),
              ),
              //

              const SizedBox(
                height: 5.2,
              ),

              //Menu dưới
              Container(
                height: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF6699FF), Color(0xFF0033FF)],
                )),
                child: Row(
                  children: [
                    //nút trang chủ
                    menuButton('assets/home32.png', 'Trang chủ', "home"),
                    //nút đặt du lịch
                    menuButton('assets/clipboard32.png', 'Đơn hàng', Order()),
                    //nút thông báo
                    menuButton('assets/notification32.png', 'Thông báo', null),
                    //nút tài khoản
                    menuButton('assets/user32.png', 'Người dùng', null),
                  ],
                ),
              ),
              //
            ],
          ),
        ));
  }

  //Nút Menu
  Widget menuButton(image, text, page) {
    return Padding(
      padding: EdgeInsets.only(right: 18, left: 17),
      child: Column(
        children: [
          // thu nhỏ kích thước của nút nhưng không thay đổi icon
          SizedBox(
            width: 58,
            height: 50,
            child: IconButton(
              onPressed: () {
                if (page == "home") {
                  Navigator.pop(context);
                } else if (page == null) {
                } else {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => page));
                }
              },
              icon: Image.asset(image),
            ),
          ),
          Text(text),
        ],
      ),
    );
  }
  //
}
