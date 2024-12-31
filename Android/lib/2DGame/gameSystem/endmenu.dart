import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning/2DGame/constants.dart';
import 'package:learning/2DGame/gameSystem/router.dart';
import 'package:learning/2DGame/gameSystem/score.dart';
import 'package:learning/2DGame/gameSystem/world.dart';
import 'package:provider/provider.dart';

class EndMenu extends StatefulWidget {
  const EndMenu({super.key});

  @override
  State<EndMenu> createState() => _EndMenuState();
}

class _EndMenuState extends State<EndMenu> {
  @override
  Widget build(BuildContext context) {
    final score = Provider.of<Score>(context);
    return Center(
      child: Stack(children: [
        // Lớp bán trong suốt mờ nền
        Container(
          color: Colors.black.withOpacity(0.6),
        ),

        // Nội dung menu
        Center(
            child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text("Game Over",
                style: TextStyle(fontSize: 170, color: Colors.white)),
            const SizedBox(
              height: 900,
            ),
            Text(
              "Point: ${score.score}",
              style: TextStyle(fontSize: 125, color: Colors.white),
            ),

            //nút chơi lại
            ElevatedButton(
              onPressed: () {
                context.pushNamed(AppRoute.game.name);

                score.reset();
                timeToIncPoint = 2.0;
                GoAcornWorld.stopObstacles = false;
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 215, 132, 23), // Màu nền của nút
                foregroundColor: Colors.white, // Màu chữ
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25), // Bo góc cho nút
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 20, horizontal: 50), // Cân chỉnh kích thước nút
                shadowColor: Colors.black.withOpacity(0.3), // Đổ bóng dưới nút
                elevation: 8, // Mức độ đổ bóng
              ),
              child: const Text(
                "Player Agian",
                style: TextStyle(
                  fontSize: 100, // Kích thước chữ lớn để nổi bật
                  fontWeight: FontWeight.bold, // Đậm chữ để thu hút
                ),
              ),
            ),
            //

            SizedBox(
              height: 50,
            ),

            //nút quay về menu
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoute.menu.name);
                score.reset();
                timeToIncPoint = 2.0;
                GoAcornWorld.stopObstacles = false;
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 215, 132, 23), // Màu nền của nút
                foregroundColor: Colors.white, // Màu chữ
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25), // Bo góc cho nút
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 20, horizontal: 210), // Cân chỉnh kích thước nút
                shadowColor: Colors.black.withOpacity(0.3), // Đổ bóng dưới nút
                elevation: 8, // Mức độ đổ bóng
              ),
              child: const Text(
                "Menu",
                style: TextStyle(
                  fontSize: 100, // Kích thước chữ lớn để nổi bật
                  fontWeight: FontWeight.bold, // Đậm chữ để thu hút
                ),
              ),
            ),
            //
          ],
        )),
      ]),
    );
  }
}
