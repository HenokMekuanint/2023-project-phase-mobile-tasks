import 'package:todo_app/features/data/models/todo_model.dart';

abstract class TaskLocalDataSource {
  Future<TaskModel> getTask(String key);
  Future<List<TaskModel>> getTasks(String key);
  Future<void> cacheTask(String key, TaskModel todomodel);
  Future<void> cacheTasks(String key, List<TaskModel> taskmodel);
  Future<void> removeTask(String key);
}
