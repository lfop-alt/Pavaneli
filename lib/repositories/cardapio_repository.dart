import 'package:pavaneli_pedidos/model/cardapio_model.dart';
import 'package:pavaneli_pedidos/shared/services/conection_sqlite_service.dart';
import 'package:sqflite/sqflite.dart';

class CardapioRepository {
  final ConectionSqliteService _connnect = ConectionSqliteService.instance;

  static String tableName = 'cardapios';
  Future<Database> _getDatabase() async {
    return await _connnect.db;
  }

  Future<void> adicionar(CardapioModel cardapio) async {
    try {
      Database db = await _getDatabase();
      await db.insert(tableName, cardapio.toJson());
    } catch (error) {
      throw Exception();
    }
  }

  Future<List<CardapioModel>> buscarTodos() async {
    try {
      Database db = await _getDatabase();

      var result = await db.rawQuery('SELECT * FROM cardapios');

      return (result as List)
          .map((cardapio) => CardapioModel.fromJson(cardapio))
          .toList();
    } catch (error) {
      throw Exception();
    }
  }

  Future<void> atualizar(CardapioModel cardapio, int id) async {
    try {
      Database db = await _getDatabase();

      await db.update(tableName, cardapio.toJson(),
          where: 'id = ?', whereArgs: [id]);
    } catch (error) {
      throw Exception();
    }
  }

  Future<void> remove(int id) async {
    try {
      Database db = await _getDatabase();

      await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    } catch (error) {
      throw Exception();
    }
  }

  Future<CardapioModel> buscarUmItem(String item) async {
    try {
      Database db = await _getDatabase();

      var response =
          await db.query(tableName, where: 'item = ?', whereArgs: [item]);

      return CardapioModel.fromJson(response.first);
    } catch (error) {
      throw Exception(error);
    }
  }
}
