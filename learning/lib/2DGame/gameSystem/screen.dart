import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning/2DGame/constants.dart';
import 'package:learning/2DGame/gameSystem/endmenu.dart';
import 'package:learning/2DGame/gameSystem/nutty_acorn.dart';
import 'package:learning/2DGame/gameSystem/router.dart';
import 'package:learning/2DGame/gameSystem/score.dart';
import 'package:provider/provider.dart';
//import 'package:flame_audio/flame_audio.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final GoAcorn game;

  @override
  void initState() {
    super.initState();
    final score = Provider.of<Score>(context, listen: false);
    // FlameAudio.bgm.initialize();
    // FlameAudio.bgm.play('bensound-perfectflow.mp3', volume: 0.2);
    game = GoAcorn(
      score: score,
      endCallback: () {
        context.goNamed(AppRoute.end.name);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FittedBox(
            child: SizedBox(
              width: gameWidth,
              height: gameHeight,
              child: GameWidget(
                game: game,
                overlayBuilderMap: {
                  'EndMenuOverlay': (context, game) => EndMenu(),
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
