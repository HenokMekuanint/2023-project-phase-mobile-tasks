import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/core/entities/todo_entity.dart';
import 'package:equatable/equatable.dart';

class TaskState extends Equatable {
  const TaskState();
  @override
  List<Object> get props => [];
}

class EmptyState extends TaskState {}

class LoadingState extends TaskState {}

class LoadedAllTasksState extends TaskState {
  final List<TaskEntity> tasks;
  const LoadedAllTasksState({required this.tasks});
}

class LoadedSingleTaskState extends TaskState {
  final TaskEntity task;
  const LoadedSingleTaskState({required this.task});
  @override
  List<Object> get props => [task];
}

class ErrorState extends TaskState {
  final String message;
  const ErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

// class ErrorState extends TodoState {
//   final String message;

//   const ErrorState({required this.message});

//   @override
//   List<Object> get props => [message];
// }