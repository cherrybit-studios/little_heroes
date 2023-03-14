import 'package:flutter_test/flutter_test.dart';
import 'package:little_heroes/app/view/app.dart';
import 'package:little_heroes/assets.dart';
import 'package:mocktail/mocktail.dart';

class _MockAssets extends Mock implements Assets {}

void main() {
  group('App', () {
    test('can be instantiated', () {
      expect(App(assets: _MockAssets()), isNotNull);
    });
  });
}
