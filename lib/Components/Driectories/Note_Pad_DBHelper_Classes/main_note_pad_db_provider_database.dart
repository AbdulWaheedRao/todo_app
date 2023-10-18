import 'package:note_pad2/Components/Driectories/Recycle_Bin_Note_Pad_DBHelper_Class/main_recycle_bin_db_provider_database.dart';
import 'package:sqflite/sqflite.dart';
import '../../../Models/note_pad_model_class.dart';
import 'main_note_pad_dbhelper.dart';

class NotePadProvider {
  static const String notePadTableName = "NotePad";
  static const String columID = "id";
  static const String columTitle = "title";
  static const String columDescription = "description";
  static const String createTable =
      """CREATE TABLE $notePadTableName($columID INTEGER PRIMARY KEY AUTOINCREMENT,$columTitle TEXT,$columDescription TEXT)""";

  // Todo:  Insert function help this inserting this data .
  Future<bool> insertNotePad({NotePadModelClass? modelClass}) async {
    Database db = await NotePadDBHelper.dataBaseFunction;
    int rowID = await db.insert(notePadTableName, modelClass!.toMap());
    return rowID == 1;
  }

  // Todo: Fetching function means data ko view krwany ka method
  Future<List<NotePadModelClass>> getNotePad() async {
    Database db = await NotePadDBHelper.dataBaseFunction;
    List<Map<String, dynamic>> data = await db.query(notePadTableName);
    return data
        .map((mainScreen) => NotePadModelClass.fromMap(mainScreen))
        .toList();
  }

  // Todo: update function means ka apny insert data ko update krny ka function .
  Future<bool> updateNotePad({required NotePadModelClass modelClass}) async {
    Database db = await NotePadDBHelper.dataBaseFunction;
    int rowID = await db.update(notePadTableName, modelClass.toMap(),
        where: '$columID = ? ', whereArgs: [modelClass.id]);
    return rowID == 1;
  }

  // Todo: delete function means apna insert data ko delete krny ka method.
  ///* hm na apny data ko delete krwany ka laya ya Query write ki ha .ab hm na
  ///* apny delete data ki (RecycleBin) chaya the ka jo data delete ho wo hmre
  ///* recycleBin ma chla jaye to hm na ak alg sa table bnya aur as table ki (ModelClass)
  ///* hm na (NotePadModelClass) ki trha same hi rakhe aur hm ny (deleteNotePad)
  ///* ka method ma sb sa phly data ko apny Phly waly table ma fetch krwaya aur
  ///* Query() method use kya as ka bf hm na apny data ko insert query ka use
  ///* krty howa apna delete sa phly wala data ko insert krwa laya . insert hm
  ///* na apny RecycleBin ma krwaya .
  ///* ab jb bhi EndUser data ko delete kry ga to hmy delete hony wala data
  ///* hmre RecycleBin Page pr mil jaya ga.
  Future<bool> deleteNotePad({required int? id}) async {
    Database db = await NotePadDBHelper.dataBaseFunction;
    final note = await db
        .query(notePadTableName, where: "$columID = ? ", whereArgs: [id]);
    await db.insert(RecycleBinProvider.recycleBinTableName, note.first);
    int rowID = await db
        .delete(notePadTableName, where: '$columID = ? ', whereArgs: [id]);
    return rowID >= 0;
  }
}
