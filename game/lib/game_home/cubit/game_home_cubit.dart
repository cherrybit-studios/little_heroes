import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:little_heroes/domain/models/models.dart';
import 'package:little_heroes/hero_repository/hero_repository.dart';

part 'game_home_state.dart';

class GameHomeCubit extends Cubit<GameHomeState> {
  GameHomeCubit({
    required this.heroRepository,
  }) : super(const GameHomeState.initial());

  final HeroRepository heroRepository;

  Future<void> load() async {
    try {
      emit(state.copyWith(status: GameHomeStateStatus.loading));
      final captain = await heroRepository.getCaptain();

      emit(
        state.copyWith(
          hero: captain,
          status: GameHomeStateStatus.loaded,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(state.copyWith(status: GameHomeStateStatus.failed));
    }
  }
}
