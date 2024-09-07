import 'package:flutter/material.dart';

class NewDrawer extends StatelessWidget {
  const NewDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Luiz"),
            accountEmail: Text("user@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          const ListTile(
            title: Text("Tela Inicial"),
            leading: Icon(Icons.home_filled),
          ),
          ListTile(
            title: const Text("Cardapio"),
            leading: const Icon(Icons.menu_book),
            onTap: () {
              Scaffold.of(context).closeDrawer();
              Navigator.pushNamed(context, "/cardapio");
            },
          ),
          ListTile(
            title: const Text("Pedido"),
            leading: const Icon(Icons.article_rounded),
            onTap: () {
              Scaffold.of(context).closeDrawer();
              Navigator.pushNamed(context, "/pedido");
            },
          ),
          ListTile(
            title: const Text("Clientes"),
            leading: const Icon(Icons.person),
            onTap: () {
              Scaffold.of(context).closeDrawer();
              Navigator.pushNamed(context, "/cliente");
            },
          ),
        ],
      ),
    );
  }
}
