import 'package:flutter/material.dart' hide Hero;
import 'package:little_heroes/domain/domain.dart';
import 'package:little_heroes/onboard/onboard.dart';
import 'package:little_heroes/widgets/widgets.dart';

class OnboardAttributesSelectionPage extends StatelessWidget {
  const OnboardAttributesSelectionPage({
    required this.hero,
    super.key,
  });

  final Hero hero;

  static Route<void> route(Hero hero) {
    return GamePageRouteBuilder(
      pageBuilder: (_, __, ___) => OnboardAttributesSelectionPage(
        hero: hero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OnboardAttributesSelectionView(hero: hero);
  }
}
