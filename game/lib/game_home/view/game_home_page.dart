import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_heroes/game_home/game_home.dart';
import 'package:little_heroes/hero_repository/hero_repository.dart';
import 'package:little_heroes/widgets/widgets.dart';

class GameHomePage extends StatelessWidget {
  const GameHomePage({super.key});

  static Route<void> route() {
    return GamePageRouteBuilder(
      pageBuilder: (_, __, ___) => const GameHomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final heroRepository = context.read<HeroRepository>();
        return GameHomeCubit(heroRepository: heroRepository)..load();
      },
      child: const GameHomeView(),
    );
  }
}
