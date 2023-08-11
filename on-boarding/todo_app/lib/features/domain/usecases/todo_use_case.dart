import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
