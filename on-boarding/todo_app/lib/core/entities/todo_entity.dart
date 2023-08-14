import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String duedate;
  final bool status;

  const TaskEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.duedate,
      required this.status, 
      });
  @override
  List<Object?> get props => [id, title, description, duedate,status];

  // @override
  // String toString() {
  //   return 'Task(title: $title, description: $Description, dueDate: $dueDate, status: $status)';
  // }
}

// enum Status { completed, pending }
