import 'dart:ui';

import 'package:flame/components.dart';
import 'package:little_heroes/mini_tiles/mini_tiles.dart';

class RepeatTiledObject extends TiledObject {
  RepeatTiledObject({
    required super.name,
    required super.x,
    required super.y,
    required super.width,
    required super.height,
    required this.repeatingTile,
  });

  final Tile repeatingTile;

  @override
  Future<PositionComponent> toSpriteComponent(Tileset tileset) async {
    final tile = Sprite(
      tileset.image,
      srcPosition: Vector2(
        (repeatingTile.x * tileset.tileSize).toDouble(),
        (repeatingTile.y * tileset.tileSize).toDouble(),
      ),
      srcSize: Vector2.all(tileset.tileSize.toDouble()),
    );

    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);

    for (var y = 0; y < height; y += tileset.tileSize) {
      for (var x = 0; x < width; x += tileset.tileSize) {
        tile.render(
          canvas,
          position: Vector2(
            x.toDouble(),
            y.toDouble(),
          ),
        );
      }
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
