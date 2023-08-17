import 'dart:convert';
import 'package:todo_app/core/errors/exception.dart';
import 'package:todo_app/features/data/models/todo_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:todo_app/features/data/data_source/remote_data_source_impl.dart';
import 'package:mockito/mockito.dart';

import '../../helper/fixture/json_reader.dart';
import '../../helper/mock_implementation/mock_http_client/mock_http_client.mocks.dart';

void main() {
  late TaskremoteDataSourceImpl todoRemoteDataSourceImpl;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    todoRemoteDataSourceImpl = TaskremoteDataSourceImpl(client: mockHttpClient);
  });

  group('viewTask', () {
    const tTodoId = '1';
    final tTodoModel = TaskModel.fromJson(json
        .decode(readJson("features/todo/helper/fixture/task_cached.json")));
    test('''
should perform a GET request on a URL with 
todoId being the endpoint and with application/json header
''', () {
      // arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(
              readJson("features/todo/helper/fixture/task_cached.json"),
              200));
      // act
      todoRemoteDataSourceImpl.vieWTask(tTodoId);
      // assert
      verify(mockHttpClient.get(
        Uri.parse('https://test/todos/$tTodoId'),
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test(
      'should return TodoModel when the response code is 200 (success)',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) async => http.Response(
                readJson("features/todo/helper/fixture/task_cached.json"),
                200));
        // act
        final result = await todoRemoteDataSourceImpl.vieWTask(tTodoId);
        // assert
        expect(result, equals(tTodoModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) async => http.Response('Something went wrong', 404));
        // act
        final call = todoRemoteDataSourceImpl.vieWTask;
        // assert
        expect(() => call(tTodoId), throwsA(isA<ServerException>()));
      },
    );
  });

  group('viewAllTasks', () {
    final tTodoModelList = (json.decode(
            readJson("features/todo/helper/fixture/tasks_cached.json")))
        .map((e) => TaskModel.fromJson(e))
        .toList();

    test(''' should perform a GET request on a URL with 
todos being the endpoint and with application/json header''', () {
      // arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(
              readJson("features/todo/helper/fixture/tasks_cached.json"),
              200));
      // act
      todoRemoteDataSourceImpl.viewAllTask();
      // assert
      verify(mockHttpClient.get(
        Uri.parse('https://test/todos'),
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test(
      'should return TodoModel list when the response code is 200 (success)',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) async => http.Response(
                readJson("features/todo/helper/fixture/tasks_cached.json"),
                200));
        // act
        final result = await todoRemoteDataSourceImpl.viewAllTask();
        // assert
        expect(result, equals(tTodoModelList));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) async => http.Response('Something went wrong', 404));
        // act
        final call = todoRemoteDataSourceImpl.viewAllTask;
        // assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );
  });

  group("createTask", () {
    const tTodoModel = TaskModel(
        id: "1",
        title: "Task 5",
        description: "complete the task",
        status: "false",
        duedate: "Aug 09 2023"
        
        );
    final tTodoModelJson = json.decode(
        readJson("features/todo/helper/fixture/todo_dummy_respose.json"));

    test(''' should perform a POST request on a URL  to create todo''', () {
      // arrange
      when(mockHttpClient.post(any,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response(
              readJson(
                  "features/todo/helper/fixture/todo_dummy_respose.json"),
              201));
      // act
      todoRemoteDataSourceImpl.createTask(tTodoModel);
      // assert
      verify(mockHttpClient.post(
        Uri.parse('https://test/tasks'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(tTodoModel.toJson()),
      ));
    });

    test(
      'should return TodoModel when the response code is 201 (success)',
      () async {
        // arrange
        when(mockHttpClient.post(any,
                headers: anyNamed('headers'), body: anyNamed('body')))
            .thenAnswer((_) async => http.Response(
                readJson(
                    "features/todo/helper/fixture/todo_dummy_respose.json"),
                201));
        // act
        final result = await todoRemoteDataSourceImpl.createTask(tTodoModel);
        // assert
        expect(result, equals(tTodoModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(mockHttpClient.post(any,
                headers: anyNamed('headers'), body: anyNamed('body')))
            .thenAnswer(
                (_) async => http.Response('Something went wrong', 404));
        // act
        final call = todoRemoteDataSourceImpl.createTask;
        // assert
        expect(() => call(tTodoModel), throwsA(isA<ServerException>()));
      },
    );
  });
  group("updateTask", () {
    const tTodoId = '1';
    const tTodoModel = TaskModel(
        id: "1",
        title: "Task 5",
        description: "complete the task",
        status: "false",
        duedate: "Aug 9 2023");
    final tTodoModelJson = json.decode(
        readJson("features/todo/helper/fixture/todo_dummy_respose.json"));

    test(''' should perform a PUT request on a URL with todo to be updated''', (){
      // arrange
      when(mockHttpClient.put(any,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response(
              readJson(
                  "features/todo/helper/fixture/todo_dummy_respose.json"),
              200));
      // act
      todoRemoteDataSourceImpl.updateTask(tTodoId, tTodoModel);
      // assert
      verify(mockHttpClient.put(
        Uri.parse('http://test/todos/$tTodoId'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(tTodoModelJson),
      ));
    });

    test(
      'should return TodoModel when the response code is 200 (success)',
      () async {
        // arrange
        when(mockHttpClient.put(any,
                headers: anyNamed('headers'), body: anyNamed('body')))
            .thenAnswer((_) async => http.Response(
                readJson(
                    "features/todo/helper/fixture/todo_dummy_respose.json"),
                200));
        // act
        final result = await todoRemoteDataSourceImpl.updateTask(tTodoId, tTodoModel);
        // assert
        expect(result, equals(tTodoModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(mockHttpClient.put(any,
                headers: anyNamed('headers'), body: anyNamed('body')))
            .thenAnswer(
                (_) async => http.Response('Something went wrong', 404));
        // act
        final call = todoRemoteDataSourceImpl.updateTask;
        // assert
        expect(() => call(tTodoId, tTodoModel), throwsA(isA<ServerException>()));
      },
    );
  });

  group("deleteTask", () {

    


  });
}