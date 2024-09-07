import 'package:pavaneli_pedidos/model/pedido_cardapio_model.dart';
import 'package:pavaneli_pedidos/model/pedido_final_model.dart';
import 'package:pavaneli_pedidos/model/pedido_model.dart';
import 'package:pavaneli_pedidos/shared/services/conection_sqlite_service.dart';
import 'package:sqflite/sqflite.dart';

class PedidoRepository {
  final ConectionSqliteService _connnect = ConectionSqliteService.instance;

  static String tableName = 'pedidos';
  Future<Database> _getDatabase() async {
    return await _connnect.db;
  }

  Future<void> adicionar(
      PedidoModel pedido, List<PedidosCardapiosModel> itens) async {
    try {
      Database db = await _getDatabase();

      await db.insert(tableName, pedido.toJson());
      for (var item in itens) {
        await db.insert('pedidos_cardapios', item.toJson());
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  //

  Future<List<PedidoFinalModel>> buscarTodos() async {
    try {
      Database db = await _getDatabase();

      final List<Map<String, dynamic>> result = await db.rawQuery('''
      SELECT pedidos.id, pedidos.clienteId, pedidos_cardapios.pedidoId, pedidos.valor, pedidos_cardapios.cardapioId, clientes.id AS clienteSelecionadoId, clientes.name, clientes.endereco, clientes.telefone, clientes.pedidos AS quantidadeDePedidos, cardapios.id AS cardapiosItemId, cardapios.item, cardapios.ingredientes, cardapios.valor AS valorItem
      FROM pedidos
      INNER JOIN pedidos_cardapios ON pedidos.id = pedidos_cardapios.pedidoId
      INNER JOIN clientes ON pedidos.clienteId = clientes.id
      INNER JOIN cardapios ON pedidos_cardapios.cardapioId = cardapios.id
    ''');

      // Mapa para armazenar os pedidos agrupados por id
      Map<int, Map<String, dynamic>> pedidosMap = {};

      for (var raw in result) {
        int pedidoId = raw['pedidoId'];

        // Se o pedido não está no mapa, adicione-o
        if (!pedidosMap.containsKey(pedidoId)) {
          pedidosMap[pedidoId] = {
            'id': raw['id'],
            'cliente': {
              'id': raw['clienteSelecionadoId'],
              'name': raw['name'],
              'endereco': raw['endereco'],
              'telefone': raw['telefone'],
              'pedidos': raw['quantidadeDePedidos']
            },
            'valor': raw['valor'],
            'itens': []
          };
        }

        // Adicione o item ao pedido correspondente
        pedidosMap[pedidoId]!['itens'].add({
          'id': raw['cardapiosItemId'],
          'item': raw['item'],
          'ingredientes': raw['ingredientes'],
          'valor': raw['valorItem']
        });
      }

      // Converta o mapa de pedidos para uma lista
      // List<Map<String, dynamic>> resultMap = pedidosMap.values.toList();
      var todosPedidos = await db.rawQuery('SELECT * FROM pedidos_cardapios');
      print(todosPedidos);
      return pedidosMap.values
          .map((element) => PedidoFinalModel.fromJson(element))
          .toList();
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<int> quantidadeDePedidos() async {
    try {
      Database db = await _getDatabase();
      var todosPedidos = await db.rawQuery('SELECT * FROM $tableName');

      // uso o throw para mandar o ero para o catch e pois buscar ele em outro lugar.
      return todosPedidos.length;
    } catch (error) {
      throw Exception();
    }
  }
}
