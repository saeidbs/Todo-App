import 'package:flutter/material.dart';
import 'package:todo_app/dataBase/dataHelper/tables/TodoTable.dart';
import 'package:todo_app/utility/Values.dart';


class TaskList extends StatefulWidget {
//  List<ListTile> list=[
//    ListTile(
//      title: Text("task 1"),
//    onTap:()=> print(TodoTable.getCreateTableString()),)
//
//  ];
  List<ListTile> list;

  TaskList({this.list});


  @override
  _TaskListState createState() => _TaskListState();

//  Future updateList()  async {
//
//     list=await Values.dataManager.getTodoDAO().queryAllRows();
//
//
//}



}

class _TaskListState extends State<TaskList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index){

      return widget.list[index];
      },
      itemCount: widget.list.length,

    );
  }

}
