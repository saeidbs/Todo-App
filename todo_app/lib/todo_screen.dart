import 'package:flutter/material.dart';


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
              )
            ],
          ),
        )
      ],),
    );
  }
}
