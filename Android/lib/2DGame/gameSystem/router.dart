import 'package:go_router/go_router.dart';
import 'package:learning/2DGame/gameSystem/endmenu.dart';
import 'package:learning/2DGame/gameSystem/menu.dart';
import 'package:learning/2DGame/gameSystem/nutty_acorn.dart';
import 'package:learning/2DGame/gameSystem/screen.dart';

enum AppRoute { menu, game, setting, end }

late final GoAcorn game;
GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/menu',
    routes: <RouteBase>[
      //bắt đầu game
      GoRoute(
        path: '/game',
        name: AppRoute.game.name,
        // builder: (context, state) {
        //   return const GameScreen();
        // },
        //chuyển màng hình mà ko có dấu hiệu
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const GameScreen(),
        ),
      ),
      //

      //chuyển về menu
      GoRoute(
        path: '/menu',
        name: AppRoute.menu.name,
        // builder: (context, state) {
        //   return const MenuScreen();
        // },
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const MenuScreen(),
        ),
      ),
      //

      //chuyển nút setting
      GoRoute(
        path: '/setting',
        name: AppRoute.setting.name,
        //chuyển màng hình mà ko có dấu hiệu
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const SettingScreen(),
        ),
      ),
      //

      //chuyển qua menu kết thức game
      GoRoute(
        path: '/end',
        name: AppRoute.end.name,
        //chuyển màng hình mà ko có dấu hiệu
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: EndMenu(),
        ),
      ),
      //
    ],
  );
}
