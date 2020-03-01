import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/dataBase/dataHelper/tables/TodoTable.dart';
import 'package:todo_app/dataBase/dataManager/DataManager.dart';

class TodoDAO{
   Database DB;
  TodoDAO({this.DB});


  Future<int> add(String string) async{
//    DB=await DataManager.dataManger.database;
Map<String,String> map={
TodoTable.TEXT_COLUMN:string
};
return await DB.insert(TodoTable.TABLE_NAME, map);
}

dynamic getTodo(){
 return DB.execute("Select * From "+TodoTable.TABLE_NAME);
  
}
  Future<List<ListTile>> queryAllRows()  async {
//    DB=await DataManager.dataManger.database;

    List<Map<String, dynamic>> list= await DB.query(TodoTable.TABLE_NAME);

    List<ListTile> listTile=List<ListTile>();
    print("tool $list.length");
    list.forEach((map){
      print("111");
    listTile.add(ListTile(title: Text(map[TodoTable.TEXT_COLUMN]),));

    });

    return listTile;
  }


}