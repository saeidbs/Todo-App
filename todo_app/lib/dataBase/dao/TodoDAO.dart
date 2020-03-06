import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/dataBase/dataHelper/tables/TodoTable.dart';
import 'package:todo_app/dataBase/dataManager/DataManager.dart';
import 'package:todo_app/models/Task.dart';
import 'package:todo_app/utility/Values.dart';


class TodoDAO{
   Database DB;
  TodoDAO({this.DB});


  Future<int> add(String string) async{
//    DB=await DataManager.dataManger.database;
Map<String,dynamic> map={
TodoTable.TEXT_COLUMN:string,
  TodoTable.USER_COLUMN:Values.logginUser.email,
  TodoTable.IS_CHECKED:0
};
return await DB.insert(TodoTable.TABLE_NAME, map);
}

//dynamic getTodo(){
// return DB.execute("Select * From "+TodoTable.TABLE_NAME);
//
//}
  Future<List<Task>> queryAllRows()  async {
//    DB=await DataManager.dataManger.database;

   // List<Map<String, dynamic>> list= await DB.query(TodoTable.TABLE_NAME);


    List<Map<String, dynamic>> list= await DB.rawQuery(
        "SELECT ${TodoTable.TEXT_COLUMN},${TodoTable.IS_CHECKED}"+
            " FROM ${TodoTable.TABLE_NAME}"+
            " WHERE ${TodoTable.USER_COLUMN} = ?",
        [Values.logginUser.email]
    );

    bool isChecked;
    List<Task> listTile=List<Task>();
    list.forEach((map){

      if(map[TodoTable.IS_CHECKED]==1)
        isChecked=true;
      else
        isChecked=false;

      print(isChecked);
      listTile.add(Task(
        name: map[TodoTable.TEXT_COLUMN],
        isDone: isChecked
      ));

    });
    print(list);



//    List<ListTile> listTile=List<ListTile>();
//    print("tool $list.length");
//    list.forEach((map){
//      print("111");
//    listTile.add(ListTile(
//      title: Text(map[TodoTable.TEXT_COLUMN]),
//      onLongPress: (){
//        Values.dataManager.getTodoDAO().delete(map[TodoTable.TEXT_COLUMN]);
//
//      },
//    ));
//
//    });

    return listTile;
  }

   Future<int> delete(String task){

    return DB.delete(TodoTable.TABLE_NAME,where: TodoTable.TEXT_COLUMN+' = ?', whereArgs: [task]);

  }
  
  void update(String task,int isChecked) async {
    await DB.rawQuery(
      "update ${TodoTable.TABLE_NAME} "+
      "set ${TodoTable.IS_CHECKED} = ? "+
      "where ${TodoTable.USER_COLUMN} = ? "+
      "and ${TodoTable.TEXT_COLUMN} = ? "
      ,[isChecked,
      Values.logginUser.email,
      task]);

    List<Map<String,dynamic>> list=await await DB.rawQuery(
        "SELECT ${TodoTable.IS_CHECKED}"+
            " FROM ${TodoTable.TABLE_NAME}"+
            " WHERE ${TodoTable.USER_COLUMN} = ? "+
            "and ${TodoTable.TEXT_COLUMN} = ?",
        [Values.logginUser.email,
          task]
    );

    print("khele khob $isChecked");
    print(list[0][TodoTable.IS_CHECKED]);
  }


}