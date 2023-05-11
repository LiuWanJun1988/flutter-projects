import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';
import 'dart:collection';

import 'task.dart';

class TaskData extends ChangeNotifier{
  List<Task> _tasks = [];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addNewTask(Task _task){
    _tasks.add(_task);
    notifyListeners();
  }

  void updateTask(Task _task){
    _task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task _task){
    _tasks.remove(_task);
    notifyListeners();
  }
}