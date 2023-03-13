import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:little_heroes/assets.dart';
import 'package:little_heroes/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ScrollContainer extends StatelessWidget {
  const ScrollContainer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final assets = context.read<Assets>();

    return NineTileBoxWidget(
      image: assets.scrollTileset,
      destTileSize: 0, // Weird flame bug.
      tileSize: 48,
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: GameColors.gameBackgroundColor,
                  ) ??
              const TextStyle(),
          child: child,
        ),
      ),
    );
  }
}
