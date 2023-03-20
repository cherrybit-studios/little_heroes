// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:checks/checks.dart';
import 'package:little_heroes/domain/domain.dart';
import 'package:little_heroes/hero_repository/hero_repository.dart';
import 'package:little_heroes/title/title.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/scaffolding.dart';

class _MockHeroRepository extends Mock implements HeroRepository {}

void main() {
  group('TitleCubit', () {
    late HeroRepository heroRepository;

    setUp(() {
      heroRepository = _MockHeroRepository();
    });

    test('can be instantiated', () {
      checkThat(
        TitleCubit(heroRepository: _MockHeroRepository()),
      ).isNotNull();
    });

    test('has the correct initial state', () {
      checkThat(
        TitleCubit(heroRepository: _MockHeroRepository()).state,
      ).equals(TitleState.initial());
    });

    blocTest<TitleCubit, TitleState>(
      'emits [loading, loaded] when load is called',
      build: () => TitleCubit(heroRepository: heroRepository),
      setUp: () {
        when(() => heroRepository.getCaptain()).thenAnswer(
          (_) async => Hero(
            id: '1',
            name: 'Erick',
            attributes: Attributes.empty(),
            body: Body.human1,
            outfit: Outfit.villager,
            shield: null,
            weapon: null,
          ),
        );
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        TitleState(
          hero: null,
          status: TitleStateStatus.loading,
        ),
        TitleState(
          hero: Hero(
            id: '1',
            name: 'Erick',
            attributes: Attributes.empty(),
            body: Body.human1,
            outfit: Outfit.villager,
            shield: null,
            weapon: null,
          ),
          status: TitleStateStatus.loaded,
        ),
      ],
    );

    blocTest<TitleCubit, TitleState>(
      'emits [loading, failed] when load is called and an error occurs',
      build: () => TitleCubit(heroRepository: heroRepository),
      setUp: () {
        when(() => heroRepository.getCaptain()).thenThrow(Exception());
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        TitleState(
          hero: null,
          status: TitleStateStatus.loading,
        ),
        TitleState(
          hero: null,
          status: TitleStateStatus.failed,
        ),
      ],
    );
  });
}
