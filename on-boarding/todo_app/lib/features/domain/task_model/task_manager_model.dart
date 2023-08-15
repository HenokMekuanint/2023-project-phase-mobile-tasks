import '../entities/task_entity.dart';

class TaskManager {
  late List<Task> _tasks=[];

  void addTask(Task task) {
    _tasks.add(task);
  }

  List<Task> viewAllTask() {
    return _tasks;
  }

  List<Task> viewCompletedTasks() {
    return _tasks.where((task) => task.status == true).toList();
  }

  List<Task> viewPendingTask() {
    return _tasks.where((task) => task.status == false).toList();
  }

  void editTask(int index,
      {String? title, String? description, String? dueDate, bool? status}) {
    if (index >= 0 && index < _tasks.length) {
      Task task = _tasks[index];
      if (title != null) task.title = title;
      if (description != null) task.Description = description;
      if (dueDate != null) task.dueDate = dueDate;
      if (status != null) task.status = status;
    }
  }

  void deleteTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
    }
  }
}
