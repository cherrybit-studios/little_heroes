import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class DbDocument {
  const DbDocument({
    required this.id,
    required this.data,
  });

  final String id;
  final Map<String, dynamic> data;
}

class DbClient {
  const DbClient();

  Future<DbDocument> save({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    final box = Hive.box<Map<String, dynamic>>(table);

    final id = const Uuid().v4();
    await box.put(id, data);

    return DbDocument(id: id, data: data);
  }

  Future<void> update({
    required String table,
    required DbDocument doc,
  }) async {
    final box = Hive.box<Map<String, dynamic>>(table);

    await box.put(doc.id, doc.data);
  }

  Future<DbDocument?> getById(String table, String id) async {
    final box = Hive.box<Map<String, dynamic>>(table);
    final result = box.get(id);

    if (result != null) {
      return DbDocument(
        id: id,
        data: result,
      );
    }

    return null;
  }
}
