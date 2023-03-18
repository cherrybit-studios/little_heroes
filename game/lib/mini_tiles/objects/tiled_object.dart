import 'package:flame/components.dart';
import 'package:little_heroes/mini_tiles/mini_tiles.dart';

abstract class TiledObject {
  const TiledObject({
    required this.name,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });

  final String name;
  final int x;
  final int y;
  final int width;
  final int height;

  Future<PositionComponent> toSpriteComponent(Tileset tileset);
}
