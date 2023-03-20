import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class DbDocument extends Equatable {
  const DbDocument({
    required this.id,
    required this.data,
  });

  final String id;
  final Map<String, dynamic> data;

  @override
  List<Object> get props => [id, data];
}

class DbClient {
  const DbClient();

  Future<DbDocument> save({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    final box = await Hive.openBox<Map<dynamic, dynamic>>(table);

    final id = const Uuid().v4();
    await box.put(id, data);

    return DbDocument(id: id, data: data);
  }

  Future<void> update({
    required String table,
    required DbDocument doc,
  }) async {
    final box = await Hive.openBox<Map<dynamic, dynamic>>(table);

    await box.put(doc.id, doc.data);
  }

  Future<DbDocument?> getById(String table, String id) async {
    final box = await Hive.openBox<Map<dynamic, dynamic>>(table);
    final result = box.get(id)?.cast<String, dynamic>();

    if (result != null) {
      return DbDocument(
        id: id,
        data: _mapMap(result),
      );
    }

    return null;
  }

  Future<List<DbDocument>> findBy({
    required String table,
    required String field,
    required dynamic value,
  }) async {
    final box = await Hive.openBox<Map<dynamic, dynamic>>(table);

    return box
        .toMap()
        .entries
        .where(
          (entry) => entry.value[field] == value,
        )
        .map(
          (entry) => DbDocument(
            id: entry.key as String,
            data: _mapMap(entry.value),
          ),
        )
        .toList();
  }

  Map<String, dynamic> _mapMap(Map<dynamic, dynamic> map) {
    return map.cast<String, dynamic>().map(
      (key, value) {
        return value is Map
            ? MapEntry(key, value.cast<String, dynamic>())
            : MapEntry(key, value);
      },
    );
  }
}
