import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:little_heroes/domain/models/hero.dart';
import 'package:little_heroes/game/game.dart';
import 'package:little_heroes/mini_tiles/mini_tiles.dart';

class GameArea extends PositionComponent with HasGameRef<LittleHeroesGame> {
  GameArea({
    required this.areaMap,
    required this.player,
  });

  final TiledMap areaMap;
  final Hero player;

  late final GameHero playerComponent;
  late final TiledObject groundObject;

  @override
  FutureOr<void> onLoad() async {
    groundObject = areaMap.objects.firstWhere(
      (o) => o.name == 'ground',
    );

    // 92d3ff sky is blue
    // I am blue, da de dara da
    // TODO(erickzanardo): This could be a component on its own!
    add(
      RectangleComponent(
        position: Vector2(
          groundObject.x.toDouble(),
          groundObject.y - 160,
        ),
        size: Vector2(
          groundObject.width.toDouble(),
          160,
        ),
        paint: Paint()..color = const Color(0xFF92D3FF),
      ),
    );

    final mapComponents = await Future.wait(
      areaMap.objects.map(
        (o) => o.toSpriteComponent(areaMap.tileset),
      ),
    );

    unawaited(addAll(mapComponents));

    add(
      playerComponent = GameHero(
        hero: player,
      )..onTopOf = groundObject,
    );

    gameRef.camera.zoom = 4;
    gameRef.camera.followComponent(playerComponent);
  }
}
