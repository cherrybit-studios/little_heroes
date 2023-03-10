import 'package:flutter/material.dart';
import 'package:little_heroes/app/app.dart';
import 'package:little_heroes/assets.dart';
import 'package:little_heroes/bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final assets = await Assets.load();

  await bootstrap(
    () => App(
      assets: assets,
    ),
  );
}
