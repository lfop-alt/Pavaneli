class ClienteModel {
  int? id;
  String? name;
  String? endereco;
  String? telefone;
  int? pedidos;

  ClienteModel(
      {this.id, this.name, this.endereco, this.telefone, this.pedidos});

  ClienteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    endereco = json['endereco'];
    telefone = json['telefone'];
    pedidos = json['pedidos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['endereco'] = endereco;
    data['telefone'] = telefone;
    data['pedidos'] = pedidos;
    return data;
  }
}
