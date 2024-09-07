import 'package:flutter/material.dart';

import 'package:pavaneli_pedidos/theme.dart';

class PedidoPage extends StatefulWidget {
  const PedidoPage({super.key});

  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  TextEditingController pedidoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MaterialTheme.lightHighContrastScheme().secondary,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
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
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                ],
              ),
            ),
          ),
          // const Divider(
          //   endIndent: 40,
          //   indent: 40,
          // ),
          pedidoController.text.isEmpty
              ? Container()
              : Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: const [
                        Text(
                          "2",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          endIndent: 200,
                          height: 20,
                          indent: 200,
                        ),
                        Text(
                          "Cliente",
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          endIndent: 200,
                          height: 20,
                          indent: 200,
                        ),
                        Text(
                          "Pedidos",
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          endIndent: 200,
                          height: 30,
                          indent: 200,
                        ),
                        Text(
                          "Valor",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ))
        ],
      ),
    );
  }
}
