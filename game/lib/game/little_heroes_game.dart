import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:little_heroes/assets.dart';
import 'package:little_heroes/domain/domain.dart';
import 'package:little_heroes/game/game.dart';
import 'package:little_heroes/mini_tiles/mini_tiles.dart';

class LittleHeroesGame extends FlameGame with HasKeyboardHandlerComponents {
  LittleHeroesGame({
    required this.player,
    required this.gameAssets,
  });

  final Hero player;
  final Assets gameAssets;

  @override
  FutureOr<void> onLoad() async {
    add(
      GameArea(
        areaMap: TiledMap(
          objects: [
            RepeatTiledObject(
              name: 'ground',
              repeatingTile: const Tile(
                x: 1,
                y: 0,
              ),
              height: 16,
              width: 160,
              x: 0,
              y: 0,
            ),
          ],
          tileset: gameAssets.areasTileset,
        ),
        player: player,
      ),
    );
  }
}
