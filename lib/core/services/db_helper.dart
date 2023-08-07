import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'todo.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE events(id TEXT PRIMARY KEY, title TEXT, image TEXT, loc_lat REAL, loc_lng REAL, address TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object?> data) async {
    final db = await DBHelper.database();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map>> getData(String table) async {
    final db = await DBHelper.database();
    List<Map> result = await db.query(table);
    if (kDebugMode) {
      print(result);
    }
    return db.query(table);
  }
  static Future<int> delete(String id) async{
    final db = await DBHelper.database();
    int result=await db.rawDelete('DELETE FROM events WHERE id=$id');
    return result;

  }
}
