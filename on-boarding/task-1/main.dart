import 'task_manager_model.dart';
import 'task_model.dart';

void main(List<String> args) {
  TaskManager taskManager = TaskManager();

  taskManager.addTask(Task(
      title: "hena",
      Description: "hena",
      dueDate: "hena",
      status: Status.completed));

  taskManager.addTask(Task(
      title: "henok",
      Description: "henok",
      dueDate: "henok",
      status: Status.pending));

  print(taskManager.viewAllTask());
  print(taskManager.viewCompletedTasks());
  print(taskManager.viewPendingTask());
  taskManager.editTask(
    0,
    title: "Updated Task 1",
    description: "Updated Description",
    dueDate: "2023-08-20",
    status: Status.completed,
  );

  print(taskManager.viewAllTask());
  taskManager.deleteTask(0);
  print(taskManager.viewAllTask());
}
