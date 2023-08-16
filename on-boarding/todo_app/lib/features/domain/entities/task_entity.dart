import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String id;
  String title;
  String Description;
  String dueDate;
  bool status;

  Task(
      {required this.id,
      required this.title,
      required this.Description,
      required this.dueDate,
      required this.status});

  @override
  List<Object> get props => [id, title, Description, dueDate, status];

}


