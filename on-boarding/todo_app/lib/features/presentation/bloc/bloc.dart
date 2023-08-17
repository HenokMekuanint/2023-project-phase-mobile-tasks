import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/domain/usecases/add_task_use_cases.dart';
import 'package:todo_app/features/domain/usecases/delete_task_usecase.dart';
import 'package:todo_app/features/domain/usecases/update_task_usecase.dart';
import 'package:todo_app/features/domain/usecases/view_all_tasks_use_case.dart';
import 'package:todo_app/features/domain/usecases/view_task_use_case.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/input_converter.dart';

import 'event.dart';
import 'state.dart';

const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid input - the number must be a positive integer or zero';
const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String DATA_BASE_FAILURE_MESSAGE = "Database Failure";
const String LOCATION_FAILURE_MESSAGE = "Location Failure";
const String CONNECTION_FAILURE_MESSAGE = "Connection Failure";
const String PERMISSION_FAILURE_MESSAGE = "Permission Failure";

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final CreateTask createTaskUsecase;
  final ViewAllTask viewAllTaskUsecase;
  final UpdateTask updateTaskUsecase;
  final DeleteTask deleteTaskUsecase;
  final ViewTask viewtaskusecase;
  TaskBloc(
      {required this.createTaskUsecase,
      required this.viewAllTaskUsecase,
      required this.updateTaskUsecase,
      required this.deleteTaskUsecase,
      required this.viewtaskusecase})
      : super(EmptyState()) {
    on<CreateTaskEvent>(_onCreateTaskEvent);
    on<LoadAllTaskEvent>(_onLoadAllTasksEvent);
    on<GetSingleTaskEvent>(_onGetSingleTaskEvent);
    on<updateTaskEvent>(_onUpdateTaskEvent);
    on<DeleteTaskEvent>(_onDeleteTaskEvent);
  }
  Future<void> _onCreateTaskEvent(
    CreateTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(LoadingState());
    final result = await createTaskUsecase(event.taskEntity);
    result.fold(
        (failure) => emit(ErrorState(message: _mapFailureToMessage(failure))),
        (task) => emit(LoadedSingleTaskState(task: task)));
  }

  Future<void> _onLoadAllTasksEvent(
      LoadAllTaskEvent event, Emitter<TaskState> emit) async {
    emit(LoadingState());
    final result = await viewAllTaskUsecase(null);
    return result.fold(
        (failure) => emit(ErrorState(message: _mapFailureToMessage(failure))),
        (tasks) => emit(LoadedAllTasksState(tasks: tasks)));
  }

  Future<void> _onGetSingleTaskEvent(
      GetSingleTaskEvent event, Emitter<TaskState> emit) async {
    emit(LoadingState());
    final result = await viewtaskusecase(event.taskId);
    return result.fold(
        (failure) => emit(ErrorState(message: _mapFailureToMessage(failure))),
        (task) => emit(LoadedSingleTaskState(task: task)));
  }

  Future<void> _onUpdateTaskEvent(
      updateTaskEvent event, Emitter<TaskState> emit) async {
    emit(LoadingState());
    final result = await updateTaskUsecase(event.taskEntity);
    return result.fold(
        (failure) => emit(ErrorState(message: _mapFailureToMessage(failure))),
        (task) => emit(LoadedSingleTaskState(task: task)));
  }

  Future<void> _onDeleteTaskEvent(
      DeleteTaskEvent event, Emitter<TaskState> emit) async {
    emit(LoadingState());
    final result = await deleteTaskUsecase(event.taskId);
    return result.fold(
        (failure) => emit(ErrorState(message: _mapFailureToMessage(failure))),
        (_) => emit(EmptyState()));
  }


}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    case InvalidInputFailure:
      return INVALID_INPUT_FAILURE_MESSAGE;

    case ConnectionFailure:
      return CONNECTION_FAILURE_MESSAGE;
    case DatabaseFailure:
      return DATA_BASE_FAILURE_MESSAGE;
    case LocationFailure:
      return LOCATION_FAILURE_MESSAGE;
    case PermissionFailure:
      return PERMISSION_FAILURE_MESSAGE;

    default:
      return 'Unexpected error';
  }
}








//   Future<void> _onDeleteTaskEvent(
//     DeleteTaskEvent event,
//     Emitter<TodoState> emit,
//   ) async {
//     emit(LoadingState());
//     final result = await deleteTaskUseCase(event.taskId);
//     result.fold(
//       (failure) => emit(ErrorState(message: _mapFailureToMessage(failure))),
//       (_) => emit(EmptyState()),
//     );
//   }
