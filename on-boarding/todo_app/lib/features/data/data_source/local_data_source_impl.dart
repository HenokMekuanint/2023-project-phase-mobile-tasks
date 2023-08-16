import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/errors/exception.dart';
import 'package:todo_app/features/data/data_source/local_data_source.dart';
import 'package:todo_app/features/data/models/todo_model.dart';
import 'package:todo_app/features/domain/entities/task_entity.dart';

class TaskLocalDataSourceIml implements TaskLocalDataSource {
  final SharedPreferences sharedPreferences;
  TaskLocalDataSourceIml({required this.sharedPreferences});
  @override
  Future<TaskModel> getTask(String key) {
    final jsonString = sharedPreferences.getString(key);
    if (jsonString != null) {
      return Future.value(TaskModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<TaskModel>> getTasks(String key) {
    final jsonString = sharedPreferences.getString(key);
    if (jsonString != null) {
      final List<dynamic> taskListJson = jsonDecode(jsonString);

      return Future.value(taskListJson
          .map((taskJson) => TaskModel.fromJson(taskJson))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheTask(String key, TaskModel todomodel) {
    return sharedPreferences.setString(
      key,
      json.encode(
        todomodel.toJson(),
      ),
    );
  }

  @override
  Future<void> cacheTasks(String key, List<TaskModel> taskmodel) {
    return sharedPreferences.setString(
        key, json.encode(taskmodel.map((task) => task.toJson())));
  }
@override
Future<void> removeTask(String key){
  return sharedPreferences.remove(key);
}

}




