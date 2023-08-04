import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_dimension.dart';

class taskDetail extends StatefulWidget {
  @override
  State<taskDetail> createState() => _taskDetailState();
}

class _taskDetailState extends State<taskDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
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
                      "Task Detail",
                      style: TextStyle(
                        color: Colors.black,
                          fontSize: AppDimension.height(20, context),
                          fontFamily: "InterRegular"),
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
                      fontSize: AppDimension.height(20, context)
                    ),
                  ),
                  SizedBox(
                    height: AppDimension.height(5, context),
                  ),
                  Container(
                    width: AppDimension.width(240, context),
                    color: Color(0xFFF1EEEE),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppDimension.width(10, context),
                    vertical: AppDimension.height(15, context)
                    ),
                      child: Text(
                        "UI/UX APP Design",
                      style: TextStyle(
                        fontFamily: "InterRegular",
                      fontSize: AppDimension.height(18, context)
                    ),),
                    ),
                  ),
                  SizedBox(
                    height: AppDimension.height(10, context),
                  ),
                  Text("Description",
                  style: TextStyle(
                    fontFamily: "InterRegular",
                      fontSize: AppDimension.height(20, context)
                    ),
                  ),
                  SizedBox(
                    height: AppDimension.height(10, context),
                  ),
                  Container(
                    // height: AppDimension.height(160, context),
                    width: AppDimension.width(240, context),
                    color: Color(0xFFF1EEEE),
                    child: Padding(
                      padding:  EdgeInsets.only(left: AppDimension.width(15, context),right:AppDimension.width(10, context) ,
                      top: AppDimension.height(15, context),
                      bottom: AppDimension.height(30, context)

                      ),
                      child: Text("First I have to animate the logo and prototyping my design. it's very important First I have to animate the logo and prototyping my design. it's very important",


                      
                      style: TextStyle(
                        fontFamily: "InterRegular",
                        wordSpacing: 1,
                      fontSize: AppDimension.height(18, context)
                      ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimension.height(10, context),
                  ),
                  Text("Deadline",
                  style: TextStyle(
                    fontFamily: "InterRegular",
                      fontSize: AppDimension.height(20, context)
                    ),
                  ),
                  SizedBox(
                    height: AppDimension.height(10, context),
                  ),
                  Container(
                    
                    width: AppDimension.width(240, context),
                    color: Color(0xFFF1EEEE),
                    padding:EdgeInsets.symmetric(horizontal: AppDimension.width(10, context),
                      vertical: AppDimension.height(15, context)
                      ) ,
                    child: Text("April 29,2023",
                    style: TextStyle(
                      fontFamily: "InterRegular",
                      fontSize: AppDimension.height(18, context)
                    ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
