import 'package:flutter/material.dart';
import 'package:little_heroes/onboard/onboard.dart';
import 'package:little_heroes/widgets/widgets.dart';

class OnboardHeroPage extends StatelessWidget {
  const OnboardHeroPage({super.key});

  static Route<void> route() {
    return GamePageRouteBuilder(
      pageBuilder: (_, __, ___) => const OnboardHeroPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const OnboardHeroView();
  }
}
