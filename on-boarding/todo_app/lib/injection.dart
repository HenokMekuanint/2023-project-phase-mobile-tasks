import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/features/data/data_source/local_data_source.dart';
import 'package:todo_app/features/data/data_source/local_data_source_impl.dart';
import 'package:todo_app/features/data/data_source/remote_data_source.dart';
import 'package:todo_app/features/data/data_source/remote_data_source_impl.dart';
import 'package:todo_app/features/data/repositories/task_repo.dart';
import 'package:todo_app/features/domain/repositories/todo_repository.dart';
import 'package:todo_app/features/domain/usecases/add_task_use_cases.dart';
import 'package:todo_app/features/domain/usecases/delete_task_usecase.dart';
import 'package:todo_app/features/domain/usecases/update_task_usecase.dart';
import 'package:todo_app/features/domain/usecases/view_all_tasks_use_case.dart';
import 'package:todo_app/features/domain/usecases/view_task_use_case.dart';
import 'package:todo_app/features/presentation/bloc/bloc.dart';

import 'core/networkinfo/network_info.dart';
import 'core/utils/input_converter.dart';


final sl = GetIt.instance;

Future<void> init() async {
  //! Feature- Todo

  // Bloc
  sl.registerFactory(
    () => TaskBloc(
      createTaskUsecase: sl(),
      viewAllTaskUsecase: sl(),
      viewtaskusecase: sl(),
      updateTaskUsecase: sl(),
      deleteTaskUsecase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(
    () => CreateTask(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ViewAllTask(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ViewTask(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UpdateTask(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => DeleteTask(
      repository: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<TaskRepository>(
    () => TaskRepoImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources

  sl.registerLazySingleton<TaskRemoteDataSource>(
    () => TaskremoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<TaskLocalDataSource>(
    () => TaskLocalDataSourceIml(
      sharedPreferences: sl(),
    ),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectivity: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
}