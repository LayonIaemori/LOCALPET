import 'dart:math';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../Pet.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  static int _generateRandomNumber() {
    // retorna um número aleatório entre 1 e 1000
    return (1 + Random().nextInt(1000));
  }

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('pets.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 11, onCreate: _createDB);
  }

  Future<void> initializeDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'pets.db');
    final database = await openDatabase(
      dbPath,
      version: 11,
      onCreate: _createDB, // chama a função _createDB quando o banco de dados é criado pela primeira vez
    );
    _database = database;
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE pets (
      id INTEGER PRIMARY KEY,
      nome TEXT,
      especie TEXT,
      idade INTEGER,
      telefone INTEGER,
      nomecontato TEXT,
      codigo INTEGER
    )
  ''');


  }



  Future<int> insertPet(Map<String, dynamic> pet) async {
    final db = await database;
    return await db.insert('pets', {...pet, 'codigo': _generateRandomNumber()});
  }


  Future<List<Pet>> searchPets(String query, {int id = -1}) async {
    final db = await database;

    String whereClause = 'nome LIKE ? OR especie LIKE ? OR idade LIKE ? OR telefone LIKE ? OR nomecontato LIKE ?';
    List<String> whereArgs = ['%$query%', '%$query%', '%$query%', '%$query%', '%$query%'];

    // Adiciona o filtro por id, caso ele seja maior do que -1
    if (id > -1) {
      whereClause += ' AND id = ?';
      whereArgs.add(id.toString());
    }

    final maps = await db.query(
      'pets',
      where: whereClause,
      whereArgs: whereArgs,
    );

    // Converte a lista de Map para uma lista de objetos Pet
    return List.generate(maps.length, (i) {
      return Pet.fromMap(maps[i]);
    });
  }

  Future<Pet> getPetById(int id) async {
    final db = await database;
    final maps = await db.query(
      'pets',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) {
      throw Exception('Pet not found');
    }
    return Pet.fromMap(maps.first);
  }

  Future<Pet> getLastInsertedPet() async {
    final db = await database;
    final maps = await db.rawQuery('SELECT * FROM pets ORDER BY id DESC LIMIT 1');
    if (maps.isEmpty) {
      throw Exception('No pets found');
    }
    return Pet.fromMap(maps.first);
  }
}




