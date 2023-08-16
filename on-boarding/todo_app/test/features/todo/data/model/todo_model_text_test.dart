import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/core/entities/todo_entity.dart';
import 'package:todo_app/features/data/models/todo_model.dart';

import 'dart:io';

import '../../helper/fixture/json_reader.dart';

void main() {
  TaskModel taskmodel = const TaskModel(
      id: "1",
      duedate: "Aug 9 2023",
      title: "Task 5",
      description: "complete the task",
      status: false);
  test("should be a subclass of todo entitiy,", () async {
    expect(taskmodel, isA<TaskEntity>());
  });

  test("should return valid TodoModel from json", () async {
    final Map<String, dynamic> jsonMap = await jsonDecode(
        readJson("features/todo/helper/fixture/todo_dummy_respose.json"));

    final result = TaskModel.fromJson(jsonMap);

    expect(result, equals(taskmodel));
  });

  test("should retur valid json from TaskModel", () async {
    final result = taskmodel.toJson();
    final expectedJsonMap = {
      'id': '1',
      'title': 'Task 5',
      'description': 'complete the task',
      'duedate': 'Aug 9 2023',
      'status': false,
    };
    expect(result, equals(expectedJsonMap));
  });
}
