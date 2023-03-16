import 'package:flutter/material.dart';
import 'package:little_heroes/assets.dart';
import 'package:little_heroes/hero_repository/hero_repository.dart';
import 'package:little_heroes/l10n/l10n.dart';
import 'package:little_heroes/title/title.dart';
import 'package:little_heroes/widgets/widgets.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({
    required this.assets,
    required this.heroRepository,
    super.key,
  });

  final Assets assets;
  final HeroRepository heroRepository;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: assets),
        Provider.value(value: heroRepository),
      ],
      child: MaterialApp(
        theme: flutterNesTheme(brightness: Brightness.dark).copyWith(
          cardColor: GameColors.mainBackgroundColor,
          scaffoldBackgroundColor: GameColors.mainBackgroundColor,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const TitlePage(),
      ),
    );
  }
}
