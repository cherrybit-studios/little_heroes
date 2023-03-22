import 'package:flame/components.dart';
import 'package:little_heroes/mini_tiles/mini_tiles.dart';

class SingleTileObject extends TiledObject {
  SingleTileObject({
    required super.name,
    required super.x,
    required super.y,
    required super.width,
    required super.height,
    required this.tile,
  });

  final Tile tile;

  @override
  Future<PositionComponent> toSpriteComponent(Tileset tileset) async {
    final sprite = tileset.tileToSprite(tile);

    return SpriteComponent(
      sprite: sprite,
      position: Vector2(x.toDouble(), y.toDouble()),
      size: Vector2(width.toDouble(), height.toDouble()),
    );
  }
}
