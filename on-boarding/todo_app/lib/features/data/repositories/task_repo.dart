import 'package:dartz/dartz.dart';
import 'package:todo_app/core/entities/todo_entity.dart';
import 'package:todo_app/core/errors/exception.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/core/networkInfo/network_info.dart';
import 'package:todo_app/features/data/data_source/local_data_source.dart';
import 'package:todo_app/features/data/data_source/remote_data_source.dart';
import 'package:todo_app/features/domain/repositories/todo_repository.dart';


class TaskRepoImpl implements TaskRepository {

  final TaskLocalDataSource localDataSource;
  final TaskRemoteDataSource remoteDataSource;
  final NetworkInfoImpl networkInfo;

  TaskRepoImpl(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, TaskEntity>> createTask(TaskEntity taskEntity) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTask = await remoteDataSource.createTask(taskEntity);
        localDataSource.cacheTask(remoteTask.id, remoteTask);
        return Right(remoteTask);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: "Server Error"));
      }
    } else {
      return Left(ConnectionFailure(message: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> viewTask(String taskId) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTask = await remoteDataSource.viewTask(taskId);
        localDataSource.cacheTask(remoteTask.id, remoteTask);
        return Right(remoteTask);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: "Server Error"));
      }
    } else {
      // get from local data source
      try {
        final localTask = await localDataSource.getTask(taskId);
        return Right(localTask);
      } on CacheException catch (e) {
        return Left(CacheFailure(message: "Cache Error"));
      }
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> viewAllTasks() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTasks = await remoteDataSource.viewAllTasks();
        localDataSource.cacheTasks("todos", remoteTasks);
        return Right(remoteTasks);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: "Server Error"));
      }
    } else {
      try {
        final localTasks = await localDataSource.getTasks("tasks");
        return Right(localTasks);
      } on CacheException catch (e) {
        return Left(CacheFailure(message: "Cache Error"));
      }
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> updateTask(TaskEntity todoEntity) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTask = await remoteDataSource.updateTask(todoEntity);
        localDataSource.cacheTask(remoteTask.id, remoteTask);
        return Right(remoteTask);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: "Server Error"));
      }
    } else {
      return Left(ConnectionFailure(message: "No Internet Connection"));
    }
  }


    @override
  Future<Either<Failure, void>> deleteTask(String taskId) async {
    if (await networkInfo.isConnected) {
      try {
        remoteDataSource.deleteTask(taskId);
        localDataSource.removeTask(taskId);
        return const Right(null);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: "Server Error"));
      }
    } else {
      return Left(ConnectionFailure(message: "No Internet Connection"));
    }
  }


}




