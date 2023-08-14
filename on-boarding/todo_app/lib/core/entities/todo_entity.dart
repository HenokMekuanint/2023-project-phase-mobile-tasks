import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final String Description;
  final String dueDate;
  final bool status;

  const TaskEntity(
      {required this.id,
      required this.title,
      required this.Description,
      required this.dueDate,
      required this.status});
  @override
  List<Object?> get props => [id, title, Description, dueDate,status];

  // @override
  // String toString() {
  //   return 'Task(title: $title, description: $Description, dueDate: $dueDate, status: $status)';
  // }
}

// enum Status { completed, pending }
