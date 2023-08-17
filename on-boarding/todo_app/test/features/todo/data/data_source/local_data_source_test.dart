import 'dart:convert';


import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:todo_app/core/errors/exception.dart';

import 'package:todo_app/features/data/data_source/local_data_source_impl.dart';
import 'package:todo_app/features/data/models/todo_model.dart';
import 'package:todo_app/features/domain/entities/task_entity.dart';

import '../../helper/fixture/json_reader.dart';
import '../../helper/mock_implementation/mock_shared_preference/mock_shared_preference.mock.dart';

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late TaskLocalDataSourceIml todoLocalDataSourceImpl;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    todoLocalDataSourceImpl =
        TaskLocalDataSourceIml(sharedPreferences: mockSharedPreferences);
  });

  group('getTask', () {
    final tTodoModel = TaskModel.fromJson(json
        .decode(readJson("features/todo/helper/fixture/task_cached.json")));
    test(
        'should return TodoModel from SharedPreferences when there is one in the cache',
        () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(
          readJson("features/todo/helper/fixture/task_cached.json"));
      // act
      final result = await todoLocalDataSourceImpl.getTask("CACHED_TODO_KEY");
      // assert
      verify(mockSharedPreferences.getString("CACHED_TODO_KEY"));
      // expect(result, equals(tTodoModel));
    });

    test('should throw a CacheException when there is no a cached value',
        () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      // act
      final call = todoLocalDataSourceImpl.getTask;
      // assert
      expect(() => call("CACHED_TODO_KEY"), throwsA(isA<CacheException>()));
    });
  });

  // test getTasks which returns a list of TodoModel from SharedPreferences
  // when there is one in the cache
  group('getTasks', () {
    final todoJsons = json.decode(
        readJson("features/todo/helper/fixture/tasks_cached.json"));

    // use map function to iterate over the todoJsons list and convert them to TodoModel using the fromJson function of the TodoModel class
    final tTodoModels =
        todoJsons.map((todoJson) => TaskModel.fromJson(todoJson)).toList();

    // test not passing
    test(
        'should return a list of TodoModel from SharedPreferences when there is one in the cache',
        () async {
      // arrange
      when(mockSharedPreferences.getStringList(any)).thenReturn([
        readJson("features/todo/helper/fixture/tasks_cached.json"),
      ]);
      // act
      final result = await todoLocalDataSourceImpl.getTasks("CACHED_TODOs_KEY");
      // assert
      verify(mockSharedPreferences.getStringList("CACHED_TODOs_KEY"));
      expect(result, equals([tTodoModels]));
    });

    test('should throw a CacheException when there is no a cached value',
        () async {
      // arrange
      when(mockSharedPreferences.getStringList(any)).thenReturn(null);
      // act
      final call = todoLocalDataSourceImpl.getTasks;
      // assert
      expect(() => call("CACHED_TODO_KEY"), throwsA(isA<CacheException>()));
    });
  });

  group('cacheTask', () {
    const tTodoModel = TaskModel(
      id: "1",
      title: "Test Title 1",
      description: "Test Description 1",
      status: "false", 
      duedate: "Aug 09 2023",
    );

    // test not passing: MissingStubError
    test('should call SharedPreferences to cache the data', () async {
      // act
      todoLocalDataSourceImpl.cacheTask("CACHED_TODO_KEY", tTodoModel);
      // assert
      final expectedJsonString = json.encode(tTodoModel.toJson());
      verify(mockSharedPreferences.setString(
          "CACHED_TODO_KEY", expectedJsonString));
    });
  });

  group('cacheTasks', () {
    final todoJsons = json.decode(readJson(
        "features/todo/helper/fixture/tasks_cached.json"));

    // use map function to iterate over the todoJsons list and convert them to TodoModel using the fromJson function of the TodoModel class
    final tTodoModels =
        todoJsons.map((todoJson) => TaskModel.fromJson(todoJson)).toList();

    // test not passing: MissingStubError
    test('should call SharedPreferences to cache the data', () async {
      // act
      todoLocalDataSourceImpl.cacheTasks("CACHED_TODOs_KEY", tTodoModels);
      // assert
      final expectedJsonStrings = tTodoModels
          .map((todoModel) => json.encode(todoModel.toJson()))
          .toList();
      verify(mockSharedPreferences.setStringList(
        "CACHED_TODOs_KEY",
        expectedJsonStrings
      ));
    });
  });

  group('removeTask', () {
    // test not passing
    test('should call SharedPreferences to remove the data', () async {
      // act
      todoLocalDataSourceImpl.removeTask("CACHED_TODO_KEY");
      // assert
      verify(mockSharedPreferences.remove("CACHED_TODO_KEY"));
    });
  });
}