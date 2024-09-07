import 'package:pavaneli_pedidos/model/pedido_final_model.dart';

class JsonData {
  final Map<int, PedidoFinalModel> data;

  JsonData({required this.data});

  factory JsonData.fromJson(Map<String, dynamic> json) {
    final Map<int, PedidoFinalModel> data = {};
    json.forEach((key, value) {
      data[int.parse(key)] = PedidoFinalModel.fromJson(value);
    });
    return JsonData(data: data);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    data.forEach((key, value) {
      json[key.toString()] = value.toJson();
    });
    return json;
  }
}
