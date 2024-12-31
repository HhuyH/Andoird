import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'order.dart';
import 'profile.dart';

class TravelDate extends StatefulWidget {
  const TravelDate({super.key});

  @override
  State<TravelDate> createState() => _TravelDateState();
}

class _TravelDateState extends State<TravelDate> {
  final TextEditingController _dateDepController =
      TextEditingController(); //biến lưu dữ liệu ngày đi
  final TextEditingController _dateRetController =
      TextEditingController(); //biến lưu dữ liệu ngày về
  bool selectDate = true;
  DateTime depDate = DateTime.now(); // Chọn ngày đi
  DateTime retDate = DateTime.now(); // chọn ngày về

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Chữ ngày du lịch ở trên đầu
          Padding(
            padding: EdgeInsets.only(top: 70, bottom: 50),
            child: Text(
              "Lịch du lịch",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold, // in đậm
                fontStyle: FontStyle.italic, // kiểu chữ
              ),
            ),
          ),
          //

          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  //button hiện ngày đi
                  Text("Ngày đi"),
                  //nút ngày đi
                  OutlinedButton(
                      onPressed: () {
                        selectDate = true;
                      },
                      child: Text(_dateDepController.text)),
                ],
              ),
              //
              const SizedBox(
                width: 40,
              ),

              // nút ngày về
              Column(
                children: [
                  //button hiện ngày về
                  Text("Ngày về"),
                  OutlinedButton(
                      onPressed: () {
                        selectDate = false;
                      },
                      child: Text(_dateRetController.text)),
                ],
              )
            ],
          ),
          //
          const SizedBox(
            height: 50,
          ),

          // Calendar để chọn ngày
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFFFDEE9), Color(0xFFB5FFFC)],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: TableCalendar(
                      focusedDay: depDate,
                      firstDay: DateTime(2000),
                      lastDay: DateTime(2100),
                      // hiện ngày đi ngày về đã chọn
                      selectedDayPredicate: (day) {
                        return isSameDay(depDate, day) ||
                            isSameDay(retDate,
                                day); // hiện ngày đi và ngày về trên lịch
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          if (selectDate) {
                            depDate = selectedDay;
                            _dateDepController.text = "${selectedDay.toLocal()}"
                                .split(" ")[0]; // Đặt ngày đi
                          } else {
                            //kiem tra neu ngay ve truoc ngay di thi thong bao
                            if (selectedDay.isBefore(depDate)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("Ngày về phải sau ngày đi")),
                              );
                            } else {
                              retDate = selectedDay;
                              _dateRetController.text =
                                  "${selectedDay.toLocal()}"
                                      .split(" ")[0]; // Đặt ngày về
                            }
                          }
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          //

          const SizedBox(
            height: 92.23,
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
  }
//
}
