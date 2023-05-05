import 'package:flutter/material.dart';
import 'package:localpetdes/login.page.dart';
import 'package:localpetdes/signup.page.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'pets_database.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE pets(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, data_nascimento TEXT, raca TEXT, codigo_chip TEXT)');
    },
    version: 1,
  );

  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final Future<Database> database;

  MyApp({required this.database});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: database,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar o banco de dados'),
            );
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Local PET',
              theme: ThemeData(
                primarySwatch: Colors.deepOrange,
              ),
              home: Main(),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }
}

