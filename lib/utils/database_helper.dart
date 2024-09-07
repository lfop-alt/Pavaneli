// import 'package:path/path.dart';

// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   Map<int, String> scripts = {
//     1: '''
//       CREATE TABLE clientes
//       '''
//   };

//   Future initBd() async {
//     var db = await openDatabase(
//       path.join(await getDatabasesPath(), 'databse.db'),
//       version: scripts.length,
//       onCreate: (db, version) async {
//         for (var i = 0; i <= scripts.length; i++) {
//           await db.execute(scripts[i]!);
//         }
//       },
//       onUpgrade: (db, oldVersion, newVersion) async {
//         for (var i = oldVersion + 1; i <= scripts.length; i++) {
//           await db.execute(scripts[i]!);
//         }
//       },
//     );
//   }
// }
