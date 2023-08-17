// import 'package:todo_app/core/entities/todo_entity.dart';
// import 'package:todo_app/core/errors/failure.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mockito/mockito.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:todo_app/features/domain/usecases/update_task_usecase.dart';
// import 'package:todo_app/features/presentation/bloc/bloc.dart';
// import 'package:todo_app/features/presentation/bloc/event.dart';
// import 'package:todo_app/features/presentation/bloc/state.dart';

// import '../../helper/mock_implementation/input_converter/mock_input_converter.mock.dart';
// import '../../helper/mock_implementation/usecases/mock_create_task_use_case.mocks.dart';
// import '../../helper/mock_implementation/usecases/mock_delete_task_use_case.mocks.dart';
// import '../../helper/mock_implementation/usecases/mock_update_task_use_case.mocks.dart';
// import '../../helper/mock_implementation/usecases/mock_view_all_tasks_use_case.mocks.dart';
// import '../../helper/mock_implementation/usecases/mock_view_single_task_use_case.mocks.dart';

// void main() {
//   late MockCreateTask mockCreateTask;
//   late MockViewAllTask mockViewAllTask;
//   late MockViewTask mockViewTask;
//   late MockUpdateTask mockUpdateTask;
//   late MockDeleteTask mockDeleteTask;

//   late MockInputConverter mockInputConverter;

//   late TaskBloc todoBloc;

//   setUp(() {
//     mockCreateTask = MockCreateTask();
//     mockViewAllTask = MockViewAllTask();
//     mockViewTask = MockViewTask();
//     mockUpdateTask = MockUpdateTask();
//     mockDeleteTask = MockDeleteTask();

//     todoBloc = TaskBloc(
//         createTaskUsecase: mockCreateTask,
//         viewAllTaskUsecase: mockViewAllTask,
//         updateTaskUsecase: mockUpdateTask,
//         deleteTaskUsecase: mockDeleteTask,
//         viewtaskusecase: mockViewTask);
//   });

//   test('initialState should be EmptyState', () {
//     // assert
//     expect(todoBloc.state, equals(EmptyState()));
//   });

//   group("createTask", () {
//     const todoEntity = TaskEntity(
//         id: "1",
//         title: "Bloc Test",
//         description: "Bloc test description",
//         status: false,
//         duedate: "Aug 09 2023");

//     blocTest('emits [LoadingState, LoadedState] when task created successfully',
//         build: () {
//           return TaskBloc(
//               createTaskUsecase: mockCreateTask,
//               viewAllTaskUsecase: mockViewAllTask,
//               updateTaskUsecase: mockUpdateTask,
//               deleteTaskUsecase: mockDeleteTask,
//               viewtaskusecase: mockViewTask);
//         },
//         act: (bloc) => bloc.add(const CreateTaskEvent(taskEntity: todoEntity)),
//         expect: () => [
//               LoadingState(),
//               const LoadedSingleTaskState(task: todoEntity,),
//             ],
//         verify: (_) {
//           verify(mockCreateTask(any)).called(1);
//         });

//     blocTest(
//       'emits [LoadingState, ErrorState] when create task fails',
//       build: () {
//         when(mockCreateTask(any)).thenAnswer(
//             (_) async => Left(ServerFailure(message: SERVER_FAILURE_MESSAGE)));
//         return TaskBloc(
//               createTaskUsecase: mockCreateTask,
//               viewAllTaskUsecase: mockViewAllTask,
//               updateTaskUsecase: mockUpdateTask,
//               deleteTaskUsecase: mockDeleteTask,
//               viewtaskusecase: mockViewTask
//         );
//       },
//       act: (bloc) => bloc.add(const CreateTaskEvent(taskEntity: todoEntity)),
//       expect: () => [
//         LoadingState(),
//         const ErrorState(message: SERVER_FAILURE_MESSAGE),
//       ],
//     );
//   });

//   group("LoadAllTasksEvent", () {
//     const todoE = TaskEntity(
//         id: "1",
//         title: "Bloc Test",
//         description: "Bloc test description",
//         status: false,
//       duedate: "aug 9 2023"
        
//         );
//     blocTest(
//       'emits [LoadingState, LoadedAllTasksState] when view all tasks successfully',
//       build: () {
//         when(mockViewAllTask(any))
//             .thenAnswer((_) async => const Right([todoE]));
//         return TaskBloc(
//               createTaskUsecase: mockCreateTask,
//               viewAllTaskUsecase: mockViewAllTask,
//               updateTaskUsecase: mockUpdateTask,
//               deleteTaskUsecase: mockDeleteTask,
//               viewtaskusecase: mockViewTask
//         );
//       },
//       act: (bloc) => bloc.add(LoadAllTaskEvent()),
//       expect: () => [
//         LoadingState(),
//         const LoadedAllTasksState(tasks: [todoE]),
//       ],
//       verify: (_) {
//         verify(mockViewAllTask(any)).called(1);
//       },
//     );

//     blocTest(
//       'emits [LoadingState, ErrorState] when view all tasks fails',
//       build: () {
//         when(mockViewAllTask(any)).thenAnswer(
//             (_) async => Left(ServerFailure(message: SERVER_FAILURE_MESSAGE)));
//         return TaskBloc(
//               createTaskUsecase: mockCreateTask,
//               viewAllTaskUsecase: mockViewAllTask,
//               updateTaskUsecase: mockUpdateTask,
//               deleteTaskUsecase: mockDeleteTask,
//               viewtaskusecase: mockViewTask
//         );
//       },
//       act: (bloc) => bloc.add(LoadAllTaskEvent()),
//       expect: () => [
//         LoadingState(),
//         const ErrorState(message: SERVER_FAILURE_MESSAGE),
//       ],
//     );
//   });

