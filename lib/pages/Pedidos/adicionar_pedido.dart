import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pavaneli_pedidos/model/cardapio_model.dart';
import 'package:pavaneli_pedidos/model/cliente_model.dart';
import 'package:pavaneli_pedidos/model/pedido_cardapio_model.dart';

import 'package:pavaneli_pedidos/model/pedido_model.dart';
import 'package:pavaneli_pedidos/pages/home_page.dart';

import 'package:pavaneli_pedidos/repositories/cardapio_repository.dart';
import 'package:pavaneli_pedidos/repositories/cliente_repository.dart';
import 'package:pavaneli_pedidos/repositories/pedido_repository.dart';
import 'package:pavaneli_pedidos/theme.dart';

class AdicionarPedido extends StatefulWidget {
  const AdicionarPedido({super.key});

  @override
  State<AdicionarPedido> createState() => _AdicionarPedidoState();
}

class _AdicionarPedidoState extends State<AdicionarPedido> {
  bool isLoadingBuscaTelefone = true;
  ClienteModel cliente = ClienteModel();
  TextEditingController buscarTelefoneController = TextEditingController();
  TextEditingController saborUnicoController = TextEditingController();
  TextEditingController primeiroSaborController = TextEditingController();
  TextEditingController segundoSaborController = TextEditingController();
  final CardapioRepository _cardapioRepository = CardapioRepository();
  final ClienteRepository _clienteRepository = ClienteRepository();
  final PedidoRepository _pedidoRepository = PedidoRepository();

  bool doisSabores = false;

  List<CardapioModel> cardapio = [];
  List<CardapioModel> itemSelecionado = [];
  List<PopupMenuItem> itemSelecionadoPopMenu = [];

  double soma = 0;
  String calcularValoresTotaldoPedido() {
    if (itemSelecionado.isEmpty) return "0";
    for (var item in itemSelecionado) {
      soma += item.valor!;
    }
    return soma.toStringAsFixed(2);
  }

  void showErrorSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red, // Define a cor de fundo para destacar o erro
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void adicionarCardapioDuplo(String primeiroItem, String segundoItem) async {
    try {
      CardapioModel primeiroSabor =
          await _cardapioRepository.buscarUmItem(primeiroItem);
      CardapioModel segundoSabor =
          await _cardapioRepository.buscarUmItem(segundoItem);

      // var itemCardapio = await _cardapioRepository
      //     .buscarUmItem("${primeiroSabor.item}-${segundoSabor.item}");

      // verificar se ja existe

      await _cardapioRepository.adicionar(
        CardapioModel(
          item: "${primeiroSabor.item}-${segundoSabor.item}",
          ingredientes:
              "${primeiroSabor.ingredientes} / ${segundoSabor.ingredientes}",
          valor: primeiroSabor.valor! >= segundoSabor.valor!
              ? primeiroSabor.valor ?? 0
              : segundoSabor.valor ?? 0,
        ),
      );
      showErrorSnackBar(context, "Item Cadastrado");
    } catch (error) {
      throw Exception(error);
    }
  }

  void buscarItensDoCardapio() async {
    cardapio = await _cardapioRepository.buscarTodos();
    // converterObjetoEmString();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    buscarItensDoCardapio();
  }

