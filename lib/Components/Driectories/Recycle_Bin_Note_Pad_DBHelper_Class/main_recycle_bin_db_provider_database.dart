import 'package:sqflite/sqflite.dart';

import '../../../Models/note_pad_model_class.dart';
import '../Note_Pad_DBHelper_Classes/main_note_pad_dbhelper.dart';

class RecycleBinProvider {
  static const String recycleBinTableName = "RecycleBin";
  static const String recycleBinColumID = "id";
  static const String recycleBinColumTitle = "title";
  static const String recycleBinColumDescription = "description";
  static const String recycleBinCreateTable =
      """CREATE TABLE $recycleBinTableName($recycleBinColumID INTEGER PRIMARY KEY AUTOINCREMENT,$recycleBinColumTitle TEXT,$recycleBinColumDescription TEXT)""";


  //Todo: ya hm ny jo History ka table alg sa bnya ha ays  ki get ka method ha
  //Todo: jo ka hm history page pr use kry ga.
  // ** get All data receive this NotePad (getPage) and show this data (HistoryPage)
  Future<List<NotePadModelClass>> getRecycleBinData() async {
    Database db = await NotePadDBHelper.dataBaseFunction;
    var rowID = await db.query(recycleBinTableName);
    return rowID.map((fetch) => NotePadModelClass.fromMap(fetch)).toList();
  }


    
  Future<bool> deleteRecycleBinData({int? id}) async {
    Database db = await NotePadDBHelper.dataBaseFunction;
    int rowID = await db.delete(recycleBinTableName,
        where: "$recycleBinColumID = ?", whereArgs: [id]);
    return rowID == 1;
  }
}
