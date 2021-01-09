import 'package:flutter/material.dart';
import 'package:vtplrs/screens/loading_screen.dart';
import 'dashboard_screen.dart';
import 'package:vtplrs/utilities/constant.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController rollController = TextEditingController();
  String textLable = "User Name";
  final String mainLable = "Login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VTPLRS", style: TextStyle(color: kAppColor)),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '$mainLable',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(
                          borderSide: new BorderSide(
                        color: Colors.black,
                      )),
                      labelText: 'Enter User Name',
                      hintText: "User Name"),
                  style: TextStyle(color: Colors.black),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Enter Password',
                    ),
                    style: TextStyle(color: Colors.black)),
              ),
//
              SizedBox(height: 15),
              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.black,
                    child: Text(
                      'Login',
                      style: TextStyle(color: kAppColor, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Dashboard();
                      }));
                    },
                  )),
            ],
          )),
    );
  }
}
