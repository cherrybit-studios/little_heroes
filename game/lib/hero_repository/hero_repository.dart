import 'package:little_heroes/db_client/db_client.dart';
import 'package:little_heroes/domain/domain.dart';

class HeroRepository {
  HeroRepository(this.dbClient);

  final DbClient dbClient;

  Future<void> saveHero(Hero hero) async {
    final data = hero.toData();
    if (hero.id == null) {
      await dbClient.save(table: 'heroes', data: data);
    } else {
      await dbClient.update(
        table: 'heroes',
        doc: DbDocument(
          id: hero.id!,
          data: data,
        ),
      );
    }
  }

  Future<Hero?> getCaptain() async {
    final query = await dbClient.findBy(
      table: 'heroes',
      field: 'captain',
      value: true,
    );

    if (query.isEmpty) {
      return null;
    } else {
      final doc = query.first;
      return Hero.fromJson({
        'id': doc.id,
        ...doc.data,
      });
    }
  }
}
