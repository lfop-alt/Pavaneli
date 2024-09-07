class CardapioModel {
  int? id;
  String? item;
  String? ingredientes;
  double? valor;

  CardapioModel({this.id, this.item, this.ingredientes, this.valor});

  CardapioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    item = json['item'];
    ingredientes = json['ingredientes'];
    valor = json['valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['item'] = item;
    data['ingredientes'] = ingredientes;
    data['valor'] = valor;
    return data;
  }
}
