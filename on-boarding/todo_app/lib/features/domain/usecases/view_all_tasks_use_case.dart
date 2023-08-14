import 'package:dartz/dartz.dart';
import 'package:todo_app/core/entities/todo_entity.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/domain/repositories/todo_repository.dart';
import 'package:todo_app/features/domain/usecases/todo_use_case.dart';

class ViewAllTask implements UseCase<List<TaskEntity>, void> {
  final TaskRepository repository;
  ViewAllTask({required this.repository});
  @override
  Future<Either<Failure, List<TaskEntity>>> call(void params) async {
    return await repository.viewAllTasks();
  }
}
