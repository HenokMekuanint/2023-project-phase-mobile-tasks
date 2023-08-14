import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/domain/repositories/todo_repository.dart';
import 'package:todo_app/features/domain/usecases/todo_use_case.dart';

class DeleteTask implements UseCase<void, String> {
  final TaskRepository repository;
  DeleteTask({required this.repository});
  @override
  Future<Either<Failure, void>> call(String taskId) async {
    return await repository.deleteTask(taskId);
  }
}
