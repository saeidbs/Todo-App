import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/dataBase/dataManager/DataManager.dart';
import 'package:todo_app/utility/Val.dart';

import 'models/TaskData.dart';


class AddTaskScreen extends StatefulWidget {

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTaskTitle;
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
                print("1$newTaskTitle");
              },
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () async {
                //Provider.of<TaskData>(context).addTask(newTaskTitle);
                print("akharin chiz $newTaskTitle");
                await  Provider.of<TaskData>(context).addTask(newTaskTitle);
               // await  Provider.of<Val>(context).taskData.addTask(newTaskTitle);
//                  await Values.dataManager.getTodoDAO().add(newTaskTitle);
//                print("ridi");
//                  print(await Values.dataManager.getTodoDAO().queryAllRows());






                Navigator.pop(context);

              },
            ),
          ],
        ),
      ),
    );
  }
}


