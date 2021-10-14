import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseController{
  static Database database;
  static const dbName = 'feedbacks.db';

  DatabaseController._();
  static DatabaseController databaseController;

  static DatabaseController getInstance()
  {
    if(databaseController==null)
    {
      databaseController = DatabaseController._();
    }
    return databaseController;
  }


  // To initialization the db.
  connectToDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);
    database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      //
      await db.execute(
          "CREATE TABLE feedbacks(id varchar PRIMARY KEY, "
              "name varchar, "
              "email varchar, "
              "feedback varchar "
              ")"
      );
    });
    print('Initialized DB');
  }


  insert(String tableName, Map map) async {
    try{
      int res = await database.insert(tableName, map);//
      print("res $res");
    } catch(e)
    {
      print("EXCEPTION: $e");
    }
  }


  Future<List<Map>> getRecords() async
  {
    String query = "SELECT * FROM feedbacks";
    List<Map> list=null;
    try{
      list = await database.rawQuery(query);
      print("getRecords: $list");
    }
    catch(e)
    {
      return null;
    }

    return list;
  }
}