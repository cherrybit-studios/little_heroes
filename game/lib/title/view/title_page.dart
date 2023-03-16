import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_heroes/hero_repository/hero_repository.dart';
import 'package:little_heroes/title/title.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final heroRepository = context.read<HeroRepository>();
        return TitleCubit(heroRepository: heroRepository)..load();
      },
      child: const TitleView(),
    );
  }
}
