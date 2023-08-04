import 'package:flutter/material.dart';
import 'package:todo_app/onboarding/onboarding.dart';
import 'package:todo_app/todo_list/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: onBoarding(),
    );
  }
}
