import 'package:flutter/material.dart';
import 'profile.dart';
import 'order.dart';

class Flight extends StatefulWidget {
  const Flight({super.key});
  @override
  _FlightState createState() =>
      _FlightState(); // Trả về instance của _FlightState
}

class _FlightState extends State<Flight> {
  String dropdownValue = "Người lớn"; //giá trị mặc định cho dropdownbutton
  bool isSwitched = false; // trạng thái của switch
  bool isExchange = false; //đổi trạng thái chuyến bay
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              //Chữ đăng ký tài khoản ở trên đầu
              Padding(
                padding: EdgeInsets.only(top: 80, bottom: 20),
                child: Text(
                  "Đặt chuyến bay",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold, // in đậm
                    fontStyle: FontStyle.italic, // kiểu chữ
                  ),
                ),
              ),
              //

              //Text field "từ"
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      if (isExchange == false)
                        fieldText(
                          "Từ",
                          null,
                          "assets/takeoff-the-plane24.png",
                          "Select Airport",
                          padding: EdgeInsets.only(left: 50, bottom: 10),
                        )
                      else
                        fieldText(
                          "Tới",
                          null,
                          "assets/plane-landing24.png",
                          "Select Airport",
                          padding: EdgeInsets.only(left: 50, bottom: 10),
                        ),
                    ],
                  )),
                  Padding(
                      padding: EdgeInsets.only(top: 65, right: 43),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (isExchange == false) {
                              isExchange = true;
                            } else {
                              isExchange = false;
                            }
                          });
                        },
                        icon: Image.asset(
                          "assets/arrows24.png",
                          color: isExchange ? null : Colors.black,
                        ),
                      )),
                ],
              ),
              //

              //Text field "tới"
              if (isExchange == false)
                fieldText(
                    "Tới", null, "assets/plane-landing24.png", "Select Airport")
              else
                fieldText(
                  "Từ",
                  null,
                  "assets/takeoff-the-plane24.png",
                  "Select Airport",
                ),

              //Text field ngày đi
              Row(
                children: [
                  Expanded(
                    child: fieldText(
                        "Ngày đi", null, "assets/plane-landing24.png", null,
                        padding: EdgeInsets.only(left: 50, bottom: 10)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50, right: 43),
                    child: Switch(
                      value: isSwitched,
                      onChanged: (bool value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    ),
                  ),
                ],
              ),

              //Text field ngày về
              fieldText("Ngày về", null, "assets/plane-landing24.png", null),

              // text field Hộ chiếu
              Row(
                children: [
                  Expanded(
                    child: fieldText(
                        "Hố chiếu", null, "assets/plane-landing24.png", null,
                        padding: EdgeInsets.only(left: 50, bottom: 10)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 27, right: 48),
                    child: DropdownButton<String>(
                        value: dropdownValue,
                        underline: Container(
                          height: 1,
                          color: Colors.black38,
                        ),
                        items: [
                          DropdownMenuItem<String>(
                              value: 'Người lớn', child: Text('Người lớn')),
                          DropdownMenuItem<String>(
                              value: 'Trẻ em', child: Text('Trẻ em')),
                        ],
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue =
                                newValue!; // Cập nhật giá trị khi thay đổi
                          });
                        }),
                  )
                ],
              ),

              //text field Loại Cabin
              fieldText("Loại cabin", null, "assets/plane-landing24.png", null),

              const SizedBox(
                height: 45.2,
              ),

              //Nút tìm kiếm
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
                    child: const Text('Tìm kiếm'),
                  ),
                  //
                ],
              ),
            ],
          ),
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
              menuButton('assets/user32.png', 'Người dùng', Profile()),
            ],
          ),
        ),
        //
      ],
    )));
  }

  //text field
  Widget fieldText(
    text,
    controller,
    image,
    label, {
    EdgeInsets padding = const EdgeInsets.only(left: 50, bottom: 10, right: 50),
  }) {
    return Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold, // in đậm
              ),
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                icon: Image.asset(
                  image,
                ),
                labelText: label,
              ),
            ),
          ],
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
}
