import 'package:flutter/material.dart';
import 'package:vtplrs/mappers/User.dart';
import 'package:vtplrs/utilities/app_drawer.dart';
import 'package:vtplrs/utilities/constant.dart';

class Report_Thief extends StatefulWidget {
  Report_Thief({this.user});
  final User user;
  @override
  _Report_ThiefState createState() => _Report_ThiefState();
}

class _Report_ThiefState extends State<Report_Thief> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: kButtonColor,
        drawer: Load_Drawer(user: widget.user),
        appBar: AppBar(
          title: Text(
            "Report Theft",
            style: TextStyle(color: kAppColor),
          ),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Card(
                  child: Container(
                      width: 300,
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "F.I.R. Format",
                            style: TextStyle(color: kAppColor, fontSize: 21),
                          ))),
                ),
                Card(
                  child: Container(
                      width: 300,
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Complaint Type",
                              style:
                                  TextStyle(color: kAppColor, fontSize: 21)))),
                ),
                Card(
                  child: Container(
                      width: 300,
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Phone No",
                              style:
                                  TextStyle(color: kAppColor, fontSize: 21)))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
