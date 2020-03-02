import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/dataBase/dataHelper/tables/TodoTable.dart';
import 'package:todo_app/dataBase/dataManager/DataManager.dart';

import 'package:todo_app/utility/Values.dart';

import 'Task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);

    Values.dataManager.getTodoDAO().add(newTaskTitle);

    notifyListeners();
  }

  void setTasks(List<Task> list){
    _tasks=list;
    notifyListeners();

  }

  void updateToggleTask(Task task) {
    task.toggleDone();


    //bayad database ham ezafe konam
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);

    Values.dataManager.getTodoDAO().delete(task.name);
    notifyListeners();
  }
}