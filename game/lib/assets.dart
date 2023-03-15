import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart' hide Image;

class Assets {
  Assets._(
    this._bodies,
    this._outfits,
    this._gears,
    this.scrollTileset,
  );

  final SpriteSheet _bodies;
  final SpriteSheet _outfits;
  final SpriteSheet _gears;
  final Image scrollTileset;

  static Future<Assets> load() async {
    final bodiesImage = await Flame.images.load('bodies.png');
    final outfitsImage = await Flame.images.load('outfits.png');
    final gearImage = await Flame.images.load('gear.png');

    // Apparently flame overhide the destTileSize from the nine tile box
    // widget, so doing this as a small workaroujd for now, gonna open
    // a PR for flame eventually.
    final originalScrollTileset = await Flame.images.load('scroll-tileset.png');
    final recorder = PictureRecorder();
    Canvas(recorder).drawImageRect(
      originalScrollTileset,
      const Rect.fromLTWH(0, 0, 48, 48),
      const Rect.fromLTWH(0, 0, 144, 144),
      Paint()..color = Colors.white,
    );
    final picture = recorder.endRecording();
    final scrollTileset = await picture.toImage(144, 144);

    final assets = Assets._(
      SpriteSheet.fromColumnsAndRows(
        image: bodiesImage,
        rows: 1,
        columns: 5,
      ),
      SpriteSheet.fromColumnsAndRows(
        image: outfitsImage,
        rows: 8,
        columns: 1,
      ),
      SpriteSheet.fromColumnsAndRows(
        image: gearImage,
        rows: 2,
        columns: 6,
      ),
      scrollTileset,
    );

    return assets;
  }

  Sprite getBody(int i) {
    return _bodies.getSpriteById(i);
  }

  Sprite getOutfit(int i) {
    return _outfits.getSpriteById(i);
  }

  Sprite getWeapon(int i) {
    return _gears.getSpriteById(i);
  }

  Sprite getShield(int i) {
    return _gears.getSpriteById(6 + i);
  }
}
