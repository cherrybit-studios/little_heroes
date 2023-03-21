import 'dart:ui';

import 'package:flame/components.dart';
import 'package:little_heroes/mini_tiles/mini_tiles.dart';

class HorizontalRepeatTiledObject extends TiledObject {
  HorizontalRepeatTiledObject({
    required super.name,
    required super.x,
    required super.y,
    required super.width,
    required super.height,
    required this.tiles,
  }) : assert(
          tiles.length == 3,
          'HorizontalRepeatTiledObject must have 3 tiles',
        );

  final List<Tile> tiles;

  @override
  Future<PositionComponent> toSpriteComponent(Tileset tileset) async {
    final sprites = tiles.map((tile) => tileset.tileToSprite(tile)).toList();

    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);

    for (var x = 0; x < width; x += tileset.tileSize) {
      final isFirst = x == 0;
      final isLast = x + tileset.tileSize >= width;

      final tile = isFirst
          ? sprites[0]
          : isLast
              ? sprites[2]
              : sprites[1];

      // ignore: cascade_invocations
      tile.render(
        canvas,
        position: Vector2(
          x.toDouble(),
          y.toDouble(),
        ),
      );
    }

    final picture = recorder.endRecording();
    final image = await picture.toImage(width, height);
    return SpriteComponent.fromImage(
      image,
      position: Vector2(x.toDouble(), y.toDouble()),
      size: Vector2(width.toDouble(), height.toDouble()),
    );
  }
}
