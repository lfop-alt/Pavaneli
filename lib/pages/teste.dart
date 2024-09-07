// // import 'package:flutter/material.dart';
// // import 'package:sqflite/sqflite.dart';
// // import 'package:path/path.dart';

// // // Função para abrir o banco de dados
// // Future<Database> openDatabase() async {
// //   return openDatabase(
// //     join(await getDatabasesPath(), 'example.db'),
// //     onCreate: (db, version) {
// //       // Criação das tabelas para o exemplo
// //       return db
// //           .execute(
// //         'CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT)',
// //       )
// //           .then((_) {
// //         return db.execute(
// //           'CREATE TABLE product_details(product_id INTEGER, description TEXT, price REAL, stock INTEGER)',
// //         );
// //       });
// //     },
// //     version: 1,
// //   );
// // }

// // Função para buscar dados
// Future<List<Map<String, dynamic>>> fetchData() async {
//   final db = await openDatabase();
//   final List<Map<String, dynamic>> maps = await db.rawQuery('''
//     SELECT
//         p.id,
//         p.name,
//         d.description,
//         d.price,
//         d.stock
//     FROM
//         products p
//     INNER JOIN
//         product_details d ON p.id = d.product_id
//     ''');
//   return maps;
// }

// // Função para processar dados
// Map<int, Map<String, dynamic>> processResults(
//     List<Map<String, dynamic>> rawResults) {
//   final Map<int, Map<String, dynamic>> resultMap = {};

  // for (var row in rawResults) {
  //   final int id = row['id'];
  //   if (!resultMap.containsKey(id)) {
  //     resultMap[id] = {
  //       'id': id,
  //       'name': row['name'],
  //       'details': [],
  //     };
  //   }
  //   resultMap[id]['details'].add({
  //     'description': row['description'],
  //     'price': row['price'],
  //     'stock': row['stock'],
  //   });
  // }

//   return resultMap;
// }

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(title: Text('Data Example')),
// //         body: DataListView(),
// //       ),
// //     );
// //   }
// // }

// // class DataListView extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return FutureBuilder<Map<int, Map<String, dynamic>>>(
// //       future: fetchData().then((data) => processResults(data)),
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return Center(child: CircularProgressIndicator());
// //         }

// //         if (snapshot.hasError) {
// //           return Center(child: Text('Error: ${snapshot.error}'));
// //         }

// //         final data = snapshot.data ?? {};

// //         return ListView.builder(
// //           itemCount: data.length,
// //           itemBuilder: (context, index) {
// //             final item = data.values.elementAt(index);
// //             return ExpansionTile(
// //               title: Text(item['name']),
// //               children:
// //                   (item['details'] as List<Map<String, dynamic>>).map((detail) {
// //                 return ListTile(
// //                   title: Text(detail['description']),
// //                   subtitle: Text(
// //                       'Price: \$${detail['price']}, Stock: ${detail['stock']}'),
// //                 );
// //               }).toList(),
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }
// // }
