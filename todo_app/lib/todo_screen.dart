import 'package:flutter/material.dart';
import 'package:todo_app/add_task_screen.dart';
import 'package:todo_app/widget/TaskList.dart';


class TodoScreen extends StatefulWidget {
  static const String id = 'todo_screen';
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(context: context,
          builder: (context)=>SingleChildScrollView(
          child: Container(
          color: Colors.orangeAccent,
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskScreen(),
          ),
          )

          );
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
            child: TaskList(),
          ),
        )
      ],),
    );
  }
}
