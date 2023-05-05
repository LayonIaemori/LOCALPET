import 'dart:math';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Pet {
  int? id;
  final String nome;
  final String especie;
  final int idade;
  final int telefone;
  final String nomecontato;
  int codigo;

  Pet({
    this.id,
    required this.nome,
    required this.especie,
    required this.idade,
    required this.telefone,
    required this.nomecontato,
  }) : codigo = _generateRandomNumber();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'especie': especie,
      'idade': idade,
      'telefone': telefone,
      'nomecontato': nomecontato,
      'codigo': codigo,
    };
  }

  static Pet fromMap(Map<String, dynamic> map) {
    return Pet(
      id: map['id'],
      nome: map['nome'],
      especie: map['especie'],
      idade: map['idade'],
      telefone: map['telefone'],
      nomecontato: map['nomecontato'],
    );
  }

  static int _generateRandomNumber() {
    // retorna um número aleatório entre 1 e 1000
    return (1 + Random().nextInt(1000));
  }
}

class PetDatabaseHelper {
  static final PetDatabaseHelper instance = PetDatabaseHelper._init();

  static Database? _database;

  PetDatabaseHelper._init();

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
      onCreate: _createDB,
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

  Future<int> insertPet(Pet pet) async {
    final db = await database;
    final json = pet.toMap();
    return await db.insert('pets', json);
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







  Future<int> updatePet(Pet pet) async {
    final db = await database;
    return await db.update(
      'pets',
      pet.toMap(),
      where: 'id = ?',
      whereArgs: [pet.id],
    );
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