//   group("GetSingleTaskEvent", () {
//     const tTaskId = "1";
//     const todoE = TaskEntity(
//         id: "1",
//         title: "Bloc Test",
//         description: "Bloc test description",
//         status: false,
//         duedate: "AUG 20 2023"
//         );
//     blocTest(
//       'emits [LoadingState, LoadedSingleTaskState] when view task successfully',
//       build: () {
//         when(mockViewTask(any)).thenAnswer((_) async => const Right(todoE));
//         return TaskBloc(
//               createTaskUsecase: mockCreateTask,
//               viewAllTaskUsecase: mockViewAllTask,
//               updateTaskUsecase: mockUpdateTask,
//               deleteTaskUsecase: mockDeleteTask,
//               viewtaskusecase: mockViewTask
//         );
//       },
//       act: (bloc) => bloc.add(const GetSingleTaskEvent(taskId: tTaskId)),
//       expect: () => [
//         LoadingState(),
//         const LoadedSingleTaskState(task: todoE),
//       ],
//       verify: (_) {
//         verify(mockViewTask(any)).called(1);
//       },
//     );

//     blocTest(
//       'emits [LoadingState, ErrorState] when view task fails',
//       build: () {
//         when(mockViewTask(any)).thenAnswer(
//             (_) async => Left(ServerFailure(message: SERVER_FAILURE_MESSAGE)));
//         return TaskBloc(
//               createTaskUsecase: mockCreateTask,
//               viewAllTaskUsecase: mockViewAllTask,
//               updateTaskUsecase: mockUpdateTask,
//               deleteTaskUsecase: mockDeleteTask,
//               viewtaskusecase: mockViewTask
//         );
//       },
//       act: (bloc) => bloc.add(const GetSingleTaskEvent(taskId: tTaskId)),
//       expect: () => [
//         LoadingState(),
//         const ErrorState(message: SERVER_FAILURE_MESSAGE),
//       ],
//     );
//   });

//   group("updateTask", () {
//     const todoE = TaskEntity(
//         id: "1",
//         title: "Bloc Test",
//         description: "Bloc test description",
//         status: false,
//         duedate: "aug 9 2023"
//         );

//     blocTest(
//       'emits [LoadingState, LoadedSingleTaskState] when update task successfully',
//       build: () {
//         when(mockUpdateTask(any)).thenAnswer((_) async => const Right(todoE));
//         return TaskBloc(
//               createTaskUsecase: mockCreateTask,
//               viewAllTaskUsecase: mockViewAllTask,
//               updateTaskUsecase: mockUpdateTask,
//               deleteTaskUsecase: mockDeleteTask,
//               viewtaskusecase: mockViewTask
//         );
//       },
//       act: (bloc) => bloc.add(const updateTaskEvent(taskEntity: todoE)),
//       expect: () => [
//         LoadingState(),
//         const LoadedSingleTaskState(task: todoE),
//       ],
//       verify: (_) {
//         verify(mockUpdateTask(any)).called(1);
//       },
//     );

//     blocTest(
//       'emits [LoadingState, ErrorState] when update task fails',
//       build: () {
//         when(mockUpdateTask(any)).thenAnswer(
//             (_) async => Left(ServerFailure(message: SERVER_FAILURE_MESSAGE)));
//         return TaskBloc(
//               createTaskUsecase: mockCreateTask,
//               viewAllTaskUsecase: mockViewAllTask,
//               updateTaskUsecase: mockUpdateTask,
//               deleteTaskUsecase: mockDeleteTask,
//               viewtaskusecase: mockViewTask
//         );
//       },
//       act: (bloc) => bloc.add(const updateTaskEvent(taskEntity: todoE)),
//       expect: () => [
//         LoadingState(),
//         const ErrorState(message: SERVER_FAILURE_MESSAGE),
//       ],
//     );
//   });

//   group("deleteTask", () {
//     const tTaskId = "1";
//     blocTest(
//       'emits [LoadingState, EmptyState] when delete task successfully',
//       build: () {
//         when(mockDeleteTask(any)).thenAnswer((_) async => const Right(null));
//         return TaskBloc(
//               createTaskUsecase: mockCreateTask,
//               viewAllTaskUsecase: mockViewAllTask,
//               updateTaskUsecase: mockUpdateTask,
//               deleteTaskUsecase: mockDeleteTask,
//               viewtaskusecase: mockViewTask
//         );
//       },
//       act: (bloc) => bloc.add(const DeleteTaskEvent(taskId: tTaskId)),
//       expect: () => [
//         LoadingState(),
//         EmptyState(),
//       ],
//       verify: (_) {
//         verify(mockDeleteTask(any)).called(1);
//       },
//     );

//     blocTest(
//       'emits [LoadingState, ErrorState] when delete task fails',
//       build: () {
//         when(mockDeleteTask(any)).thenAnswer(
//             (_) async => Left(ServerFailure(message: SERVER_FAILURE_MESSAGE)));
//         return TaskBloc(
//               createTaskUsecase: mockCreateTask,
//               viewAllTaskUsecase: mockViewAllTask,
//               updateTaskUsecase: mockUpdateTask,
//               deleteTaskUsecase: mockDeleteTask,
//               viewtaskusecase: mockViewTask
//         );
//       },
//       act: (bloc) => bloc.add(const DeleteTaskEvent(taskId: tTaskId)),
//       expect: () => [
//         LoadingState(),
//         const ErrorState(message: SERVER_FAILURE_MESSAGE),
//       ],
//     );
//   });
// }
