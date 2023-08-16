import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/features/domain/entities/task_entity.dart';
import 'package:todo_app/features/presentation/pages/todo_list/todo_list.dart';
import 'package:todo_app/core/utils/app_dimension.dart';

class editTask extends StatefulWidget {
  final int index; // Add the index as a parameter

  editTask({required this.index});

  @override
  State<editTask> createState() => _editTaskState();
}

class _editTaskState extends State<editTask> {
  Task? task; // Task to edit

  String formatDate(DateTime? dateTime) {
    if (dateTime != null) {
      return DateFormat('MMM dd, yyyy hh:mm a').format(dateTime);
    }
    return '';
  }

  DateTime parseDate(String dateString) {
    return DateFormat('MMM dd, yyyy hh:mm a').parse(dateString);
  }

  @override
  void initState() {
    super.initState();
    // Initialize the text fields with task data
    taskName = task!.title;
    dueDate = parseDate(task!.dueDate);
    description = task!.Description;
  }

  final _formKey = GlobalKey<FormState>();
  String taskName = '';
  DateTime? dueDate;
  String description = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimension.width(5, context)),
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
                    IconButton(
                      iconSize: AppDimension.height(30, context),
                      icon: Icon(
                        Icons.more_vert,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: AppDimension.height(20, context),
                  horizontal: AppDimension.width(50, context),
                ),
                child: Text(
                  "Edit task",
                  style: TextStyle(
                      fontSize: AppDimension.height(30, context),
                      color: Colors.black,
                      fontFamily: "InterBold"),
                ),
              ),
              Divider(
                height: AppDimension.height(10, context),
              ),
              SizedBox(
                height: AppDimension.height(10, context),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: AppDimension.height(20, context),
                        horizontal: AppDimension.width(20, context)),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Main Task Name",
                            style: TextStyle(
                                color: const Color(0xFFEE6F57),
                                fontFamily: "InterSemiBold",
                                fontSize: AppDimension.height(20, context)),
                          ),
                          SizedBox(
                            height: AppDimension.height(5, context),
                          ),
                          Container(
                            height: AppDimension.height(50, context),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimension.height(10, context)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(1, 1),
                                  )
                                ]),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: AppDimension.height(20, context)),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),

                                initialValue:
                                    taskName, // Display the previous value
                                onChanged: (value) {
                                  setState(() {
                                    taskName = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: AppDimension.height(40, context)),
                          Text(
                            "Due Date",
                            style: TextStyle(
                                color: const Color(0xFFEE6F57),
                                fontFamily: "InterSemiBold",
                                fontSize: AppDimension.height(20, context)),
                          ),
                          SizedBox(
                            height: AppDimension.height(5, context),
                          ),
                          GestureDetector(
                            onTap: () async {
                              // Show date picker
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate:
                                    DateTime.now().add(Duration(days: 365)),
                              );
                              if (pickedDate != null) {
                                // Show time picker
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );

                                if (pickedTime != null) {
                                  setState(() {
                                    // Combine date and time
                                    dueDate = DateTime(
                                      pickedDate.year,
                                      pickedDate.month,
                                      pickedDate.day,
                                      pickedTime.hour,
                                      pickedTime.minute,
                                    );
                                  });
                                }
                              }
                            },
                            child: Container(
                              height: AppDimension.height(50, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimension.height(10, context)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(1, 1),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      dueDate == null
                                          ? task!.dueDate
                                          : formatDate(dueDate),
                                      style: TextStyle(
                                        color: dueDate == null
                                            ? Colors.red
                                            : Colors.black,
                                        fontSize:
                                            AppDimension.height(20, context),
                                      ),
                                    ),
                                    Icon(
                                      Icons.calendar_today,
                                      size: AppDimension.height(25, context),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: AppDimension.height(40, context)),
                          Text(
                            "Description",
                            style: TextStyle(
                                color: const Color(0xFFEE6F57),
                                fontFamily: "InterSemiBold",
                                fontSize: AppDimension.height(20, context)),
                          ),
                          SizedBox(
                            height: AppDimension.height(5, context),
                          ),
                          Container(
                            height: AppDimension.height(150, context),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimension.height(10, context)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(1, 1),
                                  )
                                ]),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a Description';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                    fontSize: AppDimension.height(20, context)),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                initialValue:
                                    description, // Display the previous value
                                maxLines: 3,
                                onChanged: (value) {
                                  setState(() {
                                    description = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: AppDimension.height(40, context)),
                          Center(
                            child: SizedBox(
                              width: AppDimension.width(200, context),
                              height: AppDimension.height(50, context),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFEE6F57),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppDimension.height(30, context)),
                                  ),
                                ),
                                onPressed: () {
                                  // Save the updated task details
                                  // taskController.taskManager.editTask(
                                  //   widget.index,
                                  //   title: taskName,
                                  //   description: description,
                                  //   dueDate: formatDate(dueDate),
                                  //   status: false,
                                  // );
                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>todoList()));
                                },
                                child: Text(
                                  'Edit Task',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimension.height(20, context)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
