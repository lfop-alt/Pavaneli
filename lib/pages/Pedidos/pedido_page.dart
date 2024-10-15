import 'package:flutter/material.dart';
import 'package:pavaneli_pedidos/model/pedido_final_model.dart';
import 'package:pavaneli_pedidos/repositories/pedido_repository.dart';

import 'package:pavaneli_pedidos/theme.dart';

class PedidoPage extends StatefulWidget {
  const PedidoPage({super.key});

  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  TextEditingController pedidoController = TextEditingController();
  var pedido = PedidoFinalModel();
  PedidoRepository pedidoRepository = PedidoRepository();

  String mapearItens(List itens) {
    List itensMapeados = [];
    itens.map((item) => {
          if (item != null) {itensMapeados.add(item)}
        });

    return itensMapeados.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MaterialTheme.lightHighContrastScheme().secondary,
          foregroundColor: Colors.white,
        ),
        body: Column(children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, left: 50),
                      child: TextField(
                        controller: pedidoController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Pedido")),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        // pedido = await pedidoRepository.buscarPedidoPorId(
                        //     int.parse(pedidoController.text));

                        // print('Obrigado');

                        pedido = await pedidoRepository.buscarPedidoPorId(
                            int.parse(pedidoController.text));
                        setState(() {});
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
            ),
          ),
          // const Divider(
          //   endIndent: 40,
          //   indent: 40,
          // ),
          pedido.id == null
              ? Container()
              : Expanded(
                  flex: 1,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          child: ListTile(
                        title: Text("${pedido.cliente!.name}"),
                        subtitle: Text(mapearItens(pedido.itens!)),
                        trailing: Text("${pedido.valor}"),
                      ))),
                )
        ]));
  }
}
