import 'package:flutter/foundation.dart';
import 'package:todo_app/data/models/events_model.dart';

import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;


class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'todo.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE events(id TEXT PRIMARY KEY, name TEXT, description TEXT, createdAt TEXT, updatedAt TEXT, location TEXT, colorValue INTEGER, eventDate TEXT)');
    }, version: 3);
  }

  static Future<void> insert(String table, Map<String, Object?> data) async {
    final db = await DBHelper.database();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<EventsModel>> getData(String table) async {
    final db = await DBHelper.database();
    List<Map> result = await db.query(table);
    if (kDebugMode) {
      print(result);
    }
    return List.generate(result.length, (i) {
      DateTime createdAt=DateTime.now();
      DateTime updatedAt=DateTime.now();
      try{
        createdAt=DateTime.parse(result[i]['createdAt']);
        updatedAt=DateTime.parse(result[i]['updatedAt']);
      }
      catch(e,s){//
      }
      return EventsModel(
        id: result[i]['id'],
        name: result[i]['name'],
        description: result[i]['description'],
        createdAt: createdAt.toString(),
        updatedAt: updatedAt.toString(),
        location: result[i]['location'],
        colorValue: result[i]['colorValue'],
        eventDate: result[i]['eventDate'],
      );
    });
  }
  static Future<void> deleteItem(String id) async {
    final db = await DBHelper.database();
    debugPrint('sucesssssssssssssss');
    await db.delete(
      'events',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}


// class DatabaseService {
//   static final DatabaseService instance = DatabaseService._();
//   static Database? _database;
//
//   DatabaseService._();
//
//   Future<Database?> get database async {
//     if (_database != null) return _database;
//
//     _database = await initializeDatabase();
//     return _database;
//   }
//
//   Future<Database> initializeDatabase() async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, 'todo_database.db');
//
//     return await openDatabase(path, version: 1, onCreate: _onCreate);
//   }
//
//   Future<void> _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE todos(
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         title TEXT,
//         date TEXT
//       )
//     ''');
//   }
//
//   Future<List<EventsModel>> getTodos() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db!.query('todos');
//     return List.generate(maps.length, (i) {
//       return EventsModel(
//         id: maps[i]['id'],
//         name: maps[i]['name'],
//         description: maps[i]['description'],
//         createdAt: DateTime.parse(maps[i]['date']).toString(),
//         location: maps[i]['location'],
//         colorValue: maps[i]['colorValue'],
//         eventDate: maps[i]['eventDate'],
//       );
//     });
//   }
//
//   Future<void> insertTodo(EventsModel todo) async {
//     final db = await database;
//     await db!.insert('todos', todo.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }
// }
