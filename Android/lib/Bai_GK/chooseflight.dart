import 'package:flutter/material.dart';
import 'profile.dart';
import 'order.dart';

class Chooseflight extends StatefulWidget {
  const Chooseflight({super.key});

  @override
  State<Chooseflight> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Chooseflight> {
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
                    )),
                child: Column(children: [
                  //Chữ chọn chuyến bay ở trên đầu
                  Padding(
                      padding: EdgeInsets.only(
                          top: 50, right: 50, left: 50, bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Chọn chuyến bay",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold, // in đậm
                              fontStyle: FontStyle.italic, // kiểu chữ
                            ),
                          ),
                        ],
                      )),
                  //

                  //container nut ngay di va ve
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF6699FF), Color(0xFF0033FF)],
                    )),
                    child: //
                        Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //nút ngày đi
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  //button hiện ngày đi
                                  Text(
                                    "Ngày đi",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  //nút ngày đi
                                  OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                        color: Colors.black, // Màu viền
                                        width: 2.0, // Độ dày viền
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8), // Tùy chỉnh góc bo viền
                                      ),
                                    ),
                                    child: Text(
                                      "9/9/2077",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),

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

                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/rowarrows24.png',
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        //nút ngày về
                        Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(5),
                                child: // nút ngày về
                                    Column(
                                  children: [
                                    //button hiện ngày về
                                    Text(
                                      "Ngày về",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                            color: Colors.black, // Màu viền
                                            width: 2.0, // Độ dày viền
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                8), // Tùy chỉnh góc bo viền
                                          ),
                                        ),
                                        child: Text(
                                          "7/7/2099",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        )),
                                  ],
                                )
                                //,
                                )
                          ],
                        )
                        //
                      ],
                    ),
                    //
                  ),
                  //

                  //Hàm chứa lịch chuyến bay
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 300,
                        width: 450, // Đặt màu nền với độ trong suốt
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      //gọi hàm chuyến bay FlightList(Mã màu 1 2, giờ đi, tổng giờ đi,
                                      //điểm nhận được, loại chuyến bay)
                                      FilghtList(
                                          Color.fromARGB(255, 174, 15, 205),
                                          Color(0xFFFFA54F),
                                          '05.00 - 6.30 GMT',
                                          '1h30',
                                          20,
                                          'Direct'),
                                      FilghtList(
                                          Color.fromARGB(255, 195, 26, 40),
                                          Color(0xFFFFA54F),
                                          '05.00 - 6.30 GMT',
                                          '1h30',
                                          40,
                                          'Direct'),
                                      FilghtList(
                                          Color.fromARGB(255, 26, 40, 195),
                                          Color(0xFFFFA54F),
                                          '05.00 - 6.30 GMT',
                                          '1h30',
                                          30,
                                          'Direct'),
                                      FilghtList(
                                          Color.fromARGB(255, 195, 26, 40),
                                          Color(0xFFFFA54F),
                                          '05.00 - 6.30 GMT',
                                          '1h30',
                                          10,
                                          'Direct'),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //

                  const SizedBox(
                    height: 30,
                  ),

                  //Nút bộc lọc và xếp
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Bộ lọc
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(150, 45),
                            backgroundColor: Color(0xFF00B2EE), // Màu nền
                            //Điều chỉnh góc bo cho button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Bo góc
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Bộ lọc",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              Image.asset("assets/filter16.png"),
                            ],
                          )),
                      //

                      const SizedBox(
                        width: 20,
                      ),

                      //Nút xếp theo giá
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(150, 45),
                            backgroundColor: Color(0xFF00B2EE), // Màu nền
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Bo góc
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Xếp theo giá",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              Image.asset("assets/filter16.png"),
                            ],
                          ))
                      //
                    ],
                  )
                  //
                ]),
              ),
              //
            ),
            //

            const SizedBox(
              height: 66.2,
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

  //Box chuyen bay
  Widget FilghtList(
      badgeColor1, badgeColor2, timeDepRet, totalTime, point, FlightType) {
    return //chuyến bay
        Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black),
          ),
        ),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Air Airlines",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(timeDepRet),
                Text(totalTime),
                Text(FlightType),
              ],
            ),
            const SizedBox(
              width: 70,
            ),
            //
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '400.000/pax',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: const Color.fromARGB(255, 183, 36, 36)),
                ),
                Text("earn $point Points"),
              ],
            ),
            //
          ],
        ),
      ),
    );
    //
  }
  //
}
