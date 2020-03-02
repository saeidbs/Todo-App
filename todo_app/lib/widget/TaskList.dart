import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/dataBase/dataHelper/tables/TodoTable.dart';
import 'package:todo_app/models/TaskData.dart';
import 'package:todo_app/utility/Val.dart';
import 'package:todo_app/widget/TaskTile.dart';


class TaskList extends StatefulWidget {
//  List<ListTile> list=[
//    ListTile(
//      title: Text("task 1"),
//    onTap:()=> print(TodoTable.getCreateTableString()),)
//
//  ];
//  List<ListTile> list;
//
//  TaskList({this.list});


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
    return Consumer<TaskData>(
        builder: (context, taskData, child) {
    return ListView.separated(
      itemBuilder: (context,index){
      final task=  taskData.tasks[index];
      return TaskTile(
        isChecked: task.isDone ,
         taskTitle: task.name,
          checkboxCallback: (checkboxState){
            taskData.updateToggleTask(task);
          },
          longPressCallback: (){
            taskData.deleteTask(task);
          },
      );
      },
      itemCount: taskData.taskCount,
      separatorBuilder: (BuildContext context, int index) =>  Divider(
        height: 10,
      color: Colors.lightBlueAccent,),


    );
  },
    );
//        return Consumer<Val>(
//        builder: (context, val, child) {
//    return ListView.separated(
//      itemBuilder: (context,index){
//      final task=  val.taskData.tasks[index];
//      return TaskTile(
//        isChecked: task.isDone ,
//         taskTitle: task.name,
//          checkboxCallback: (checkboxState){
//            val.taskData.updateToggleTask(task);
//          },
//          longPressCallback: (){
//            val.taskData.deleteTask(task);
//          },
//      );
//      },
//      itemCount: val.taskData.taskCount,
//      separatorBuilder: (BuildContext context, int index) =>  Divider(
//        height: 10,
//      color: Colors.lightBlueAccent,),
//
//
//    );
//  },
//    );
//
  }
//  @override
//  Widget build(BuildContext context) {
//    return ListView.separated(
//      itemBuilder: (context,index){
//
//      return widget.list[index];
//      },
//      itemCount: widget.list.length,
//      separatorBuilder: (BuildContext context, int index) =>  Divider(
//        height: 10,
//      color: Colors.lightBlueAccent,),
//
//
//    );
//  }

}
