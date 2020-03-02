

import 'package:sqflite/sqlite_api.dart';
import 'package:todo_app/dataBase/dataHelper/tables/UserTable.dart';

class UserDAO{

  Database DB;
  UserDAO({this.DB});

  Future<int> add({String email,String passWord}) async{
//    DB=await DataManager.dataManger.database;
    Map<String,String> map={
      UserTable.EMAIL_COLUMN:email,
      UserTable.PASSWORD_COLUMN:passWord
    };
    return await DB.insert(UserTable.TABLE_NAME, map);
  }

  Future<String> getPassword({String email}) async {

    List<Map<String, dynamic>> listy= await DB.query(UserTable.TABLE_NAME);

    print(listy[0][UserTable.EMAIL_COLUMN]);
    print(email);
    List<Map<String, dynamic>> list= await DB.rawQuery(
      "SELECT ${UserTable.PASSWORD_COLUMN}"+
        " FROM ${UserTable.TABLE_NAME}"+
        " WHERE ${UserTable.EMAIL_COLUMN} = ?",
     [email]
    );

    print("password ine" +list[0][UserTable.PASSWORD_COLUMN]);
    return list[0][UserTable.PASSWORD_COLUMN];

    
    
  }

}