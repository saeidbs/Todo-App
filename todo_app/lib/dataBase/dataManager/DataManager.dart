import 'package:sqflite/sqflite.dart';
import 'package:todo_app/dataBase/DatabaseHelper.dart';
import 'package:todo_app/dataBase/dao/TodoDAO.dart';

class DataManager{
  static DataManager _dataManger;

  TodoDAO _todoDAO;



  Database _db;

  DataManager()   {
//    DataBaseHandler dataBaseHandler=DataBaseHandler();
//    _db= await dataBaseHandler.database;
//    _initial();
    saeid();
  }

  saeid() async {
    DataBaseHandler dataBaseHandler=DataBaseHandler();
    _db= await dataBaseHandler.database;
    _initial();
  }


  void _initial(){
    _todoDAO=TodoDAO(DB: _db);

  }

  TodoDAO getTodoDAO()=>_todoDAO;

  static DataManager createDateManager() {
    if (_dataManger == null)
      _dataManger = DataManager();


    return _dataManger;
  }
}