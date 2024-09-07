import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

Map<int, String> scripts = {
  1: '''
      CREATE TABLE clientes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        endereco TEXT,
        telefone TEXT,
        pedidos INTEGER
      );
      ''',
  2: '''
      CREATE TABLE cardapios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        item TEXT NOT NULL,
        ingredientes TEXT,
        valor REAL
      );
    ''',
  3: '''
      CREATE TABLE pedidos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        clienteId INTEGER,
        valor REAL,
        FOREIGN KEY (clienteId) REFERENCES clientes (id)
        
      );
   ''',
  4: '''
      CREATE TABLE pedidos_cardapios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        cardapioId INTEGER,
        pedidoId INTEGER,
        FOREIGN KEY (cardapioId) REFERENCES cardapios (id),
        FOREIGN KEY (pedidoId) REFERENCES pedidos (id)
      );
   ''',
};

class ConectionSqliteService {
  ConectionSqliteService._();

  static ConectionSqliteService? _instance;

  static ConectionSqliteService get instance {
    _instance ??= ConectionSqliteService._();
    return _instance!;
  }

  static const DATABASE_NAME = 'pavaneli.db';
  Database? _db;

  Future<Database> get db => initDB();

  Future<void> _onCreate(Database db, int version) async {
    for (var i = 1; i <= scripts.length; i++) {
      db.transaction((reference) async {
        await reference.execute(scripts[i]!);
      });
    }
  }

  Future<void> _onUpdate(Database db, int oldVersion, int newVersion) async {
    db.transaction((reference) async {
      for (var i = oldVersion + 1; i <= scripts.length; i++) {
        await db.execute(scripts[i]!);
      }
    });
  }

  Future<Database> initDB() async {
    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      String databasePath = await databaseFactoryFfi.getDatabasesPath();
      String path = join(databasePath, DATABASE_NAME);
      DatabaseFactory databaseFactory = databaseFactoryFfi;

      _db ??= await databaseFactory.openDatabase(path,
          options: OpenDatabaseOptions(
            onCreate: _onCreate,
            version: scripts.length,
            onUpgrade: _onUpdate,
          ));
      return _db!;
    } else if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS) {
      String databasePath = await getDatabasesPath();
      final path = join(databasePath, DATABASE_NAME);
      var dbIosAndroidMacOs = await openDatabase(path,
          version: scripts.length, onCreate: _onCreate, onUpgrade: _onUpdate);
      return dbIosAndroidMacOs;
    }
    throw Exception("Plataforma não suportada");
  }
}
