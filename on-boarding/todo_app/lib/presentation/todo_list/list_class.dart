import 'package:flutter/material.dart';
import 'package:todo_app/presentation/utils/app_dimension.dart';

class ListItem extends StatelessWidget {
  ListItem(
      {super.key, required this.dueDate,
      required this.title,
      required this.description,
      required this.status});

  String dueDate;
  String title;
  String description;
  Color status;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        height: AppDimension.height(80, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimension.height(30, context)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(1, 1),
              )
            ]),
        child: ListTile(
          leading: Container(
            margin: EdgeInsets.only(top: AppDimension.height(15, context)),
            height: AppDimension.height(60, context),
            width: AppDimension.width(50, context),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(AppDimension.height(40, context)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(1, 1)),
                ]),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "InterMedium",
                    fontSize: AppDimension.height(30, context)),
              ),
            ),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "InterSemiBold",
                      fontSize: AppDimension.height(14, context)),
                ),
              ),
              Container(
                width: 80,
                child: Text(
                  dueDate,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "InterRegular",
                      fontSize: AppDimension.height(14, context)),
                ),
              ),
            ],
          ),
          trailing: Container(
            margin: EdgeInsets.only(top: AppDimension.height(3, context)),
            color: status,
            height: AppDimension.height(50, context),
            width: AppDimension.width(5, context),
          ),
        ),
      ),
    );
  }
}
