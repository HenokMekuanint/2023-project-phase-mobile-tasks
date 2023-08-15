import 'package:todo_app/features/domain/task_model/task_manager_model.dart';
import 'package:todo_app/features/domain/entities/task_entity.dart';

class TaskController {
  static final TaskController _instance = TaskController._internal();

  factory TaskController() {
    return _instance;
  }

  TaskController._internal();

  TaskManager taskManager = TaskManager();
}