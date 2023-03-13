import 'package:flutter/material.dart';
import 'package:little_heroes/l10n/l10n.dart';
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
            onPressed: () {},
            child: Text(l10n.continueLabel),
          ),
        ],
      ),
    );
  }
}

class _Scroll extends StatefulWidget {
  @override
  State<_Scroll> createState() => _ScrollState();
}

class _ScrollState extends State<_Scroll> with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    duration: const Duration(milliseconds: 250),
    vsync: this,
  );
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Transform.scale(
      alignment: Alignment.topCenter,
      scaleY: 1 * animation.value,
      child: ScrollContainer(
        child: Text(
          l10n.onboardWelcomeScroll,
        ),
      ),
    );
  }
}
