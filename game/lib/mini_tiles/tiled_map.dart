import 'package:little_heroes/mini_tiles/mini_tiles.dart';

class TiledMap {
  TiledMap({
    required this.objects,
    required this.tileset,
  });

  final List<TiledObject> objects;
  final Tileset tileset;
}
