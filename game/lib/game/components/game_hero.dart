import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:little_heroes/domain/domain.dart';
import 'package:little_heroes/game/game.dart';
import 'package:little_heroes/mini_tiles/mini_tiles.dart';

class GameHero extends PositionComponent
    with HasGameRef<LittleHeroesGame>, ParentIsA<GameArea>, KeyboardHandler {
  GameHero({
    required this.hero,
    super.position,
  }) : super(size: Vector2.all(16));

  final Hero hero;
  late TiledObject _onTopOf;

  int _lastMovingDirection = 1;
  int _direction = 0;
  double speed = 40;

  set onTopOf(TiledObject obj) {
    _onTopOf = obj;

    position = Vector2(
      _onTopOf.x.toDouble(),
      _onTopOf.y - 16,
    );
  }

  TiledObject get onTopOf => _onTopOf;

  @override
  FutureOr<void> onLoad() {
    add(
      SpriteComponent(
        sprite: gameRef.gameAssets.getBody(hero.body.index),
        size: Vector2.all(16),
      ),
    );
    add(
      SpriteComponent(
        sprite: gameRef.gameAssets.getOutfit(hero.outfit.index),
        size: Vector2.all(16),
      ),
    );
  }

  @override
  void update(double dt) {
    if (_direction != 0) {
      final newPosition = x + (_direction * speed * dt);
      if (newPosition >= _onTopOf.x &&
          (newPosition + 16) <= (_onTopOf.x + _onTopOf.width)) {
        x = newPosition;
      }
    }
  }

  void _startMoving(int direction) {
    if (direction != _lastMovingDirection) {
      children
          .whereType<PositionComponent>()
          .forEach((child) => child.flipHorizontallyAroundCenter());
    }

    _direction = direction;
    _lastMovingDirection = direction;
  }

  void _stopMoving() {
    _direction = 0;
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event.logicalKey == LogicalKeyboardKey.keyA ||
        event.logicalKey == LogicalKeyboardKey.keyD) {
      if (event is RawKeyDownEvent) {
        _startMoving(
          event.logicalKey == LogicalKeyboardKey.keyA ? -1 : 1,
        );
      } else {
        _stopMoving();
      }
    }

    return true;
  }
}
