// import 'package:note_pad2/Components/Driectories/History_Note_Pad_DBHelper_Class/main_history_db_provider_database.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class HistoryDBHelper {
//   static const String dataBaseName = "history.db";
//   static const int dataBaseVersion = 1;
//   static Database? _database;

//   static Future<Database> get dataBaseHistoryFunction async {
//     ///* (getDatabasesPath) as laya use hota ha q ka as app ma jo bhi data
//     ///* (CRUD) operation sa get ho ga wo data app ma store krwany ka laya
//     ///*(getDatabasesPath) asy use krty ha ya ak trha as dataBase ki location ha.
//     ///* aur ak temporary folder hmre app ka create kr dyta ha jo hmra Mobile ki files
//     ///* ma save ho jate ha
//     String directory = await getDatabasesPath();

//     ///* ab hm na apny (CRUD) operation sa aya howa data ko js jaga save
//     ///* krwana ha asy koi (name) dy ga ase waja sa hm ny (join function)
//     ///* ko use kya ha
//     ///* What is join? join function table bnany ka km nhi ata blka {join path}
//     ///* ko handle krta ha . Join function real ma two thing ko combine krny ka
//     ///* laya use hota haa
//     String path = join(directory, dataBaseName);
//     return _database ??
//         await openDatabase(
//           path,
//           version: dataBaseVersion,
//           onCreate: (Database db, int version) {
//             db.execute(HistoryProvider.historyCreateTable);
            
//           },
          
//         );
//   }
// }
