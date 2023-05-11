import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';

import '../models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  //is left as stateful because of TextEditingController

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  TextEditingController taskNameController = TextEditingController();

  void addNewTask() {
    Task newTask = Task(name: taskNameController.text);
    Provider.of<TaskData>(context, listen: false).addNewTask(newTask);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    taskNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  'Add Task',
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 22.0
                  )
              ),
              TextField(
                textAlign: TextAlign.center,
                autofocus: true,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 5.0,
                            color: Colors.lightBlueAccent
                        )
                    )
                ),
                controller: taskNameController,
              ),
              SizedBox(height: 20.0),
              Container(
                color: Colors.lightBlueAccent,
                width: double.infinity,
                child: TextButton(
                    onPressed: addNewTask,
                    child: Text('Add',
                      style: TextStyle(
                          color: Colors.black
                      ),)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
