import 'dart:ui';

import 'package:flame/extensions.dart';

class Tileset {
  const Tileset({
    required this.tileSize,
    required this.image,
  });

  final int tileSize;
  final Image image;

  Future<Image> getSection({
    required Vector2 srcPosition,
    required Vector2 srcSize,
  }) async {
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint();
    final rect = Rect.fromLTWH(
      srcPosition.x,
      srcPosition.y,
      srcSize.x,
      srcSize.y,
    );
    canvas.drawImageRect(
      image,
      rect,
      srcSize.toRect(),
      paint,
    );
    final picture = recorder.endRecording();
    return picture.toImage(
      srcSize.x.toInt(),
      srcSize.y.toInt(),
    );
  }
}
