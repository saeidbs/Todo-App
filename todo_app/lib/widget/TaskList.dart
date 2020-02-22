import 'package:flutter/material.dart';


class TaskList extends StatefulWidget {
  List<ListTile> list=[
    ListTile(
      title: Text("task 1"),
    onTap:()=> print("amir kiri"),)

  ];
  @override
  _TaskListState createState() => _TaskListState();
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
