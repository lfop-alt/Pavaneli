import 'package:pavaneli_pedidos/model/cardapio_model.dart';
import 'package:pavaneli_pedidos/model/cliente_model.dart';

class PedidoFinalModel {
  int? id;
  ClienteModel? cliente;
  double? valor;
  List<CardapioModel>? itens;

  PedidoFinalModel({this.id, this.cliente, this.valor, this.itens});

  PedidoFinalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cliente =
        json['cliente'] != null ? ClienteModel.fromJson(json['cliente']) : null;
    valor = json['valor'];
    if (json['itens'] != null) {
      itens = <CardapioModel>[];
      json['itens'].forEach((v) {
        itens!.add(CardapioModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (cliente != null) {
      data['cliente'] = cliente!.toJson();
    }
    data['valor'] = valor;
    if (itens != null) {
      data['itens'] = itens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
