import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final bool isDone;
  final String taskName;
  final Function callback;

  TaskTile({this.isDone, this.taskName, this.callback});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
          taskName,
      style: isDone ? TextStyle(decoration: TextDecoration.lineThrough) : TextStyle()),
      activeColor: Colors.lightBlueAccent,
      value: isDone,
      onChanged: callback,
    );
  }
}