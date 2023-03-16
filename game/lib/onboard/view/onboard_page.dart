import 'package:flutter/material.dart';
import 'package:little_heroes/onboard/onboard.dart';
import 'package:little_heroes/widgets/widgets.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  static Route<void> route() {
    return GamePageRouteBuilder(
      pageBuilder: (_, __, ___) => const OnboardPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const OnboardView();
  }
}
