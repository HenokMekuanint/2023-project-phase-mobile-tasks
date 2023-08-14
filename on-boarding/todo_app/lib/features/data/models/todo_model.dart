import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/core/entities/todo_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel(
      {required id,
      required duedate,
      required title,
      required description,
      required status})
      : super(
            id: id,
            title: title,
            description: description,
            status: status,
            duedate: duedate);

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        duedate: json['duedate'],
        status: json['status']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "duedate": duedate,
      "status": status,
      
    };
  }
}
