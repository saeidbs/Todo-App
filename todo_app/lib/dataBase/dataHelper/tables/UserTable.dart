import 'package:todo_app/dataBase/dataHelper/tables/BaseTable.dart';

class UserTable with BaseTable{
  static const String _ID_COLUMN = "_id";
static const String TABLE_NAME="user";
static const String EMAIL_COLUMN="email_user";
static const String PASSWORD_COLUMN="password_user";


static String getCreateTableString(){

  return "CREATE TABLE " + TABLE_NAME + "("
      + _ID_COLUMN + " INTEGER PRIMARY KEY AUTOINCREMENT, "
      + EMAIL_COLUMN + " TEXT, "
      + PASSWORD_COLUMN + " TEXT, "
      + "UNIQUE(" + EMAIL_COLUMN + ")"
      + ")";
}

}