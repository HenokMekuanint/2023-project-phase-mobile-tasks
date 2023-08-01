class Task {
  String title;
  String Description;
  String dueDate;
  Status status;

  Task(
      {required this.title,
      required this.Description,
      required this.dueDate,
      required this.status});

    @override
  String toString() {
    return 'Task(title: $title, description: $Description, dueDate: $dueDate, status: $status)';
  }
}

enum Status { 
completed,
 pending 
 
 }

