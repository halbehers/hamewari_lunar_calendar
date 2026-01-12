import 'package:hamewari/db/models/model.dart';
import 'package:hamewari/db/services/database_service.dart';
import 'package:sqflite/sqflite.dart';

abstract class Repository<T extends Model<T>> {
  Database? _database;

  Future<Database> get database async {
    return _database ??= await DatabaseService.instance.database;
  }

  String getTable();
  T newEntity();

  Future<T> findById(int id) async {
    Database db = await database;

    return db.query(getTable(), where: "id = ?", whereArgs: [id]).then((
      result,
    ) {
      return result
          .map((dbEntity) => newEntity().fillFromValues(dbEntity))
          .single;
    });
  }

  Future<List<T>> findAll() async {
    Database db = await database;

    return db.query(getTable()).then((result) {
      return result
          .map((dbEntity) => newEntity().fillFromValues(dbEntity))
          .toList();
    });
  }

  Future<List<T>> findBy({
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    Database db = await database;

    return db
        .query(
          getTable(),
          distinct: distinct,
          columns: columns,
          where: where,
          whereArgs: whereArgs,
          groupBy: groupBy,
          having: having,
          orderBy: orderBy,
          limit: limit,
          offset: offset,
        )
        .then((result) {
          return result
              .map((dbEntity) => newEntity().fillFromValues(dbEntity))
              .toList();
        });
  }

  Future<bool> exists(int id) async {
    return findBy(
      where: "id = ?",
      whereArgs: [id],
      limit: 1,
    ).then((result) => result.isNotEmpty);
  }

  Future<int> create(T entity) async {
    Database db = await database;

    return db.insert(getTable(), entity.getValuesMap());
  }

  Future<int> update(T entity) async {
    Database db = await database;

    return db.update(
      getTable(),
      entity.getValuesMap(),
      where: 'id = ?',
      whereArgs: [entity.id],
    );
  }

  Future<bool> delete(T entity) async {
    Database db = await database;
    int id = entity.id!;

    return await db.delete(getTable(), where: "id = ?", whereArgs: [id]) == 0;
  }
}
