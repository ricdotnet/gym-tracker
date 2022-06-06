import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class LocalDatabaseService {
  static late Database db;

  Future<void> init() async {
    db = await openDatabase(
      path.join(await getDatabasesPath(), 'gym_tracker.db'),
      onCreate: (db, version) {
        // nothing here for now
      },
      onOpen: (db) async {
        // read gym_tracker.sql
        // after reading create a list that splits by ---
        // iterate through the list of tables and execute a db.batch() group of queries
        String sqlFileContent = await rootBundle.loadString('gym_tracker.sql');
        List<String> tables = sqlFileContent.split('---');

        var batch = db.batch();
        for (var table in tables) {
          batch.execute(table);
        }
        batch.commit();
      },
      version: 1,
    );
  }

  Database database() {
    return db;
  }
}
