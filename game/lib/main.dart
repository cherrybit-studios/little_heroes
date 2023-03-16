import 'package:flutter/material.dart';
import 'package:little_heroes/app/app.dart';
import 'package:little_heroes/assets.dart';
import 'package:little_heroes/bootstrap.dart';
import 'package:little_heroes/db_client/db_client.dart';
import 'package:little_heroes/hero_repository/hero_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final assets = await Assets.load();
  final heroRepository = HeroRepository(
    const DbClient(),
  );

  await bootstrap(
    () => App(
      assets: assets,
      heroRepository: heroRepository,
    ),
  );
}
