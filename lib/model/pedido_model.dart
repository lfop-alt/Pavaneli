class PedidoModel {
  int? id;
  int? clienteId;
  double? valor;
  PedidosCardapios? pedidosCardapios;

  PedidoModel({this.id, this.clienteId, this.valor, this.pedidosCardapios});

  PedidoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clienteId = json['clienteId'];
    valor = json['valor'];
    pedidosCardapios = json['pedidos_cardapios'] != null
        ? PedidosCardapios.fromJson(json['pedidos_cardapios'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['clienteId'] = clienteId;
    data['valor'] = valor;
    if (pedidosCardapios != null) {
      data['pedidos_cardapios'] = pedidosCardapios!.toJson();
    }
    return data;
  }
}

class PedidosCardapios {
  int? id;
  int? cardapioID;
  int? pedidoId;

  PedidosCardapios({this.id, this.cardapioID, this.pedidoId});

  PedidosCardapios.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cardapioID = json['cardapioID'];
    pedidoId = json['pedidoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cardapioID'] = cardapioID;
    data['pedidoId'] = pedidoId;
    return data;
  }
}
