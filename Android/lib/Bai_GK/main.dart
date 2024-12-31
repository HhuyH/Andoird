import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:learning/Bai_GK/order.dart';
import 'profile.dart';
import 'flight.dart';
import 'traveldate.dart';
import 'chooseflight.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  //List chứa hình cho khung hình quảng cáo
  List<String> imgList = [
    'assets/Vacation1.jpg',
    'assets/Vacation2.jpg',
    'assets/Vacation3.jpg',
  ];
  //

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      //
      body: Column(
        children: [
          //ô vuông trên đầu chứa avatar tên email...
          Container(
            height: 100,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF6699FF), Color(0xFF0033FF)],
            )),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Color(0xFFE0FFFF),
                      ),
                      height: 70,
                      width: 70,
                      child: ClipOval //ClipOval để cắt ảnh thành hình tròn
                          (
                        child: Image.asset(
                          "assets/Man.png",

                          fit: BoxFit
                              .cover, // Đảm bảo ảnh không bị méo, vừa khít trong vòng tròn
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tên",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(179, 68, 66, 68),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 200,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Điểm",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
                //
              ],
            ),
          ),
          //

          //Khung hình quảng cáo
          CarouselSlider(
            items: imgList
                .map(
                  (item) => Image.asset(item,
                      fit: BoxFit.cover, // Phủ toàn bộ không gian
                      width: 450 // Chiếm toàn bộ chiều rộng
                      ),
                )
                .toList(),
            options: CarouselOptions(
              enlargeCenterPage:
                  true, // hiệu ứng phóng to hình ảnh khi xuất hiện
              viewportFraction:
                  1.0, // chiếm toàn bộ chiều rộng của CarouselSlider
              height: 200,
              autoPlay: true,
            ),
          ),
          //

          //Padding chứa các nút
          Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              children: [
                Row(
                  children: [
                    buttonBox(const Color.fromARGB(255, 74, 214, 230),
                        'assets/airplane64.png', "Chuyến bay", Flight()),
                    buttonBox(
                        Colors.amber, 'assets/airport64.png', "Địa điểm", null),
                    buttonBox(
                        Colors.amber, 'assets/airport64.png', "Địa điểm", null),
                  ],
                ),
                Row(
                  children: [
                    buttonBox(Colors.amber, 'assets/images/acorn.png',
                        "Địa điểm", null),
                    buttonBox(
                        Colors.amber, 'assets/airport64.png', "Địa điểm", null),
                    buttonBox(
                        Colors.amber, 'assets/airport64.png', "Địa điểm", null),
                  ],
                ),
                Row(
                  children: [
                    buttonBox(
                        Colors.amber, 'assets/airport64.png', "Địa điểm", null),
                    buttonBox(Colors.amber, 'assets/airport64.png',
                        "Chọn Chuyến", Chooseflight(),
                        padding: EdgeInsets.only(top: 45, right: 20, left: 32)),
                    buttonBox(
                      Colors.amber,
                      'assets/airport64.png',
                      "Chọn lịch",
                      TravelDate(),
                    ),
                  ],
                )
              ],
            ),
          ),
          //

          const SizedBox(
            height: 51.2,
          ),
          //

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
                menuButton('assets/home32.png', 'Trang chủ', null),
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
      ),
      //
    );
  }

  //Nút ô vuông ở giữa
  Widget buttonBox(
    color,
    image,
    text,
    page, {
    EdgeInsets padding = const EdgeInsets.only(top: 45, right: 30, left: 32),
  }) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
            ),
            child: IconButton(
              onPressed: () {
                if (page != null) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => page));
                }
              },
              icon: Image.asset(image),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(text)
        ],
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
                if (page == null) {
                } else {
                  Navigator.push(
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
}
