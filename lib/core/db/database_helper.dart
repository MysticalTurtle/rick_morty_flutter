import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  DatabaseHelper._init();
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('rickandmorty.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY ';
    const jsonType = 'TEXT NOT NULL';
    const dateTimeType = 'TEXT NOT NULL'; 

    await db.execute('''
    CREATE TABLE favorites (
      id $idType,
      json $jsonType,
      date_time $dateTimeType
    )
    ''');
  }

  Future<int> create(Map<String, dynamic> favorite) async {
    final db = await instance.database;
    return db.insert('favorites', favorite);
  }

  Future<Map<String, dynamic>?> readFavorite(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return maps.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> readAllFavorites() async {
    final db = await instance.database;
    return  db.query('favorites');
  }

  Future<int> update(String id, Map<String, dynamic> favorite) async {
    final db = await instance.database;
    return db.update(
      'favorites',
      favorite,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return  db.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> close() async {
    final db = await instance.database;
    await db.close();
  }
}
