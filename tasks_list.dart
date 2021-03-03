import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
//import 'package:todoey_flutter/models/task.dart';

class TasksList extends StatelessWidget {
  //final List<Task> tasks;
//  TasksList(this.tasks);
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              //Replaced Provider.of<TaskData>(context) with taskData because of consumer widget
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (bool checkboxState) {
                taskData.updateTask(task);
                print(taskData.tasks[index].isDone);
                print(index);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
                print(task.name);
                print(index);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

//deleted the set state of checkboxcallback as we are using provider package and make the tasklist as stateless widget.
// setState(
//   () {
//     widget.tasks[index].toggleDone();
//     print(widget.tasks[index].isDone);
//     //print(checkboxState);
//   },
//);
