import 'package:todo_app/features/data/models/todo_model.dart';

abstract class TaskRemoteDataSource {
  Future<TaskModel> createTask(TaskModel taskModel);
  Future<TaskModel> vieWTask(String taskId);
  Future<List<TaskModel>> viewAllTask();
  Future<TaskModel> updateTask(String taskid,TaskModel taskModel);
  Future<void> deleteTask(String taskId);
}
