import 'package:todo_app/dataBase/dataHelper/tables/BaseTable.dart';

class TodoTable {
  static const String _ID_COLUMN = "_id";
  static const String TABLE_NAME="todo";
  static const String USER_COLUMN="user_todo";
  static const String TEXT_COLUMN="text_todo";


  static String getCreateTableString(){

    return "CREATE TABLE " + TABLE_NAME + "("
        + _ID_COLUMN + " INTEGER PRIMARY KEY AUTOINCREMENT, "
        + TEXT_COLUMN + " TEXT "
        + ")";
  }

  static dynamic getAllColumns(){
    return [
      _ID_COLUMN,
      TEXT_COLUMN
    ];
  }
  static dynamic getAllColumnsWithoutID(){
    return [
      TEXT_COLUMN
    ];
  }






}