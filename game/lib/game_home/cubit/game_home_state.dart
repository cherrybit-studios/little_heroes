part of 'game_home_cubit.dart';

enum GameHomeStateStatus {
  loading,
  loaded,
  failed,
}

class GameHomeState extends Equatable {
  const GameHomeState({
    required this.hero,
    required this.status,
  });

  const GameHomeState.initial()
      : this(
          hero: null,
          status: GameHomeStateStatus.loading,
        );

  final Hero? hero;
  final GameHomeStateStatus status;

  GameHomeState copyWith({
    Hero? hero,
    GameHomeStateStatus? status,
  }) {
    return GameHomeState(
      hero: hero ?? this.hero,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [hero, status];
}
