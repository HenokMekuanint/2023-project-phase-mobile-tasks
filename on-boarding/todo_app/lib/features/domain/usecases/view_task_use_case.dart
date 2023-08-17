import 'package:dartz/dartz.dart';

import '../../../../core/entities/todo_entity.dart';
import '../../../../core/errors/failure.dart';

import '../repositories/todo_repository.dart';
import 'todo_use_case.dart';

class ViewTask implements UseCase<TaskEntity, String> {
  final TaskRepository repository;
  ViewTask({required this.repository});

  @override
  Future<Either<Failure, TaskEntity>> call(String todoId) async {
    return await repository.viewTask(todoId);
  }
}