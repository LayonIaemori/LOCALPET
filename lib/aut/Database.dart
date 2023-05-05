import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'User.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static final _databaseName = 'myDatabase.db';
  static final _databaseVersion = 1;

  DatabaseHelper.internal();

  late final Future<Database> _db = _initDb();

  Future<Database> _initDb() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path + '/localpetdes.db';

    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onOpen: (db) {},
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        email TEXT PRIMARY KEY,
        password TEXT NOT NULL
      )
    ''');
  }

  Future<bool> authenticate(String email, String password) async {
    final dbClient = await _db;
    var result = await dbClient.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }

  Future<int> insert(Map<String, Object?> row) async {
    final dbClient = await _db;
    return await dbClient.insert(
      'users',
      row,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future close() async {
    final dbClient = await _db;
    dbClient.close();
  }

  Future<int> saveUser(User user) async {
    final db = await _db;
    return await db.insert('users', user.toMap());
  }
}
