import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseTable {
  static String settings = "settings";
  static String events = "events";
}

class DatabaseService {
  DatabaseService._privateConstructor();
  static final DatabaseService instance = DatabaseService._privateConstructor();

  static Database? _database;

  final String _settingsTableName = DatabaseTable.settings;
  final String _settingsIdColumnName = "id";
  final String _settingsNameColumnName = "name";
  final String _settingsValueColumnName = "value";
  final String _settingsValueTypeColumnName = "value_type";

  final String _eventsTableName = DatabaseTable.events;
  final String _eventsIdColumnName = "id";
  final String _eventsNameColumnName = "name";
  final String _eventsStartingAtColumnName = "starting_at";
  final String _eventsEndingAtColumnName = "ending_at";

  Future<Database> get database async {
    return _database ??= await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    final String databaseDirectoryPath = await getDatabasesPath();
    final String path = join(databaseDirectoryPath, "hamewari.db");

    final Database database = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );

    if (kDebugMode) {
      print('Database initialized!');
      print('Path to db: $databaseDirectoryPath');
    }

    return database;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_settingsTableName (
        $_settingsIdColumnName INTEGER PRIMARY KEY,
        $_settingsNameColumnName TEXT NOT NULL UNIQUE,
        $_settingsValueColumnName TEXT NOT NULL,
        $_settingsValueTypeColumnName TEXT NOT NULL
      );
      ''');
    await db.execute('''
      CREATE TABLE $_eventsTableName (
        $_eventsIdColumnName INTEGER PRIMARY KEY,
        $_eventsNameColumnName TEXT NOT NULL,
        $_eventsStartingAtColumnName DATETIME NOT NULL,
        $_eventsEndingAtColumnName DATETIME NOT NULL
      );
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // if (oldVersion < 2) {
    //   await db.execute('ALTER TABLE tasks ADD COLUMN priority INTEGER DEFAULT 0');
    // }
  }
}
