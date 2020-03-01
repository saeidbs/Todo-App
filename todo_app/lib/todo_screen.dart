import 'package:flutter/material.dart';
import 'package:todo_app/add_task_screen.dart';
import 'package:todo_app/dataBase/dataManager/DataManager.dart';
import 'package:todo_app/utility/Values.dart';
import 'package:todo_app/widget/TaskList.dart';
import 'package:todo_app/dataBase/DatabaseHelper.dart';

import 'dataBase/dataHelper/tables/TodoTable.dart';


class TodoScreen extends StatefulWidget {
  static const String id = 'todo_screen';
  List<ListTile> listTile=[
    ListTile(
      title: Text("task 1"),
    onTap:()=> print(TodoTable.getCreateTableString()),)

  ];


  @override
  _TodoScreenState createState() => _TodoScreenState();


}

class _TodoScreenState extends State<TodoScreen> {
@override
   void initState()  {
    super.initState();
    updatelist();

  }




  void updatelist() async {

    List<ListTile> test=await Values.dataManager.getTodoDAO().queryAllRows();
    print("masoud");
    setState(()  {
      widget.listTile=test;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
          builder: (context)=>SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskScreen(),
          ),
          )
          ).whenComplete((){
            updatelist();
          });
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 60,left: 30,right: 30,bottom: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                child:Icon(
                  Icons.list,
                size: 30,
                    color: Colors.orangeAccent,
                ),
                backgroundColor: Colors.blueGrey,
                radius: 30,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "TodoList",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w600
                ),
              ),
              Text(
                "5 work to do",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0)
            )
            ),
            child: TaskList(list:  widget.listTile,),
          ),
        )
      ],),
    );
  }
}
