import 'package:flutter/material.dart';
import 'package:todo_app/presentation/todo_list/todo_list.dart';
import 'package:todo_app/presentation/utils/app_dimension.dart';

class onBoarding extends StatefulWidget {
  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFEE6F57),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: AppDimension.height(100, context),
                ),
                Image.asset(
                  "assets/images/onboarding.png",
                  width: AppDimension.width(500, context),
                  height: AppDimension.height(500, context),
                ),
                SizedBox(
                  height: AppDimension.height(100, context),
                ),
                SizedBox(
                  width: AppDimension.width(200, context),
                  height: AppDimension.height(50, context),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => todoList()));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppDimension.height(20, context),
                            fontFamily: "InterBold"),
                      )),
                )
              ],
            ),
          )),
    );
  }
}
