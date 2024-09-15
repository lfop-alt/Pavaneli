import 'package:flutter/material.dart';
import 'package:pavaneli_pedidos/model/cardapio_model.dart';

import 'package:pavaneli_pedidos/model/pedido_final_model.dart';

import 'package:pavaneli_pedidos/repositories/cardapio_repository.dart';
import 'package:pavaneli_pedidos/repositories/pedido_repository.dart';

import 'package:pavaneli_pedidos/theme.dart';

import 'package:pavaneli_pedidos/utils/widgets/new_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CardapioRepository _cardapioRepository = CardapioRepository();
  final PedidoRepository _pedidoRepository = PedidoRepository();

  List<CardapioModel> cardapio = [];
  List<PedidoFinalModel> pedidoFinal = [];

  double somarValores(List<PedidoFinalModel> itens) {
    double soma = 0;
    for (var element in itens) {
      soma += element.valor!;
    }

    return soma;
  }

  void buscarCardapio() async {
    var result = await _cardapioRepository.buscarTodos();

    if (result.isEmpty) {
      cardapio = [];
    }

    cardapio = result;
    setState(() {});
  }

  void buscarTodosOsPedidos() async {
    var result = await _pedidoRepository.buscarTodos();
    if (result.isEmpty) {
      pedidoFinal = [];
    } else {
      result = result;
      result.sort((a, b) => b.id!.compareTo(a.id!));
      pedidoFinal = result;
    }
    setState(() {});
  }

  void ordenarPedido() {
    pedidoFinal.sort((a, b) => a.id!.compareTo(b.id!));
  }

  @override
  void initState() {
    super.initState();
    buscarCardapio();
    // buscarTodosOsPedidos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/addpedido');
        },
        label: const Text("Novo Pedido"),
        icon: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: MaterialTheme.lightHighContrastScheme().secondary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  buscarCardapio();
                  buscarTodosOsPedidos();
                },
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                )),
          ),
          IconButton(
              onPressed: () async {
                await _pedidoRepository.buscarTodos();
              },
              icon: const Icon(Icons.access_alarm_sharp))
        ],
        leading: Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ))),
      ),
      drawer: const NewDrawer(),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 30, top: 30),
              // padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      color: MaterialTheme.lightHighContrastScheme().secondary,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      child: FractionallySizedBox(
                        heightFactor: 0.8,
                        widthFactor: 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Pedidos Realizados",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              "${pedidoFinal.length}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      color: MaterialTheme.lightHighContrastScheme().secondary,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      child: FractionallySizedBox(
                        heightFactor: 0.8,
                        widthFactor: 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Itens no Cardápio",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              "${cardapio.length}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                        color:
                            MaterialTheme.lightHighContrastScheme().secondary,
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        child: FractionallySizedBox(
                          heightFactor: 0.8,
                          widthFactor: 0.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Valores",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                "R\$ ${somarValores(pedidoFinal).toStringAsFixed(2)}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              width: double.infinity,
              child: Card(
                color: const Color(0xfffff8f6),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: DataTable(
                    dataRowMinHeight: 10,
                    dataRowMaxHeight: 75,
                    columns: const [
                      DataColumn(
                          label: Text(
                        textWidthBasis: TextWidthBasis.parent,
                        "ID",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        "Cliente",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        "Pedido",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                        label: Text(
                          "Valor",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: pedidoFinal.take(5).map((pedido) {
                      List<String> itens = [];
                      for (var element in pedido.itens!) {
                        itens.add(element.item!);
                      }

                      return DataRow(cells: [
                        DataCell(Text("${pedido.id}")),
                        DataCell(Text("${pedido.cliente!.name}")),
                        DataCell(Text(
                          itens.join(', '),
                        )),
                        DataCell(Text(pedido.valor!.toStringAsFixed(2))),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
