import 'package:checks/checks.dart';
import 'package:little_heroes/db_client/db_client.dart';
import 'package:little_heroes/domain/domain.dart';
import 'package:little_heroes/hero_repository/hero_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/scaffolding.dart';

class _MockDbClient extends Mock implements DbClient {}

void main() {
  group('HeroRepository', () {
    late DbClient dbClient;
    late HeroRepository heroRepository;

    setUpAll(() {
      registerFallbackValue(
        const DbDocument(id: '', data: {}),
      );
    });

    setUp(() {
      dbClient = _MockDbClient();
      heroRepository = HeroRepository(dbClient);
    });

    test('can be instantiated', () {
      checkThat(
        HeroRepository(_MockDbClient()),
      ).isNotNull();
    });

    test('saveHero creates a new hero when is a new one', () async {
      const hero = Hero(
        id: null,
        name: 'Erick',
        attributes: Attributes.empty(),
        body: Body.human1,
        outfit: Outfit.villager,
        shield: null,
        weapon: null,
      );

      when(() => dbClient.save(table: 'heroes', data: any(named: 'data')))
          .thenAnswer((_) async => DbDocument(id: '1', data: hero.toData()));

      await heroRepository.saveHero(hero);

      verify(() => dbClient.save(table: 'heroes', data: hero.toData()))
          .called(1);
    });

    test('saveHero updates the hero when it already exists', () async {
      const hero = Hero(
        id: 'a',
        name: 'Erick',
        attributes: Attributes.empty(),
        body: Body.human1,
        outfit: Outfit.villager,
        shield: null,
        weapon: null,
      );

      when(() => dbClient.update(table: 'heroes', doc: any(named: 'doc')))
          .thenAnswer((_) async {});

      await heroRepository.saveHero(hero);

      verify(
        () => dbClient.update(
          table: 'heroes',
          doc: DbDocument(
            id: hero.id!,
            data: hero.toData(),
          ),
        ),
      ).called(1);
    });
  });
}
