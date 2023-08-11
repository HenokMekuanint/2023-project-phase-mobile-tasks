import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/core/entities/todo_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel(
      {required id, required duedate,required title, required Description, required status})
      : super(
        id: id,
        title: title,
        Description: Description,
        status: status,
        dueDate: duedate

        );

  factory TaskModel.froJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        title: json['title'],
        Description: json['description'],
        duedate: json['duedate'],
        status: json['status']
        );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "decription": Description,
      "status": status,
      "duetate":dueDate
    };
  }
}
