import 'package:circular_counter/app_dimension.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _progressValue = 0.0;
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter = (counter + 1) % 11;
      _progressValue = counter / 10;
    });
  }

  void decrementCounter() {
    setState(() {
      counter = (counter - 1) % 11;
      _progressValue = counter / 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Circular Counter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: _progressValue, end: _progressValue),
            duration: Duration(milliseconds: 500),
            builder: (context, value, child) {
              return CircularPercentIndicator(
                radius: AppDimension.width(100, context),
                lineWidth: 25.0,
                percent: value,
                backgroundColor: Colors.blue.shade100,
                progressColor: Colors.blue,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  "${(value * 100).toInt()}%",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: AppDimension.height(50, context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimension.width(30, context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: AppDimension.height(40, context),
                    width: AppDimension.width(120, context),
                  child: ElevatedButton(
                    onPressed: decrementCounter,
                    child: Text(
                      "Decrement",
                      style: TextStyle(
                        fontSize: AppDimension.height(20, context),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppDimension.width(10, context)),
                      ),
                    ),
                  ),
                ),
                Text(
                  " ${counter}",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: AppDimension.height(40, context),
                  ),
                ),
                Container(
                  height: AppDimension.height(40, context),
                    width: AppDimension.width(120, context),
                  child: ElevatedButton(
                    onPressed: incrementCounter,
                    child: Text(
                      "Increment",
                      style: TextStyle(
                        fontSize: AppDimension.height(20, context),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppDimension.width(10, context)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
