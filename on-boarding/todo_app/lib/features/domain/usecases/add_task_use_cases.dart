import 'package:dartz/dartz.dart';
import 'package:todo_app/core/entities/todo_entity.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/domain/repositories/todo_repository.dart';
import 'package:todo_app/features/domain/usecases/todo_use_case.dart';

class CreateTask implements UseCase<TaskEntity, TaskEntity> {
  final TodoRepository repository;
  CreateTask({required this.repository});

  @override
  Future<Either<Failure, TaskEntity>> call(TaskEntity taskEntity) async {
    return await repository.createTask(taskEntity);
  }
}
