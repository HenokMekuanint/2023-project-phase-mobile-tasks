import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/domain/task_model/task_manager_model.dart';
import 'package:todo_app/domain/task_model/task_model.dart';
import 'package:todo_app/presentation/add_task/add_task.dart';
import 'package:todo_app/presentation/controller/task_controller.dart';
import 'package:todo_app/presentation/edit_task/edit_task.dart';
import 'package:todo_app/presentation/onboarding/onboarding.dart';
import 'package:todo_app/presentation/task_detail/task_detail.dart';
import 'package:todo_app/presentation/todo_list/list_class.dart';
import 'package:todo_app/presentation/todo_list/todo_list.dart';

void main() {
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


testWidgets('ListItem displays correct content', (WidgetTester tester) async {
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

}



