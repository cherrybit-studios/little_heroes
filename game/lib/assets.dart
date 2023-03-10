import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

class Assets {
  Assets._(
    this._bodies,
    this._outfits,
    this._gears,
  );

  final SpriteSheet _bodies;
  final SpriteSheet _outfits;
  final SpriteSheet _gears;

  static Future<Assets> load() async {
    final bodiesImage = await Flame.images.load('bodies.png');
    final outfitsImage = await Flame.images.load('outfits.png');
    final gearImage = await Flame.images.load('gear.png');

    final assets = Assets._(
      SpriteSheet.fromColumnsAndRows(
        image: bodiesImage,
        rows: 1,
        columns: 5,
      ),
      SpriteSheet.fromColumnsAndRows(
        image: outfitsImage,
        rows: 7,
        columns: 1,
      ),
      SpriteSheet.fromColumnsAndRows(
        image: gearImage,
        rows: 2,
        columns: 6,
      ),
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
