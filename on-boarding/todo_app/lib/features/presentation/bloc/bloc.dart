import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/entities/todo_entity.dart';
import 'package:todo_app/features/domain/usecases/add_task_use_cases.dart';
import 'package:todo_app/features/domain/usecases/delete_task_usecase.dart';
import 'package:todo_app/features/domain/usecases/update_task_usecase.dart';
import 'package:todo_app/features/domain/usecases/view_all_tasks_use_case.dart';
import 'package:todo_app/features/presentation/bloc/event.dart';
import 'package:todo_app/features/presentation/bloc/state.dart';
import 'dart:async';

import 'package:todo_app/features/presentation/pages/add_task/add_task.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final ViewAllTask viewAllTask;
  TaskBloc({ required this.viewAllTask})
      : super(LoadingInitialState()) {
    on<GetTasksEvent>((event, emit) async {
      emit(LoadingState());
      final tasks = await viewAllTask.call({});
      tasks.fold((l) => emit(LoadedErrorState("Error")),
          (r) => (LoadedSuccessState(tasks: r)));
    });
  }
}
