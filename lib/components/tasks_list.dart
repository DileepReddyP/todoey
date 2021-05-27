import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_tile.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey<String>(taskData.getTask(index).name),
              background: Container(
                color: Colors.lightBlueAccent,
              ),
              onDismissed: (direction) => taskData.dismissTask(index),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: TaskTile(
                  task: taskData.getTask(index),
                  onChange: () {
                    taskData.toggleDone(index);
                  },
                ),
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
