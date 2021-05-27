import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';

class InputSheet extends StatelessWidget {
  final _textFieldBorder = UnderlineInputBorder(
    borderSide: new BorderSide(
      width: 5.0,
      color: Colors.lightBlueAccent,
    ),
  );

  InputSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String newTaskName = '';
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              letterSpacing: -1.0,
              fontSize: 30.0,
            ),
          ),
          TextField(
            onChanged: (value) => newTaskName = value,
            autofocus: true,
            cursorWidth: 4,
            textAlign: TextAlign.center,
            cursorColor: Colors.lightBlueAccent,
            decoration: InputDecoration(
              focusedBorder: _textFieldBorder,
              enabledBorder: _textFieldBorder,
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextButton(
            onPressed: () {
              if (newTaskName != '') {
                final task = Task(name: newTaskName);
                Provider.of<TaskData>(context, listen: false).addTask(task);
                Navigator.pop(context);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent,
              primary: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
