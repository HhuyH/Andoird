import 'package:flutter/material.dart';

import 'addexercise.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  List<Map<String, String>> exercises = []; // Danh sách bài tập

  // Hàm này sẽ được gọi khi có bài tập mới từ màn hình "Add Exercise"
  void _addExercise(Map<String, String> newExercise) {
    setState(() {
      exercises.add(newExercise);
    });
  }
  //

  //
  @override
  Widget build(BuildContext context) {
    int totalDuration =
        exercises.fold(0, (sum, item) => sum + int.parse(item['duration']!));
    int totalCalories =
        exercises.fold(0, (sum, item) => sum + int.parse(item['calories']!));

    //
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today"),
      ),
      //

      //
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //gọi ô vuông dài
            longSquare("Today's Progress! 😴",
                const Color.fromARGB(255, 66, 112, 193)),
            //

            //
            const SizedBox(
              height: 20,
            ),
            //

            //gọi box mục đích
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                goalBox('Current Goal', '$totalDuration min'),
                goalBox('Current Total', '$totalCalories cal'),
              ],
            ),

            //
            const SizedBox(
              height: 20,
            ),
            //

            //gọi hình chữ nhật bó góc
            const SizedBox(height: 10),
            longSquare("𓇢𓆸 Today's Activity!",
                const Color.fromARGB(255, 218, 115, 220)),
            //
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 300, width: 450, // Đặt màu nền với độ trong suốt
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 147, 147, 153),
                    borderRadius: BorderRadius.circular(10), // Bo tròn các góc
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: exercises.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(
                                  10), // Khoảng cách giữa các phần tử
                              child: activityBox(
                                exercises[index]['name']!,
                                "Duration: ${exercises[index]['duration']} min\n"
                                "Calories: ${exercises[index]['calories']} cal",
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Box hiển thị danh sách bài tập

            Row(
              children: [
                //
                const SizedBox(
                  width: 50,
                ),

                //nút thêm bài tập
                ElevatedButton(
                  onPressed: () async {
                    // Điều hướng đến trang thêm bài tập
                    final newExercise = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddExercise()),
                    );
                    if (newExercise != null) {
                      _addExercise(newExercise);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(
                          130, 50), // Đặt kích thước tối thiểu cho nút
                      backgroundColor:
                          const Color.fromARGB(189, 166, 121, 177)),
                  child: const Text(
                    "Add Exercise",
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
                  width: 30,
                ),
                //

                //nút refresh
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(
                          130, 50), // Đặt kích thước tối thiểu cho nút
                      backgroundColor: const Color.fromARGB(189, 225, 35, 225)),
                  child: const Text(
                    "Refresh",
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
                  width: 50,
                ),
                //

                //
              ],
            ),

            //
            Column(
              children: [
                //
                const SizedBox(
                  height: 10,
                ),
                //

                //nút view profile
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(
                          150, 50), // Đặt kích thước tối thiểu cho nút
                      backgroundColor: const Color.fromARGB(189, 20, 20, 215)),
                  child: const Text(
                    "View profile",
                    style: TextStyle(
                      color: Colors.white, // Màu chữ
                      fontSize: 16.0, // Kích thước chữ
                      fontWeight: FontWeight.bold, // Độ đậm chữ
                    ),
                  ),
                ),
                //
                const SizedBox(
                  height: 10,
                ),
                //

                //nút logout
                ElevatedButton(
                  onPressed: () {
                    // Điều hướng đến Home khi nhấn nút "Log out"
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(
                          150, 50), // Đặt kích thước tối thiểu cho nút
                      backgroundColor: const Color.fromARGB(189, 227, 44, 44)),
                  child: const Text(
                    "Log out",
                    style: TextStyle(
                      color: Colors.white, // Màu chữ
                      fontSize: 16.0, // Kích thước chữ
                      fontWeight: FontWeight.bold, // Độ đậm chữ
                    ),
                  ),
                ),

                //
                const SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ),
      //
    );
  }

  //ô vuông có bo góc dài
  Widget longSquare(String text, Color color) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(13), // Bo tròn các góc
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0, // Kích thước chữ
          fontWeight: FontWeight.bold, // Độ đậm chữ
        ), // Đặt màu chữ cho dễ nhìn
      ),
    );
    //
  }

  //ô vuông cho box mục đích trong ngày
  Widget goalBox(String title, String value) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  //box cho o muc tieu hoat dong vua tao
  Widget activityBox(String activity, String details) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            activity,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(details),
        ],
      ),
    );
  }
}
