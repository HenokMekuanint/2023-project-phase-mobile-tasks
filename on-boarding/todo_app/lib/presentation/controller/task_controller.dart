import 'package:todo_app/domain/task_model/task_manager_model.dart';
import 'package:todo_app/domain/task_model/task_model.dart';

class TaskController {
  static final TaskController _instance = TaskController._internal();

  factory TaskController() {
    return _instance;
  }

  TaskController._internal();

  TaskManager taskManager = TaskManager();
}