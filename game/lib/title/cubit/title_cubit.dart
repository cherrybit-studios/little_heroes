import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:little_heroes/domain/models/models.dart';
import 'package:little_heroes/hero_repository/hero_repository.dart';

part 'title_state.dart';

class TitleCubit extends Cubit<TitleState> {
  TitleCubit({
    required this.heroRepository,
  }) : super(const TitleState.initial());

  final HeroRepository heroRepository;

  Future<void> load() async {
    try {
      emit(state.copyWith(status: TitleStateStatus.loading));
      final captain = await heroRepository.getCaptain();

      emit(
        state.copyWith(
          hero: captain,
          status: TitleStateStatus.loaded,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(state.copyWith(status: TitleStateStatus.failed));
    }
  }
}
