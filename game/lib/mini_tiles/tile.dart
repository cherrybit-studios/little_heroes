class Tile {
  const Tile({
    required this.x,
    required this.y,
  });

  final int x;
  final int y;

  static List<Tile> generateHorizontalList({
    required int count,
    int startX = 0,
    int startY = 0,
  }) {
    return List.generate(
      count,
      (index) => Tile(
        x: startX + index,
        y: startY,
      ),
    );
  }

  @override
  String toString() => 'Tile(x: $x, y: $y)';
}
