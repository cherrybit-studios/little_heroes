import 'package:flame/widgets.dart';
import 'package:flutter/material.dart' hide Hero;
import 'package:little_heroes/assets.dart';
import 'package:little_heroes/domain/domain.dart';
import 'package:provider/provider.dart';

class HeroView extends StatelessWidget {
  const HeroView({
    required this.selectedHero,
    this.alignment = Alignment.bottomLeft,
    this.zoom = 8,
    super.key,
  });

  final Hero selectedHero;
  final int zoom;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final assets = context.read<Assets>();

    final size = 16.0 * zoom;

    return Container(
      alignment: alignment,
      height: 16 * (zoom + 1),
      child: SizedBox(
        width: 16 * (zoom + 2),
        height: size,
        child: Stack(
          children: [
            Positioned.fill(
              child: SpriteWidget(
                sprite: assets.getBody(selectedHero.body.index),
              ),
            ),
            Positioned.fill(
              child: SpriteWidget(
                sprite: assets.getOutfit(selectedHero.outfit.index),
              ),
            ),
            if (selectedHero.weapon != null)
              Positioned(
                left: size * .4,
                child: SizedBox(
                  width: size,
                  height: size,
                  child: SpriteWidget(
                    sprite: assets.getWeapon(
                      selectedHero.weapon!.index,
                    ),
                  ),
                ),
              ),
            if (selectedHero.shield != null)
              Positioned(
                left: -(size * .25),
                child: SizedBox(
                  width: size,
                  height: size,
                  child: SpriteWidget(
                    sprite: assets.getShield(
                      selectedHero.shield!.index,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
