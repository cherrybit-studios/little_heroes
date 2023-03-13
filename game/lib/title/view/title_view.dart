import 'package:flutter/material.dart' hide Hero;
import 'package:little_heroes/l10n/l10n.dart';
import 'package:little_heroes/widgets/widgets.dart';
import 'package:nes_ui/nes_ui.dart';

class TitleView extends StatelessWidget {
  const TitleView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
              // TODO(erickzanardo): should not be hardcoded
              // const Positioned(
              //   top: 96,
              //   left: 36,
              //   child: HeroView(
              //     zoom: 2,
              //     selectedHero: Hero(
              //       name: '',
              //       body: Body.human1,
              //       outfit: Outfit.mage,
              //       shield: null,
              //       weapon: null,
              //     ),
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 8),
          NesContainer(
            width: 230,
            child: NesSelectionList(
              onSelect: (i) {},
              children: [
                Text(l10n.play),
                Text(l10n.party),
                Text(l10n.settings),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
