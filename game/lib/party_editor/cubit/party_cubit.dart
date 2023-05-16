import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:little_heroes/domain/domain.dart';

part 'party_state.dart';

class PartyCubit extends Cubit<PartyState> {
  PartyCubit()
      : super(
          const PartyState(
            heroes: [],
            selected: null,
          ),
        );

  final _rng = Random();

  void _updateSelectedHero(Hero Function(Hero) transformer) {
    final selectedHero = state.heroes[state.selected!];

    emit(
      PartyState(
        heroes: state.heroes.map((hero) {
          if (hero == selectedHero) {
            return transformer(selectedHero);
          } else {
            return hero;
          }
        }).toList(),
        selected: state.selected,
      ),
    );
  }

  void updateSelectedHeroName(String name) {
    _updateSelectedHero((hero) => hero.copyWithName(name));
  }

  void updateSelectedHeroBody(Body? body) {
    if (body != null && state.selected != null) {
      _updateSelectedHero((hero) => hero.copyWithBody(body));
    }
  }

  void updateSelectedHeroOutfit(Outfit? outfit) {
    if (outfit != null && state.selected != null) {
      _updateSelectedHero((hero) => hero.copyWithOutfit(outfit));
    }
  }

  void updateSelectedHeroWeapon(Weapon? weapon) {
    if (state.selected != null) {
      _updateSelectedHero((hero) => hero.copyWithWeapon(weapon));
    }
  }

  void updateSelectedHeroShield(Shield? shield) {
    if (state.selected != null) {
      _updateSelectedHero((hero) => hero.copyWithShield(shield));
    }
  }

  void selectHero(Hero hero) {
    emit(
      PartyState(
        heroes: state.heroes,
        selected: state.heroes.indexOf(hero),
      ),
    );
  }

  void removeHero(Hero hero) {
    final values = [...state.heroes.where((value) => value != hero)];
    emit(
      PartyState(
        heroes: values,
        selected: values.isEmpty ? null : values.length - 1,
      ),
    );
  }

  void newHero() {
    final name = 'Hero #${state.heroes.length + 1}';
    final body = Body.values[_rng.nextInt(Body.values.length)];
    final outfit = Outfit.values[_rng.nextInt(Outfit.values.length)];

    final hero = Hero(
      name: name,
      body: body,
      outfit: outfit,
      shield: null,
      weapon: null,
    );

    final heroes = [
      ...state.heroes,
      hero,
    ];

    emit(
      PartyState(
        heroes: heroes,
        selected: heroes.length - 1,
      ),
    );
  }
}
