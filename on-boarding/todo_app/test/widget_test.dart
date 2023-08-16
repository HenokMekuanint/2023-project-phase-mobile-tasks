import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/data/models/todo_model.dart';
import 'package:todo_app/features/domain/entities/task_entity.dart';
import 'package:todo_app/features/presentation/pages/add_task/add_task.dart';
import 'package:todo_app/features/presentation/pages/edit_task/edit_task.dart';
import 'package:todo_app/features/presentation/pages/onboarding/onboarding.dart';
import 'package:todo_app/features/presentation/pages/task_detail/task_detail.dart';
import 'package:todo_app/features/presentation/widgets/todo_class/list_class.dart';
import 'package:todo_app/features/presentation/pages/todo_list/todo_list.dart';

void main() {
  TaskModel taskModel = TaskModel(
      id: "1",
      duedate: "Apr /01/20",
      title: "Task 8",
      description: "complete the task",
      status: false);
  testWidgets('Counter increments smoke test', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: onBoarding(),
    ));

    expect(find.text('Get Started'), findsOneWidget);
    expect(find.byType(SizedBox), findsNWidgets(3));
    expect(find.byType(Column), findsNWidgets(1));
  });

  testWidgets('Counter increments smoke test', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: todoList(),
    ));
    // Check if the widget tree renders as expected
    expect(find.text('ToDo List'), findsOneWidget);
    expect(find.text('Tasks list'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Tap on the "Create task" button and check if it navigates to the addTask screen
    await tester.tap(find.text('Create task'));
    await tester.pumpAndSettle(); // Wait for navigation animation to complete

    expect(find.byType(addTask), findsOneWidget);

    // Navigate back and check if it returns to the todoList screen
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();

    expect(find.text('ToDo List'), findsOneWidget);
    expect(find.byType(Center), findsNWidgets(4));
    expect(find.byType(Column), findsOneWidget);
    // expect(find.byType(Column), findsNWidgets(2));
  });

  testWidgets('ListItem displays correct content', (tester) async {
    final dueDate = 'Aug 07, 2023 12:16 AM';
    final title = 'Test Task Title';
    final description = 'Test Task Description';
    final status = Colors.green; // Change this to the desired status color

    await tester.pumpWidget(
      MaterialApp(
        home: ListItem(
          dueDate: dueDate,
          title: title,
          description: description,
          status: status,
        ),
      ),
    );

    expect(find.text(title), findsOneWidget);
    expect(find.text(description), findsOneWidget);
    expect(find.text(dueDate), findsOneWidget);
  });

  testWidgets('addTask Widget Test', (tester) async {
    await tester.pumpWidget(MaterialApp(home: addTask()));

    // Find widgets using Key or text
    final mainTaskNameField = find.byKey(Key('mainTaskNameField'));
    final dueDateField = find.byKey(Key('dueDateField'));
    final descriptionField = find.byKey(Key('descriptionField'));
    final addTaskButton = find.text('Add Task');

    // Enter text into the fields
    await tester.enterText(mainTaskNameField, 'Sample Task Name');
    await tester.tap(dueDateField);
    await tester.enterText(descriptionField, 'Sample Task Description');

    // // Tap the "Add Task" button
    await tester.tap(addTaskButton);
    await tester.pumpAndSettle(); // Wait for animations and navigation

    // // Expect that the app navigates to the todoList screen
  });
}
