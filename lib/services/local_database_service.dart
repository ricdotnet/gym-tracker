import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class LocalDatabaseService {
  static late Database db;

  Future<void> init() async {
    db = await openDatabase(
      path.join(await getDatabasesPath(), 'todos_database.db'),
      onCreate: (db, version) {
        // return db.execute('CREATE TABLE todos ('
        //     'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        //     'content TEXT, '
        //     'created DATETIME, '
        //     'alert DATETIME, '
        //     'completed INTEGER)' // completed will store as either 1 or 0 for completed or not
        // );
      },
      version: 1,
    );
  }

  Database database() {
    return db;
  }
}