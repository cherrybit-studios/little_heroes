import 'dart:ui';

import 'package:flame/components.dart';
import 'package:little_heroes/mini_tiles/objects/objects.dart';
import 'package:little_heroes/mini_tiles/tileset.dart';

class NineBoxObject extends TiledObject {
  NineBoxObject({
    required super.name,
    required super.x,
    required super.y,
    required super.width,
    required super.height,
    required this.srcPosition,
    required this.srcSize,
  });

  final Vector2 srcPosition;
  final Vector2 srcSize;

  @override
  Future<PositionComponent> toSpriteComponent(Tileset tileset) async {
    final section = await tileset.getSection(
      srcPosition: srcPosition,
      srcSize: srcSize,
    );

    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);

    final tileSize = srcSize.x / 3;

    final middleSprite = Sprite(
      section,
      srcPosition: Vector2.all(tileSize),
      srcSize: Vector2.all(tileSize),
    );

    final topSprite = Sprite(
      section,
      srcPosition: Vector2(tileSize, 0),
      srcSize: Vector2(tileSize, tileSize),
    );

    final bottomSprite = Sprite(
      section,
      srcPosition: Vector2(tileSize, tileSize * 2),
      srcSize: Vector2(tileSize, tileSize),
    );

    final leftSprite = Sprite(
      section,
      srcPosition: Vector2(0, tileSize),
      srcSize: Vector2(tileSize, tileSize),
    );

    final rightSprite = Sprite(
      section,
      srcPosition: Vector2(tileSize * 2, tileSize),
      srcSize: Vector2(tileSize, tileSize),
    );

    final topLeftSprite = Sprite(
      section,
      srcPosition: Vector2(0, 0),
      srcSize: Vector2(tileSize, tileSize),
    );

    final topRightSprite = Sprite(
      section,
      srcPosition: Vector2(tileSize * 2, 0),
      srcSize: Vector2(tileSize, tileSize),
    );

    final bottomLeftSprite = Sprite(
      section,
      srcPosition: Vector2(0, tileSize * 2),
      srcSize: Vector2(tileSize, tileSize),
    );

    final bottomRightSprite = Sprite(
      section,
      srcPosition: Vector2(tileSize * 2, tileSize * 2),
      srcSize: Vector2(tileSize, tileSize),
    );

    for (var y = 0.0; y < height; y += tileSize.toInt()) {
      for (var x = 0.0; x < width; x += tileSize.toInt()) {
        final isTop = y == 0;
        final isBottom = y + tileSize.toInt() >= height;
        final isLeft = x == 0;
        final isRight = x + tileSize.toInt() >= width;

        if (isTop) {
          topSprite.render(
            canvas,
            position: Vector2(x, y),
            size: Vector2.all(tileSize),
          );
        }

        if (isBottom) {
          bottomSprite.render(
            canvas,
            position: Vector2(x, y),
            size: Vector2.all(tileSize),
          );
        }

        if (isLeft) {
          leftSprite.render(
            canvas,
            position: Vector2(x, y),
            size: Vector2.all(tileSize),
          );
        }

        if (isRight) {
          rightSprite.render(
            canvas,
            position: Vector2(x, y),
            size: Vector2.all(tileSize),
          );
        }

        if (isTop && isLeft) {
          topLeftSprite.render(
            canvas,
            position: Vector2(x, y),
            size: Vector2.all(tileSize),
          );
        }

        if (isTop && isRight) {
          topRightSprite.render(
            canvas,
            position: Vector2(x, y),
            size: Vector2.all(tileSize),
          );
        }

        if (isBottom && isLeft) {
          bottomLeftSprite.render(
            canvas,
            position: Vector2(x, y),
            size: Vector2.all(tileSize),
          );
        }

        if (isBottom && isRight) {
          bottomRightSprite.render(
            canvas,
            position: Vector2(x, y),
            size: Vector2.all(tileSize),
          );
        }

        if (!isTop && !isBottom && !isLeft && !isRight) {
          middleSprite.render(
            canvas,
            position: Vector2(x, y),
            size: Vector2.all(tileSize),
          );
        }
      }
    }

    final image = await recorder.endRecording().toImage(width, height);

    return SpriteComponent(
      sprite: Sprite(image),
      position: Vector2(x.toDouble(), y.toDouble()),
      size: Vector2(width.toDouble(), height.toDouble()),
    );
  }
}
