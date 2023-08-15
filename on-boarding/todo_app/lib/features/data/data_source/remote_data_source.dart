import 'package:todo_app/core/entities/todo_entity.dart';
import 'package:todo_app/features/data/models/todo_model.dart';

abstract class TaskRemoteDataSource {
  Future<TaskModel> createTask(TaskEntity taskEntity);
  Future<TaskModel> viewTask(String taskId);
  Future<List<TaskModel>> viewAllTasks();
  Future<void> deleteTask(String taskId);
  Future<TaskModel> updateTask(TaskEntity taskEntity);
}


