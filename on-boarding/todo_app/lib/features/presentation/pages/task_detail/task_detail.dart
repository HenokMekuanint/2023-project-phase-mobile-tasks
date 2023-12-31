import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/features/presentation/pages/add_task/add_task.dart';
import 'package:todo_app/features/domain/entities/task_entity.dart';
import 'package:todo_app/features/presentation/pages/todo_list/todo_list.dart';
import 'package:todo_app/core/utils/app_dimension.dart';

class taskDetail extends StatelessWidget {
  final int index;

  taskDetail({required this.index});

  @override
  Widget build(BuildContext context) {
    // Task currentTask = tasks[index];

    void _editTask() {
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>editTask()));

    }

    void _markAsComplete() {
      // tasks[index].status = true;
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => todoList()));
    }

    void _deleteTask() {
      // tasks.removeAt(index);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => todoList()));
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
                      // currentTask.title,
                      "dumy text",
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
                      // currentTask.Description,
                      "dummy_desctiption",
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
                    // currentTask.dueDate,
                    "dummy due date",
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
