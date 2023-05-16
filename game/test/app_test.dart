import 'package:flutter_test/flutter_test.dart';
import 'package:little_heroes/app/app.dart';
import 'package:little_heroes/assets.dart';

void main() {
  testWidgets('renders app', (tester) async {
    await tester.runAsync(() async {
      final assets = await Assets.load();
      await tester.pumpWidget(App(assets: assets));
      expect(find.byType(App), findsOneWidget);
    });
  });
}
