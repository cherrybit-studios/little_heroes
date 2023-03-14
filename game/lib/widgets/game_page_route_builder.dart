import 'package:flutter/material.dart';
import 'package:little_heroes/widgets/widgets.dart';

class GamePageRouteBuilder<T> extends PageRouteBuilder<T> {
  GamePageRouteBuilder({
    required super.pageBuilder,
    super.settings,
    int seed = 0,
  }) : super(
          reverseTransitionDuration: const Duration(milliseconds: 750),
          transitionDuration: const Duration(milliseconds: 750),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SceneCloseTransition(
              animation: animation,
              seed: seed,
              child: child,
            );
          },
        );
}

class SceneCloseTransition extends StatelessWidget {
  const SceneCloseTransition({
    required this.animation,
    required this.child,
    required this.seed,
    super.key,
  });

  final Animation<double> animation;

  final Widget child;

  final int seed;

  @override
  Widget build(BuildContext context) {
    if (animation.value == 1) {
      return child;
    }

    final height = MediaQuery.of(context).size.height;
    final half = height / 2;

    const color = GameColors.mainBackgroundColor;

    return Stack(
      children: [
        if (animation.value >= .5) Positioned.fill(child: child),
        if (animation.value <= .5) ...[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: half * (animation.value * 2),
            child: const ColoredBox(color: color),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: height - (half * animation.value * 2),
            child: const ColoredBox(color: color),
          )
        ] else ...[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: half * ((1 - animation.value) * 2),
            child: const ColoredBox(color: color),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: height - (half * (1 - animation.value) * 2),
            child: const ColoredBox(color: color),
          )
        ]
      ],
    );
  }
}
