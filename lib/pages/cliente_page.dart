import 'package:flutter/material.dart';
import 'package:pavaneli_pedidos/model/cliente_model.dart';
import 'package:pavaneli_pedidos/repositories/cliente_repository.dart';

import 'package:pavaneli_pedidos/theme.dart';

class ClientePage extends StatefulWidget {
  const ClientePage({super.key});

  @override
  State<ClientePage> createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {
  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController enderecoController = TextEditingController(text: "");
  TextEditingController telefoneController = TextEditingController(text: "");
  final ClienteRepository _clienteRepository = ClienteRepository();
  List<ClienteModel> cliente = [];

  bool isLoading = true;

  void buscarClientes() async {
    cliente = await _clienteRepository.buscarTodos();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buscarClientes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () async {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Wrap(
                      spacing: 30,
                      runSpacing: 20,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Cadastrar Cliente",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: nomeController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Nome")),
                        ),
                        TextField(
                          controller: enderecoController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Endereco")),
                        ),
                        TextField(
                          controller: telefoneController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Telefone")),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FilledButton(
                                  onPressed: () async {
                                    var navigator = Navigator.of(context);
                                    await _clienteRepository
                                        .adicionar(ClienteModel(
                                      name: nomeController.text,
                                      endereco: enderecoController.text,
                                      telefone: telefoneController.text,
                                    ));
                                    nomeController.text = "";
                                    enderecoController.text = '';
                                    telefoneController.text = '';
                                    buscarClientes();
                                    navigator.pop();
                                  },
                                  child: const Text("Salvar")),
                              FilledButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancelar")),
                            ],
                          ),
                        )
                      ]),
                ),
              );
            },
          );
          // await _clienteRepository.adicionar(ClienteModel(
          //   name: "Luiz Fernando",
          //   endereco: "Rua guatambus, 455",
          //   telefone: "987233782",
          //   pedidos: 0,
          // ));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: MaterialTheme.lightHighContrastScheme().secondary,
      ),
      body: isLoading == true
          ? const CircularProgressIndicator()
          : Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 150),
                    child: const Center(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            label: Text("Telefone do Cliente"),
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: cliente.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Card(
                            child: ListTile(
                              title: Text("${cliente[index].name}"),
                              subtitle: Text("${cliente[index].endereco}"),
                              trailing: Text("${cliente[index].telefone}"),
                              onTap: () {},
                            ),
                          ),
                        );
                      },
                    ))
              ],
            ),
    );
  }
}
