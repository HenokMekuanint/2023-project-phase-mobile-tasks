import 'dart:convert';

import 'package:todo_app/core/errors/exception.dart';
import 'package:todo_app/features/data/data_source/remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/features/data/models/todo_model.dart';

class TaskremoteDataSourceImpl implements TaskRemoteDataSource {
  @override
  final http.Client client;
  TaskremoteDataSourceImpl({required this.client});

  @override
  Future<TaskModel> createTask(TaskModel taskModel) async {
    final http.Response response = await client.post(
      Uri.parse('http://test/todos'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(taskModel.toJson()),
    );
    if (response.statusCode == 200) {
      return TaskModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  Future<TaskModel> vieWTask(String taskId) async {
    final http.Response response = await client.post(
      Uri.parse('http:test/task/$taskId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return TaskModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TaskModel>> viewAllTask() async {
    final http.Response response = await client.get(
      Uri.parse('https://test/tasks'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final List<TaskModel> taskList = [];
      final List<dynamic> taskListJson = json.decode(response.body);
      for (var object in taskListJson) {
        taskList.add(TaskModel.fromJson(object));
      }
      return taskList;
    } else {
      throw ServerException();
    }
  }

  Future<TaskModel> updateTask(String taskid, TaskModel taskModel) async {
    final http.Response response = await client.put(
        Uri.parse('https://test/tasks/$taskid'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(taskModel.toJson()));

    if (response.statusCode == 200) {
      return TaskModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  Future<void> deleteTask(String taskId) async {
    final http.Response response = await client.delete(
      Uri.parse(
        'http://test/tasks/$taskId',
      ),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return Future.value();
    } else {
      throw ServerException();
    }
  }
}









// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import '../../../../core/errors/exception.dart';
// import 'todo_remote_data_source.dart';
// import '../models/todo_model.dart';

// class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
//   final http.Client client;
//   TodoRemoteDataSourceImpl({
//     required this.client,
//   });

//   /// Creates a new todo task on the remote server using the provided [todoModel].
//   /// Returns the created [TodoModel] if the request is successful (status code 201),
//   /// otherwise throws a [ServerException].
//   @override
//   Future<TodoModel> createTask(TodoModel todoModel) async {
//     final http.Response response = await client.post(
//       Uri.parse('https://test/todos'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(todoModel.toJson()),
//     );
//     if (response.statusCode == 201) {
//       return TodoModel.fromJson(json.decode(response.body));
//     } else {
//       throw ServerException();
//     }
//   }

//   /// Retrieves the details of a specific todo task with the given 
//   /// [todoId] from the remote server.
//   /// Returns the corresponding [TodoModel] if the request is successful (status code 200),
//   /// otherwise throws a [ServerException].
//   @override
//   Future<TodoModel> viewTask(String todoId) async {
//     http.Response response = await client.get(
//         Uri.parse('https://test/todos/$todoId'),
//         headers: {'Content-Type': 'application/json'});
//     if (response.statusCode == 200) {
//       return TodoModel.fromJson(json.decode(response.body));
//     } else {
//       throw ServerException();
//     }
//   }

//   /// Retrieves all todo tasks from the remote server.
//   /// Returns a list of [TodoModel] if the request is successful (status code 200),
//   /// otherwise throws a [ServerException].
//   @override
//   Future<List<TodoModel>> viewAllTasks() async {
//     final http.Response response = await client.get(
//       Uri.parse('https://test/todos'),
//       headers: {'Content-Type': 'application/json'},
//     );

//     if (response.statusCode == 200) {
//       final List<TodoModel> todoList = [];
//       final List<dynamic> todoListJson = json.decode(response.body);

//       for (var element in todoListJson) {
//         todoList.add(TodoModel.fromJson(element));
//       }
//       return todoList;
//     } else {
//       throw ServerException();
//     }
//   }

//   /// Updates an existing todo task with the provided [todoId] on the remote server
//   /// using the updated details in [todoModel].
//   /// Returns the updated [TodoModel] if the request is successful (status code 200),
//   /// otherwise throws a [ServerException].
//   @override
//   Future<TodoModel> updateTask(String todoId, TodoModel todoModel) async {
//     final http.Response response = await client.put(
//       Uri.parse('https://test/todos/${todoModel.id}'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(todoModel.toJson()),
//     );

//     if (response.statusCode == 200) {
//       return TodoModel.fromJson(json.decode(response.body));
//     } else {
//       throw ServerException();
//     }
//   }

//   /// Deletes a todo task with the given [todoId] from the remote server.
//   /// Returns a [Future] that completes successfully if the request is successful (status code 200),
//   /// otherwise throws a [ServerException].
//   @override
//   Future<void> deleteTask(String todoId) async {
//     final http.Response response = await client.delete(
//       Uri.parse('https://test/todos/$todoId'),
//       headers: {'Content-Type': 'application/json'},
//     );

//     if (response.statusCode == 200) {
//       return Future.value();
//     } else {
//       throw ServerException();
//     }
//   }
// }