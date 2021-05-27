import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

void _hello() {}

class TaskTile extends StatelessWidget {
  final Task task;
  final Function onChange;
  const TaskTile({Key? key, required this.task, this.onChange = _hello})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.name,
        style: TextStyle(
          decoration: task.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        onChanged: (bool? value) {
          onChange();
        },
        value: task.isCompleted,
      ),
    );
  }
}
