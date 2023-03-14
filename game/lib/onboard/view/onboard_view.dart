import 'package:flutter/material.dart';
import 'package:little_heroes/l10n/l10n.dart';
import 'package:little_heroes/onboard/onboard.dart';
import 'package:little_heroes/widgets/widgets.dart';
import 'package:nes_ui/nes_ui.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GameScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _Scroll(),
          NesButton(
            type: NesButtonType.primary,
            onPressed: () {
              Navigator.of(context).push(
                OnboardHeroPage.route(),
              );
            },
            child: Text(l10n.continueLabel),
          ),
        ],
      ),
    );
  }
}

class _Scroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SlideIn(
      child: ScrollContainer(
        child: Text(
          l10n.onboardWelcomeScroll,
        ),
      ),
    );
  }
}
