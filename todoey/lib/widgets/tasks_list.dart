import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //consumer is going to rebuild when taskData will change
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(itemBuilder: (context, index){

          void checkTask(){
            taskData.updateTask(taskData.tasks[index]);
          }

          return InkWell(
              onLongPress: () {
                taskData.removeTask(taskData.tasks[index]);
              },
              child: TaskTile(
                taskName: taskData.tasks[index].name,
                isDone: taskData.tasks[index].isDone,
                callback: (value) {
                  checkTask();
                },
          )
          );
          },
            itemCount: taskData.taskCount);
      },
    );
  }
}