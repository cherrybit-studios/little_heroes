part of 'title_cubit.dart';

enum TitleStateStatus {
  loading,
  loaded,
  failed,
}

class TitleState extends Equatable {
  const TitleState({
    required this.hero,
    required this.status,
  });

  const TitleState.initial()
      : this(
          hero: null,
          status: TitleStateStatus.loading,
        );

  final Hero? hero;
  final TitleStateStatus status;

  TitleState copyWith({
    Hero? hero,
    TitleStateStatus? status,
  }) {
    return TitleState(
      hero: hero ?? this.hero,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [hero, status];
}
