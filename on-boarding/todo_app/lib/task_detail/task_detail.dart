import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/add_task/add_task.dart';
import 'package:todo_app/controller/task_controller.dart';
import 'package:todo_app/edit_task/edit_task.dart';
import 'package:todo_app/task_model/task_manager_model.dart';
import 'package:todo_app/task_model/task_model.dart';
import 'package:todo_app/todo_list/todo_list.dart';
import 'package:todo_app/utils/app_dimension.dart';

class taskDetail extends StatelessWidget {
  final int index;
  TaskController taskController = TaskController();

  taskDetail({required this.index});

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = taskController.taskManager.viewAllTask();
    Task currentTask = tasks[index];

    void _editTask() {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>editTask(index: index,)));

    }

    void _markAsComplete() {
      tasks[index].status = Status.completed;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => todoList()));
    }

    void _deleteTask() {
      tasks.removeAt(index);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => todoList()));
    }

    String formatDate(DateTime? dateTime) {
      if (dateTime != null) {
        return DateFormat('MMM dd, yyyy hh:mm a').format(dateTime);
      }
      return '';
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                  color: Color(0xFFEE6F57),
                  iconSize: AppDimension.height(30, context),
                ),
                PopupMenuButton(
                  onSelected: (value) {
                    // Handle the selected option here
                    switch (value) {
                      case 'edit':
                        _editTask();
                        break;
                      case 'markComplete':
                        _markAsComplete();
                        break;
                      case 'delete':
                        _deleteTask();
                        break;
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit Task'),
                    ),
                    PopupMenuItem(
                      value: 'markComplete',
                      child: Text('Mark as Complete'),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete Task'),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Image.asset(
                "assets/images/view.png",
                width: AppDimension.width(200, context),
                height: AppDimension.height(300, context),
              ),
            ),
            SizedBox(
              height: AppDimension.height(5, context),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: TextStyle(
                    fontFamily: "InterRegular",
                    fontSize: AppDimension.height(20, context),
                  ),
                ),
                SizedBox(
                  height: AppDimension.height(5, context),
                ),
                Container(
                  width: AppDimension.width(240, context),
                  color: Color(0xFFF1EEEE),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimension.width(10, context),
                        vertical: AppDimension.height(15, context)),
                    child: Text(
                      currentTask.title,
                      style: TextStyle(
                          fontFamily: "InterRegular",
                          fontSize: AppDimension.height(18, context)),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimension.height(10, context),
                ),
                Text(
                  "Description",
                  style: TextStyle(
                      fontFamily: "InterRegular",
                      fontSize: AppDimension.height(20, context)),
                ),
                SizedBox(
                  height: AppDimension.height(10, context),
                ),
                Container(
                  // height: AppDimension.height(160, context),
                  width: AppDimension.width(240, context),
                  color: Color(0xFFF1EEEE),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: AppDimension.width(15, context),
                        right: AppDimension.width(10, context),
                        top: AppDimension.height(15, context),
                        bottom: AppDimension.height(30, context)),
                    child: Text(
                      currentTask.Description,
                      style: TextStyle(
                          fontFamily: "InterRegular",
                          wordSpacing: 1,
                          fontSize: AppDimension.height(18, context)),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimension.height(10, context),
                ),
                Text(
                  "Deadline",
                  style: TextStyle(
                      fontFamily: "InterRegular",
                      fontSize: AppDimension.height(20, context)),
                ),
                SizedBox(
                  height: AppDimension.height(10, context),
                ),
                Container(
                  width: AppDimension.width(240, context),
                  color: Color(0xFFF1EEEE),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimension.width(10, context),
                      vertical: AppDimension.height(15, context)),
                  child: Text(
                    currentTask.dueDate,
                    style: TextStyle(
                        fontFamily: "InterRegular",
                        fontSize: AppDimension.height(18, context)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
