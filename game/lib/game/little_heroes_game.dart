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
            GroupObject(
              name: 'headquarters',
              x: 48,
              y: -48,
              width: 80,
              height: 48,
              children: [
                HorizontalRepeatTiledObject(
                  name: '',
                  tiles: Tile.generateHorizontalList(
                    count: 3,
                    startX: 3,
                    startY: 3,
                  ),
                  height: 16,
                  width: 80,
                  x: 0,
                  y: 0,
                ),
                NineBoxObject(
                  name: '',
                  x: 0,
                  y: 16,
                  width: 80,
                  height: 32,
                  srcPosition: Vector2(0, 48),
                  srcSize: Vector2.all(48),
                ),
              ],
            ),
          ],
          tileset: gameAssets.areasTileset,
        ),
        player: player,
      ),
    );
  }
}
