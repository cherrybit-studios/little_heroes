import 'package:flutter/material.dart' hide Hero;
import 'package:little_heroes/game_home/view/game_home_page.dart';
import 'package:little_heroes/l10n/l10n.dart';
import 'package:little_heroes/onboard/onboard.dart';
import 'package:little_heroes/title/title.dart';
import 'package:little_heroes/widgets/hero_view.dart';
import 'package:little_heroes/widgets/widgets.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:provider/provider.dart';

class TitleView extends StatelessWidget {
  const TitleView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<TitleCubit>().state;
    return GameScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/banner.png',
            width: 360,
          ),
          Stack(
            children: [
              Image.asset(
                'assets/images/forest.png',
                fit: BoxFit.contain,
              ),
              if (state.hero != null)
                Positioned(
                  top: 96,
                  left: 36,
                  child: HeroView(
                    zoom: 2,
                    selectedHero: state.hero!,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          NesContainer(
            width: 230,
            child: NesSelectionList(
              onSelect: (i) {
                if (i == 0 && state.hero != null) {
                  Navigator.of(context).pushReplacement(
                    GameHomePage.route(),
                  );
                } else if (i == 0 && state.hero == null) {
                  Navigator.of(context).pushReplacement(
                    OnboardPage.route(),
                  );
                }
              },
              children: [
                if (state.hero != null) Text(l10n.continueLabel),
                Text(l10n.newGame),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
