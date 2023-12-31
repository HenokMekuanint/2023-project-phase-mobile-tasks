import 'package:flutter/material.dart';
import 'package:todo_app/features/presentation/pages/add_task/add_task.dart';
// import 'package:todo_app/features/presentation/pages/controller/task_controller.dart';
import 'package:todo_app/features/presentation/pages/task_detail/task_detail.dart';
import 'package:todo_app/features/domain/entities/task_entity.dart';
import 'package:todo_app/features/presentation/pages/widgets/todo_class/list_class.dart';
import 'package:todo_app/core/utils/app_dimension.dart';

class todoList extends StatefulWidget {
  
  @override
  State<todoList> createState() => _todoListState();
}

class _todoListState extends State<todoList> {
  // TaskController taskController = TaskController();

  @override
  Widget build(BuildContext context) {
    // List<Task> tasks = taskController.taskManager.viewAllTask();

    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimension.width(10, context),
            ),
            child: Row(
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
                Text(
                  "ToDo List",
                  style: TextStyle(
                      fontSize: AppDimension.height(20, context),
                      fontFamily: "InterRegular"),
                ),
                IconButton(
                  iconSize: AppDimension.height(30, context),
                  icon: Icon(
                    Icons.more_vert,
                  ),
                  onPressed: () {
                    
                  },
                ),
              ],
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/task_list.png",
              width: AppDimension.width(200, context),
              height: AppDimension.height(300, context),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: AppDimension.width(30, context),
                bottom: AppDimension.height(15, context)),
            child: Text(
              "Tasks list",
              style: TextStyle(fontSize: AppDimension.height(20, context)),
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => taskDetail(index: index)));
                    },
                    child: ListItem(

                      title: "dummy title",
                      description: "dummy description",
                      dueDate: "dummy due date",
                      status: true == false
                          ? Colors.red
                          : Colors.green,
                      
                      // title: tasks[index].title[tasks.length - 1],
                      // description: tasks[index].Description,
                      // dueDate: tasks[index].dueDate,
                      // status: tasks[index].status == false
                      //     ? Colors.red
                      //     : Colors.green,
                    ),
                  );
                }),
          ),
          Center(
            child: Container(
              width: AppDimension.width(200, context),
              height: AppDimension.height(50, context),
              margin: EdgeInsets.symmetric(
                  vertical: AppDimension.height(20, context)),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => addTask()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEE6F57),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    "Create task",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AppDimension.height(20, context),
                        fontFamily: "InterBold"),
                  )),
            ),
          ),
        ],
      )),
    );
  }
}
