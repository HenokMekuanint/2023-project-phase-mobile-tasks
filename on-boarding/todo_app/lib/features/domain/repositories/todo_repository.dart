import 'package:dartz/dartz.dart';

import 'package:todo_app/core/entities/todo_entity.dart';
import 'package:todo_app/core/errors/failure.dart';

abstract class TaskRepository {
  Future<Either<Failure, TaskEntity>> createTask(TaskEntity task);
  Future<Either<Failure, TaskEntity>> viewTask(String taskId);
  Future<Either<Failure, List<TaskEntity>>> viewAllTasks();
  Future<Either<Failure, void>> deleteTask(String taskId);
  Future<Either<Failure, TaskEntity>> updateTask(TaskEntity task);
}
