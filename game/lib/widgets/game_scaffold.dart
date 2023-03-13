import 'package:flutter/material.dart';
import 'package:little_heroes/widgets/widgets.dart';
import 'package:nes_ui/nes_ui.dart';

class GameScaffold extends StatelessWidget {
  const GameScaffold({
    required this.body,
    super.key,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NesContainer(
          backgroundColor: GameColors.gameBackgroundColor,
          width: 800,
          height: 600,
          child: body,
        ),
      ),
    );
  }
}
