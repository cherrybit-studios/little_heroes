part of 'party_cubit.dart';

class PartyState extends Equatable {
  const PartyState({
    required this.heroes,
    required this.selected,
  });

  final List<Hero> heroes;
  final int? selected;

  @override
  List<Object?> get props => [heroes, selected];
}
