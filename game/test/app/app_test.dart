import 'package:flutter_test/flutter_test.dart';
import 'package:little_heroes/app/view/app.dart';
import 'package:little_heroes/assets.dart';
import 'package:little_heroes/hero_repository/hero_repository.dart';
import 'package:little_heroes/title/title.dart';
import 'package:mocktail/mocktail.dart';

class _MockHeroRepository extends Mock implements HeroRepository {}

void main() {
  group('App', () {
    testWidgets('renders correctly', (tester) async {
      await tester.runAsync(() async {
        final assets = await Assets.load();

        await tester.pumpWidget(
          App(
            assets: assets,
            heroRepository: _MockHeroRepository(),
          ),
        );

        expect(find.byType(TitlePage), findsOneWidget);
      });
    });
  });
}
