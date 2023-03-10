import 'package:flutter/material.dart';
import 'package:little_heroes/assets.dart';
import 'package:little_heroes/l10n/l10n.dart';
import 'package:little_heroes/party_editor/party_editor.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({
    required this.assets,
    super.key,
  });

  final Assets assets;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: assets,
      child: MaterialApp(
        theme: flutterNesTheme(brightness: Brightness.dark),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const PartyEditorPage(),
      ),
    );
  }
}
