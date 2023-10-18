import 'package:note_pad2/Components/Driectories/Recycle_Bin_Note_Pad_DBHelper_Class/main_recycle_bin_db_provider_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'main_note_pad_db_provider_database.dart';

class NotePadDBHelper {
  static const String dataBaseName = "notepad.db";
  static const int dataBaseVersion = 3;
  static Database? _database;

  static Future<Database> get dataBaseFunction async {
    String directory = await getDatabasesPath();

    String path = join(directory, dataBaseName);
    return _database ??
        await openDatabase(
          path,
          version: dataBaseVersion,
          onCreate: (Database db, int version) {
            db.execute(NotePadProvider.createTable);
            db.execute(RecycleBinProvider.recycleBinCreateTable);
          },
        );
  }
}
