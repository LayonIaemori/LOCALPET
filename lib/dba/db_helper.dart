import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Pet {
  int? id;
  String nome;
  String raca;
  String codigoChip;


  Pet({
    this.id,
    required this.nome,
    required this.raca,
    required this.codigoChip,

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'raca': raca,
      'codigoChip': codigoChip,
    };
  }

  static Pet fromMap(Map<String, dynamic> map) {
    return Pet(
      id: map['id'],
      nome: map['nome'],
      raca: map['raca'],
      codigoChip: map['codigoChip'],
    );
  }
}

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'pets_database.db');
    print(path);
    await deleteDatabase(path); // Exclui o banco de dados antigo
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pets(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, raca TEXT, codigoChip TEXT)',
        );
      },
      version: 1,
      onConfigure: (db) {
        db.execute('PRAGMA foreign_keys = ON');
      },
    );
  }

  static Future<List<Pet>> searchPet(String nome, String dataNascimento,
      String raca, String codigoChip) async {
    final db = await database();
    final List<Map<String, dynamic>> maps = await db.query(
      'pets',
      columns: ['id', 'nome', 'raca', 'codigoChip'],
      where: 'nome = ? AND data_nascimento = ? AND raca = ? AND codigoChip = ?',
      whereArgs: [nome, dataNascimento, raca, codigoChip],
    );
    return List.generate(maps.length, (i) {
      return Pet.fromMap(maps[i]);
    });
  }

  static Future<int> insertPet(Pet pet) async {
    final db = await database();
    return await db.insert(
      'pets',
      pet.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Pet>> getPets() async {
    final db = await database();
    final List<Map<String, dynamic>> maps = await db.query('pets',
        columns: ['id', 'nome', 'raca', 'codigoChip']);
    return List.generate(maps.length, (i) {
      return Pet.fromMap(maps[i]);
    });
  }

  static Future<int> updatePet(Pet pet) async {
    final db = await database();
    return await db.update(
      'pets',
      pet.toMap(),
      where: 'id = ?',
      whereArgs: [pet.id],
    );
  }


  static Future<int> deletePet(int id) async {
    final db = await database();
    return await db.delete(
      'pets',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}




