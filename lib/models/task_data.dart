import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy Bread'),
  ];

  int get taskCount => _tasks.length;

  Task getTask(int index) => _tasks[index];

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleDone(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void dismissTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
