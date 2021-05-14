import 'package:flutter/material.dart';
import 'package:vtplrs/screens/dashboard_screen.dart';
import 'package:vtplrs/screens/loading_screen.dart';
import 'package:vtplrs/screens/login_screen.dart';
import 'package:vtplrs/services/RegistrationService.dart';
import 'package:vtplrs/utilities/constant.dart';
import 'package:vtplrs/utilities/input_field.dart';
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';

class UserRegister extends StatefulWidget {
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  String name;
  String password;
  String email;
  String phoneNo;
  String age;
  String deviceId;
  void registerUser() async {
    RegistrationService registrationService = new RegistrationService(
        name: name,
        password: password,
        email: email,
        phoneNo: phoneNo,
        age: age,
        deviceId: deviceId);
    try {
      var status = await registrationService.doRegistration();
      if (status == true) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return UserLogin();
        }));
      } else {
        Alert(
          context: context,
          type: AlertType.error,
          title: "ALERT",
          desc: "Something Went Wrong",
          buttons: [
            DialogButton(
              child: Text(
                "Try Again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
      }
      print(status);
    } catch (e) {
      print(e);
    }
  }

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
              Input_Field(
                labal_text: "Device-Id",
                onChange: (value) {
                  setState(() {
                    deviceId = value;
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
                labal_text: "Enter Email",
                onChange: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              Input_Field(
                labal_text: "Enter password",
                onChange: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              Input_Field(
                labal_text: "Enter phone number",
                onChange: (value) {
                  setState(() {
                    phoneNo = value;
                  });
                },
              ),
              Input_Field(
                labal_text: "Enter Age",
                hint_text: "",
                onChange: (value) {
                  setState(() {
                    age = value;
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
                      registerUser();
                    },
                  )),
            ],
          )),
    );
  }
}
