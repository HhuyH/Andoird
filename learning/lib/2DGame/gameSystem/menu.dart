import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning/2DGame/gameSystem/router.dart';
import 'package:learning/2DGame/gameSystem/score.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

//Menu bắt đầu game
class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final score = Provider.of<Score>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //nút bắt đầu game
            ElevatedButton(
              onPressed: () {
                score.reset();
                context.pushNamed(AppRoute.game.name);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 215, 132, 23), // Màu nền của nút
                foregroundColor: Colors.white, // Màu chữ
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Bo góc cho nút
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 15, horizontal: 20), // Cân chỉnh kích thước nút
                shadowColor: Colors.black.withOpacity(0.3), // Đổ bóng dưới nút
                elevation: 8, // Mức độ đổ bóng
              ),
              child: const Text(
                "Start Game",
                style: TextStyle(
                  fontSize: 24, // Kích thước chữ lớn để nổi bật
                  fontWeight: FontWeight.bold, // Đậm chữ để thu hút
                ),
              ),
            ),
            //

            const SizedBox(height: 20),

            //nút setting
            ElevatedButton(
              onPressed: () {
                //context.pushNamed(AppRoute.setting.name);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 215, 132, 23), // Màu nền của nút
                foregroundColor: Colors.white, // Màu chữ
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Bo góc cho nút
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 15, horizontal: 40), // Cân chỉnh kích thước nút
                shadowColor: Colors.black.withOpacity(0.3), // Đổ bóng dưới nút
                elevation: 8, // Mức độ đổ bóng
              ),
              child: const Text(
                "Setting",
                style: TextStyle(
                  fontSize: 24, // Kích thước chữ lớn để nổi bật
                  fontWeight: FontWeight.bold, // Đậm chữ để thu hút
                ),
              ),
            )
            //
          ],
        ),
      ),
    );
  }
}

//Menu cấu hình
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //nút quay về menu
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoute.menu.name);
              },
              child: const Text("Menu"),
            )
            //
          ],
        ),
      ),
    );
  }
}
