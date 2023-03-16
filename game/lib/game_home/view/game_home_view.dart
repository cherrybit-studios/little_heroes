import 'package:flutter/material.dart';
import 'package:little_heroes/game_home/game_home.dart';
import 'package:little_heroes/widgets/hero_view.dart';
import 'package:little_heroes/widgets/widgets.dart';
import 'package:provider/provider.dart';

class GameHomeView extends StatelessWidget {
  const GameHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameHomeCubit>().state;
    return GameScaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Ready to play the game'),
            if (state.hero != null)
              HeroView(
                selectedHero: state.hero!,
              ),
          ],
        ),
      ),
    );
  }
}
