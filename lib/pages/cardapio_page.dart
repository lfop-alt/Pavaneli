import 'package:flutter/material.dart';
import 'package:pavaneli_pedidos/model/cardapio_model.dart';
import 'package:pavaneli_pedidos/repositories/cardapio_repository.dart';
import 'package:pavaneli_pedidos/theme.dart';

class CardapioPage extends StatefulWidget {
  const CardapioPage({super.key});

  @override
  State<CardapioPage> createState() => _CardapioPageState();
}

class _CardapioPageState extends State<CardapioPage> {
  TextEditingController nomeItemController = TextEditingController();
  TextEditingController descricaoItemController = TextEditingController();
  TextEditingController valorItemController = TextEditingController();
  final CardapioRepository _cardapioRepository = CardapioRepository();
  List<CardapioModel> cardapio = [];
  bool isLoading = true;

  void buscarTodosItemNoCardapio() async {
    cardapio = await _cardapioRepository.buscarTodos();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buscarTodosItemNoCardapio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Wrap(
                    spacing: 30,
                    runSpacing: 20,
                    children: [
                      const Text("Cadastrar Cardápio"),
                      TextField(
                        controller: nomeItemController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), label: Text("Nome")),
                      ),
                      TextField(
                        controller: descricaoItemController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Descricão")),
                      ),
                      TextField(
                        controller: valorItemController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), label: Text("Valor")),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FilledButton(
                                onPressed: () async {
                                  var navigator = Navigator.of(context);
                                  await _cardapioRepository.adicionar(
                                      CardapioModel(
                                          item: nomeItemController.text,
                                          ingredientes:
                                              descricaoItemController.text,
                                          valor: double.parse(
                                              valorItemController.text)));
                                  nomeItemController.text = "";
                                  descricaoItemController.text = "";
                                  valorItemController.text = "";
                                  buscarTodosItemNoCardapio();
                                  navigator.pop();
                                },
                                child: const Text("Salvar")),
                            FilledButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancelar"))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          "Cárdapio",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: MaterialTheme.lightHighContrastScheme().secondary,
      ),
      body: ListView.builder(
        itemCount: cardapio.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text("${cardapio[index].item}"),
                  subtitle: Text("${cardapio[index].ingredientes}"),
                  trailing: Text(
                    "R\$ ${cardapio[index].valor}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  onTap: () {},
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
