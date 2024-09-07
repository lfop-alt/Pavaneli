import 'package:pavaneli_pedidos/model/cliente_model.dart';
import 'package:pavaneli_pedidos/shared/services/conection_sqlite_service.dart';
import 'package:sqflite/sqflite.dart';

class ClienteRepository {
  final ConectionSqliteService _connnect = ConectionSqliteService.instance;

  static String tableName = 'clientes';
  Future<Database> _getDatabase() async {
    return await _connnect.db;
  }

  Future<void> adicionar(ClienteModel cliente) async {
    try {
      Database db = await _getDatabase();
      await db.insert(tableName, cliente.toJson());
    } catch (error) {
      throw Exception();
    }
  }

  Future<List<ClienteModel>> buscarTodos() async {
    try {
      Database db = await _getDatabase();

      var result = await db.rawQuery('SELECT * FROM clientes');

      return (result as List)
          .map((cliente) => ClienteModel.fromJson(cliente))
          .toList();
    } catch (error) {
      throw Exception();
    }
  }

  Future<void> atualizar(ClienteModel cliente, int id) async {
    try {
      Database db = await _getDatabase();

      await db.update(tableName, cliente.toJson(),
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

  Future<ClienteModel> buscarUmCliente(String telefone) async {
    try {
      Database db = await _getDatabase();

      var response = await db
          .query(tableName, where: 'telefone = ?', whereArgs: [telefone]);

      return ClienteModel.fromJson(response.first);
    } catch (error) {
      throw Exception("Item não encontrado");
    }
  }
}
