import 'package:flutter/material.dart';
import 'package:vtplrs/screens/dashboard_screen.dart';
import 'package:vtplrs/screens/loading_screen.dart';
import 'package:vtplrs/utilities/constant.dart';
import 'package:vtplrs/utilities/input_field.dart';
import 'dart:convert';

class UserRegister extends StatefulWidget {
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  String name;
  String device_id;
  String pass;
  String email_id;
  String phone;
  String dob;
  String address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register", style: TextStyle(color: kAppColor)),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              // Container(
              //     alignment: Alignment.center,
              //     padding: EdgeInsets.all(10),
              //     child: Text(
              //       'Registration',
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontWeight: FontWeight.w500,
              //           fontSize: 30),
              //     )),
              Input_Field(
                labal_text: "Enter Device Id",
                onChange: (value) {
                  setState(() {
                    device_id = value;
                  });
                },
              ),
              Input_Field(
                labal_text: "Enter Name",
                onChange: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              Input_Field(
                labal_text: "Enter email id",
                onChange: (value) {
                  setState(() {
                    email_id = value;
                  });
                },
              ),
              Input_Field(
                labal_text: "Enter password",
                onChange: (value) {
                  setState(() {
                    pass = value;
                  });
                },
              ),
              Input_Field(
                labal_text: "Enter phone number",
                onChange: (value) {
                  setState(() {
                    phone = value;
                  });
                },
              ),
              Input_Field(
                labal_text: "Enter Date of Birth",
                hint_text: "dd/mm/yyyy",
                onChange: (value) {
                  setState(() {
                    dob = value;
                  });
                },
              ),
              Input_Field(
                labal_text: "Enter Address",
                onChange: (value) {
                  setState(() {
                    address = value;
                  });
                },
              ),
              SizedBox(height: 15),
              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.black,
                    child: Text('Register',
                        style: TextStyle(color: kAppColor, fontSize: 20)),
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
