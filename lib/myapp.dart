import 'package:flutter/material.dart';
import 'package:pavaneli_pedidos/pages/Pedidos/adicionar_pedido.dart';
import 'package:pavaneli_pedidos/pages/cardapio_page.dart';
import 'package:pavaneli_pedidos/pages/cliente_page.dart';
import 'package:pavaneli_pedidos/pages/home_page.dart';
import 'package:pavaneli_pedidos/pages/Pedidos/pedido_page.dart';

import 'package:pavaneli_pedidos/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pavaneli Pedidos',
      themeMode: ThemeMode.light,
      theme: const MaterialTheme(Typography.whiteCupertino).lightHighContrast(),
      darkTheme: const MaterialTheme(Typography.blackCupertino).dark(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/pedido': (context) => const PedidoPage(),
        '/cardapio': (context) => const CardapioPage(),
        '/addpedido': (context) => const AdicionarPedido(),
        '/cliente': (context) => const ClientePage(),
      },
    );
  }
}
