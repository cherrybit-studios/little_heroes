import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:little_heroes/assets.dart';
import 'package:little_heroes/game/game.dart';
import 'package:little_heroes/game_home/game_home.dart';
import 'package:little_heroes/widgets/widgets.dart';
import 'package:provider/provider.dart';

class GameHomeView extends StatelessWidget {
  const GameHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final assets = context.read<Assets>();
    final state = context.watch<GameHomeCubit>().state;
    return GameScaffold(
      body: state.hero != null
          ? ClipRect(
              child: GameWidget.controlled(
                gameFactory: () {
                  return LittleHeroesGame(
                    gameAssets: assets,
                    player: state.hero!,
                  );
                },
              ),
            )
          : const SizedBox(),
    );
  }
}
