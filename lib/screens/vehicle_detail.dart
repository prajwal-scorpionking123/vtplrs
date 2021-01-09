import 'package:flutter/material.dart';
import 'package:vtplrs/utilities/constant.dart';
import "package:vtplrs/utilities/input_field.dart";
import '../utilities/app_drawer.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Vehicle_Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var kProfiltextStyle = TextStyle(color: kAppColor, fontSize: 20);
    var kContainerColors = Colors.black;
    return Container(
      child: Scaffold(
        drawer: Load_Drawer(),
        appBar: AppBar(
          title: Text(
            "Vehicle Details",
            style: TextStyle(color: kAppColor),
          ),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                color: kContainerColors,
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: Row(
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.biking,
                      color: kAppColor,
                    ),
                    SizedBox(width: 20),
                    Text("Himalaya", style: kProfiltextStyle)
                  ],
                ),
              ),
              Container(
                color: kContainerColors,
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: Row(
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.rProject,
                      color: kAppColor,
                    ),
                    SizedBox(width: 20),
                    Text("300T", style: kProfiltextStyle)
                  ],
                ),
              ),
              Container(
                color: kContainerColors,
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: Row(
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.info,
                      color: kAppColor,
                    ),
                    SizedBox(width: 20),
                    Text("white", style: kProfiltextStyle)
                  ],
                ),
              ),
              Container(
                color: kContainerColors,
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: Row(
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.registered,
                      color: kAppColor,
                    ),
                    SizedBox(width: 20),
                    Text("MH20202", style: kProfiltextStyle)
                  ],
                ),
              ),
              Container(
                color: kContainerColors,
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: Row(
                  children: <Widget>[Text("Photos", style: kProfiltextStyle)],
                ),
              ),
              Container(
                color: kContainerColors,
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      print('Card tapped.');
                    },
                    child: Container(
                        // width: 300,
                        // height: 100,
                        child: Image(
                      image: AssetImage("images/bike1.jpg"),
                    )),
                  ),
                ),
              ),
              Container(
                color: kContainerColors,
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      print('Card tapped.');
                    },
                    child: Container(
                        // width: 300,
                        // height: 100,
                        child: Image(
                      image: AssetImage("images/bike2.jpg"),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