  // static String _displayStringForOption(CardapioModel option) => option.item!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Adicionar Pedido",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: MaterialTheme.lightHighContrastScheme().secondary,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: buscarTelefoneController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Telefone do Cliente")),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      cliente = await _clienteRepository
                          .buscarUmCliente(buscarTelefoneController.text);
                      setState(() {});
                    },
                    icon: const Icon(Icons.search),
                    tooltip: "Pesquisar Cliente",
                  ),
                  Expanded(
                    flex: 2,
                    child: Card(
                      child: ListTile(
                        title: Text(cliente.name ?? ""),
                        subtitle: Text(cliente.endereco ?? ""),
                        trailing: Text(cliente.telefone ?? ""),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
              child: Row(
                children: [
                  doisSabores == false
                      ? Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: MenuAnchor(
                              builder: (context, controller, child) {
                                return TextField(
                                  onTap: () {
                                    if (controller.isOpen) {
                                      controller.close();
                                    } else {
                                      controller.open();
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text("Sabor")),
                                  controller: saborUnicoController,
                                );
                              },
                              menuChildren: List<MenuItemButton>.generate(
                                cardapio.length,
                                (int index) => MenuItemButton(
                                  onPressed: () => setState(
                                    () {
                                      saborUnicoController.text =
                                          cardapio[index].item ??
                                              "Nenhum Item Cadastrado";
                                    },
                                  ),
                                  child: Text(
                                    "    ${cardapio[index].item}    ",
                                    style: const TextStyle(
                                        height: 1, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: MenuAnchor(
                                    builder: (context, controller, child) {
                                      return TextField(
                                        onTap: () {
                                          if (controller.isOpen) {
                                            controller.close();
                                          } else {
                                            controller.open();
                                          }
                                        },
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            label: Text("Sabor 1")),
                                        controller: primeiroSaborController,
                                      );
                                    },
                                    menuChildren: List<MenuItemButton>.generate(
                                      cardapio.length,
                                      (int index) => MenuItemButton(
                                        onPressed: () => setState(
                                          () {
                                            primeiroSaborController.text =
                                                cardapio[index].item ??
                                                    "Nenhum Item Cadastrado";
                                          },
                                        ),
                                        child: Text(
                                          "    ${cardapio[index].item}    ",
                                          style: const TextStyle(
                                              height: 1, fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: MenuAnchor(
                                    builder: (context, controller, child) {
                                      return TextField(
                                        onTap: () {
                                          if (controller.isOpen) {
                                            controller.close();
                                          } else {
                                            controller.open();
                                          }
                                        },
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            label: Text("Sabor 2")),
                                        controller: segundoSaborController,
                                      );
                                    },
                                    menuChildren: List<MenuItemButton>.generate(
                                      cardapio.length,
                                      (int index) => MenuItemButton(
                                        onPressed: () => setState(
                                          () {
                                            segundoSaborController.text =
                                                cardapio[index].item!;
                                          },
                                        ),
                                        child: Text(
                                          "    ${cardapio[index].item}    ",
                                          style: const TextStyle(
                                              height: 1, fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  Expanded(
                    flex: 1,
                    child: SegmentedButton(
                      segments: const [
                        ButtonSegment(value: false, label: Text("1 Sabor")),
                        ButtonSegment(value: true, label: Text("2 Sabores"))
                      ],
                      selected: <bool>{doisSabores},
                      onSelectionChanged: (p0) {
                        setState(() {
                          doisSabores = p0.first;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      onPressed: () async {
                        if (doisSabores == false) {
                          CardapioModel item = await _cardapioRepository
                              .buscarUmItem(saborUnicoController.text);
                          itemSelecionado.add(item);

                          setState(() {
                            saborUnicoController.text == "";
                          });
                        } else {
                          // CardapioModel primeiroSabor =
                          //     await _cardapioRepository
                          //         .buscarUmItem(primeiroSaborController.text);
                          // CardapioModel segundoSabor = await _cardapioRepository
                          //     .buscarUmItem(segundoSaborController.text);

                          adicionarCardapioDuplo(primeiroSaborController.text,
                              segundoSaborController.text);

                          CardapioModel itemDuplo =
                              await _cardapioRepository.buscarUmItem(
                                  "${primeiroSaborController.text}-${segundoSaborController.text}");

                          itemSelecionado.add(itemDuplo);

                          setState(() {});
                        }
                      },
                      icon: const Icon(Icons.add),
                      tooltip: "Adicionar Item",
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
              child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: itemSelecionado.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Card(
                                        child: ListTile(
                                          title: Text(
                                              itemSelecionado[index].item!),
                                          subtitle: Text(itemSelecionado[index]
                                              .ingredientes!),
                                          trailing: Text(
                                              "R\$ ${itemSelecionado[index].valor.toString()}"),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.delete))
                                  ],
                                ),
                                // const Divider()
                              ],
                            );
                          },
                        ),
                      ),
                      Container(
                        color:
                            MaterialTheme.lightHighContrastScheme().secondary,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Valor Total",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "R\$${calcularValoresTotaldoPedido()}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  onPressed: () async {
                    List<PedidosCardapiosModel> itens = [];
                    int tamanhoDoPedidos =
                        await _pedidoRepository.quantidadeDePedidos();

                    for (var item in itemSelecionado) {
                      itens.add(PedidosCardapiosModel(
                          cardapioID: item.id, pedidoId: tamanhoDoPedidos + 1));
                    }

                    await _pedidoRepository.adicionar(
                        PedidoModel(clienteId: cliente.id, valor: soma), itens);

                    // final pdf = pdfWidgets.Document();
                    // pdf.addPage(pdfWidgets.Page(
                    //   pageFormat: PdfPageFormat.roll80,
                    //   build: (context) {
                    //     return pdfWidgets.Center(
                    //       child: pdfWidgets.Text("Deu certo a impressão"),
                    //     );
                    //   },
                    // ));

                    // final pdfFile = pdf.save();

                    // await Printing.layoutPdf(
                    //   onLayout: (format) => pdfFile,
                    // );

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                  },
                  child: const Text("Imprimir"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


// Autocomplete<CardapioModel>(
            //   displayStringForOption: _displayStringForOption,
            //   // fieldViewBuilder: (context, textEditingController, focusNode,
            //   //     onFieldSubmitted) {
            //   //   return TextField(
            //   //     controller: textEditingController,
            //   //     focusNode: focusNode,
            //   //     onEditingComplete: onFieldSubmitted,
            //   //     decoration: const InputDecoration(
            //   //         border: OutlineInputBorder(),
            //   //         hintText: "Selecione os itens"),
            //   //   );
            //   // },
            //   optionsBuilder: (textEditingValue) {
            //     if (textEditingValue.text.isEmpty) {
            //       return const Iterable<CardapioModel>.empty();
            //     }
            //     return cardapio.where((option) {
            //       return option
            //           .toString()
            //           .contains(textEditingValue.text.toLowerCase());
            //     });
            //   },
            //   // optionsViewBuilder: (context, onSelected, options) {
            //   //   return Material(
            //   //     child: ListView.separated(
            //   //       itemBuilder: (context, index) {
            //   //         final cardapioSeparado = cardapio.elementAt(index);

            //   //         return ListTile(
            //   //           title: Text("${cardapioSeparado.item}"),
            //   //           subtitle: Text("${cardapioSeparado.ingredientes}"),
            //   //           trailing: Text(cardapioSeparado.valor.toString()),
            //   //         );
            //   //       },
            //   //       separatorBuilder: (context, index) {
            //   //         return const Divider();
            //   //       },
            //   //       itemCount: cardapio.length,
            //   //       padding: const EdgeInsets.symmetric(vertical: 10),
            //   //     ),
            //   //   );
            //   // },
            //   onSelected: (option) {
            //     itemSelecionado.add(option);

            //     setState(() {});
            //   },
            // )

