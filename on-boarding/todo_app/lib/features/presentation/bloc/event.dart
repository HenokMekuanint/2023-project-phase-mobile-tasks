// import 'package:building_layouts/core/entities/todo_entity.dart';

import 'package:todo_app/core/entities/todo_entity.dart';
import 'package:equatable/equatable.dart';

class TaskEvent extends Equatable {
  const TaskEvent();
  @override
  List<Object> get props => [];
}

class LoadAllTaskEvent extends TaskEvent {}

class CreateTaskEvent extends TaskEvent {
  final TaskEntity taskEntity;
  const CreateTaskEvent({required this.taskEntity});
}

class GetSingleTaskEvent extends TaskEvent {
  final String taskId;
  const GetSingleTaskEvent({required this.taskId});
  @override
  List<Object> get props => [taskId];
}

class updateTaskEvent extends TaskEvent {
  final TaskEntity taskEntity;
  const updateTaskEvent({required this.taskEntity});
}

class DeleteTaskEvent extends TaskEvent {
  final String taskId;
  const DeleteTaskEvent({required this.taskId});
  @override
  List<Object> get props => [taskId];
}





