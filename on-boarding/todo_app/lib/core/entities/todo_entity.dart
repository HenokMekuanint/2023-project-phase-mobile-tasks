import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String duedate;
  final String status;

  const TaskEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.duedate,
      required this.status, 
      });
  @override
  List<Object?> get props => [id, title, description, duedate,status];

}