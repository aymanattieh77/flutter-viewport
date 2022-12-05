import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = "tasks";

  static Future<void> initDb() async {
    if (_db != null) {
      // ignore: avoid_print
      print('Already created!');
      return;
    }
    try {
      // ignore: no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings
      String _path = await getDatabasesPath() + 'tasks.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, ver) {
          // ignore: avoid_print
          print('Creating a new one');
          return db.execute(
            "CREATE TABLE $_tableName("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "title STRING,note TEXT, date STRING, "
            "startTime STRING, endTime STRING, "
            "remiind INTEGER,repeat STRING, color INREGER,"
            "isCompleted INTEGER)",
          );
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    // ignore: avoid_print
    print('insert function called');
    return await _db!.insert(_tableName, task!.toJson());
  }

  static Future<List<Map<String, dynamic>>> query() async {
    // ignore: avoid_print
    print('query fun called');
    return await _db!.query(_tableName);
  }

  static delete(Task _) async {
    return await _db?.delete(_tableName, where: 'id=?', whereArgs: [_.id]);
  }

  static update(int id) async {
    return await _db!.rawUpdate('''
        UPDATE  $_tableName SET isCompleted = ?
        WHERE id = ?
        ''', [1, id]);
  }
}
