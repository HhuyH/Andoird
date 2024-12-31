import 'package:flutter/material.dart';
import 'profile.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
// Danh sách tháng
  String? _selectMonth;
  final List<String> _months = [
    "Tháng 1",
    "Tháng 2",
    "Tháng 3",
    "Tháng 4",
    "Tháng 5",
    "Tháng 6",
    "Tháng 7",
    "Tháng 8",
    "Tháng 9",
    "Tháng 10",
    "Tháng 11",
    "Tháng 12",
  ];

  String? _selectDay;
  final List<String> _days = [
    "Ngày 1",
    "Ngày 2",
    "Ngày 3",
    "Ngày 4",
    "Ngày 5",
    "Ngày 6",
    "Ngày 7",
    "Ngày 8",
    "Ngày 9",
    "Ngày 10",
    "Ngày 11",
    "Ngày 12",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //padding tổng thể
            Padding(
              padding: EdgeInsets.only(top: 70, left: 40, right: 40),
              child: Container(
                height: 650,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFADFF2F), Color(0xFFFFA54F)],
                  ),
                ),
                child: Column(children: [
                  //Chữ don98 đặt hàng ở trên đầu
                  Padding(
                      padding: EdgeInsets.only(
                          top: 50, right: 50, left: 50, bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Đơn hàng của tối",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold, // in đậm
                              fontStyle: FontStyle.italic, // kiểu chữ
                            ),
                          ),
                        ],
                      )),
                  //

                  //container nut ngay di va ve và xem
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        //Sap xep don hang
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Sấp xếp đơn hàng",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        //

                        //Nút chọn ngày tháng và nút xem
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //nút chọn tháng
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    children: [
                                      //nút chọn tháng
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: DropdownButton<String>(
                                          hint: Text(
                                              "Chọn Tháng"), // Placeholder mặc định
                                          isDense:
                                              true, // giảm chỗ trống trên và dưới
                                          value: _selectMonth,
                                          items: _months.map((String month) {
                                            return DropdownMenuItem<String>(
                                              value: month,
                                              child: Text(month),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _selectMonth = newValue;
                                            });
                                          },
                                          icon: Icon(Icons.arrow_drop_down,
                                              size:
                                                  13), // thu nhỏ icon để giảm khoản cách từ chữ tới nút xuống
                                        ),
                                      )
                                      //
                                    ],
                                  ),
                                )
                              ],
                            ),
                            //

                            const SizedBox(
                              width: 10,
                            ),

                            //nút chọn ngày
                            Container(
                              padding: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                border: Border.all(width: 2 // độ dầy viền
                                    ), //tào đường viền

                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButton<String>(
                                isDense: true,
                                hint: Text("Chọn Ngày"), // Placeholder mặc định
                                value: _selectDay,
                                items: _days.map((String day) {
                                  return DropdownMenuItem<String>(
                                    value: day,
                                    child: Text(day),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectDay = newValue;
                                  });
                                },
                                icon: Icon(Icons.arrow_drop_down, size: 13),
                              ),
                            ),
                            //

                            const SizedBox(
                              width: 10,
                            ),

                            //nút xem
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(20, 30),
                                  backgroundColor:
                                      const Color(0xFF00B2EE), // Màu nền
                                  //Điều chỉnh góc bo cho button
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10), // Bo góc
                                  ),
                                ),
                                child: Text(
                                  "Xem",
                                  style: TextStyle(color: Colors.black),
                                )),
                            //
                          ],
                        ),
                        //
                      ],
                    ),
                  ),
                  //

                  //chữ lịch sữ
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "   Lịch sữ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold, // in đậm
                        ),
                      ),
                    ],
                  ),
                  //

                  const SizedBox(
                    height: 10,
                  ),

                  //Hàm chứa lịch sữ đặt hàng
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 350,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    //gọi hàm lịch đặt hàng orderlist(Mã màu 1 2, tên đặt hàng,'
                                    // trạng thái đặt hàng,
                                    //giá tiền)
                                    orderlist(
                                        Color.fromARGB(255, 174, 15, 205),
                                        Color(0xFFFFA54F),
                                        'Đặt chuyến bay',
                                        'Hoàn thành thành toán',
                                        '-100.000VND'),
                                    orderlist(
                                        Color.fromARGB(255, 195, 26, 40),
                                        Color(0xFFFFA54F),
                                        'Đặt tàu lữa',
                                        'Hoàn thành thành toán',
                                        '-100 điểm'),
                                    orderlist(
                                        Color.fromARGB(255, 26, 40, 195),
                                        Color(0xFFFFA54F),
                                        'Thuê xe',
                                        'Hủy',
                                        '-100.000VND'),
                                    orderlist(
                                        Color.fromARGB(255, 195, 26, 40),
                                        Color(0xFFFFA54F),
                                        'Đặt dịch vụ',
                                        'Đổi dịch vụ',
                                        '-200 điểm'),
                                    orderlist(
                                        Color.fromARGB(255, 26, 40, 195),
                                        Color(0xFFFFA54F),
                                        'Thuê xe',
                                        'Hủy',
                                        '-100.000VND'),
                                    orderlist(
                                        Color.fromARGB(255, 195, 26, 40),
                                        Color(0xFFFFA54F),
                                        'Đặt dịch vụ',
                                        'Đổi dịch vụ',
                                        '-200 điểm'),
                                    orderlist(
                                        Color.fromARGB(255, 26, 40, 195),
                                        Color(0xFFFFA54F),
                                        'Thuê xe',
                                        'Hủy',
                                        '-100.000VND'),
                                    orderlist(
                                        Color.fromARGB(255, 195, 26, 40),
                                        Color(0xFFFFA54F),
                                        'Đặt dịch vụ',
                                        'Đổi dịch vụ',
                                        '-200 điểm'),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //

                  //Mũi tên xuống
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_drop_down,
                        size: 50,
                      )
                    ],
                  )
                  //
                ]),
              ),
              //
            ),
            //

            const SizedBox(
              height: 70,
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
                  menuButton('assets/home32.png', 'Trang chủ', 'home'),
                  //nút đặt du lịch
                  menuButton('assets/clipboard32.png', 'Đơn hàng', null),
                  //nút thông báo
                  menuButton('assets/notification32.png', 'Thông báo', null),
                  //nút tài khoản
                  menuButton('assets/user32.png', 'Người dùng', Profile()),
                ],
              ),
            ),
            //
          ],
        ),
      ),
    );
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
    //
  }
  //

  //Box lich su dat
  Widget orderlist(badgeColor1, badgeColor2, orderName, activity, deduct) {
    return //chuyến bay
        Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //vô vuông trước chữ
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [badgeColor1, badgeColor2],
                      )),
                ),
              ),
            ],
          ),
          //

          //tên đặt hàng và trạng thái
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(activity),
              ],
            ),
          ),
          //

          //Điểm bị trừ
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                deduct,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black),
              ),
            ],
          ),
          //
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
    //
  }
  //
}
