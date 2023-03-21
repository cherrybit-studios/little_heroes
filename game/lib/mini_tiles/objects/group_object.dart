import 'package:flame/components.dart';
import 'package:little_heroes/mini_tiles/objects/objects.dart';
import 'package:little_heroes/mini_tiles/tileset.dart';

class GroupObject extends TiledObject {
  GroupObject({
    required super.name,
    required super.x,
    required super.y,
    required super.width,
    required super.height,
    required this.children,
  });

  final List<TiledObject> children;

  @override
  Future<PositionComponent> toSpriteComponent(Tileset tileset) async {
    final childrenComponents = await Future.wait(
      children.map((child) => child.toSpriteComponent(tileset)),
    );

    return PositionComponent(
      position: Vector2(x.toDouble(), y.toDouble()),
      size: Vector2(width.toDouble(), height.toDouble()),
      children: childrenComponents,
    );
  }
}
