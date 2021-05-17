import 'package:vtplrs/utilities/constant.dart';
import 'package:vtplrs/utilities/input_field.dart';
import 'package:flutter/material.dart';

class RecoverPassword extends StatefulWidget {
  @override
  _RecoverPasswordState createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  String email;
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
                    'Recover Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Input_Field(
                labal_text: "Enter Email",
                onChange: (value) {
                  setState(() {
                    email = value;
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
                    child: Text(
                      'Recover Password',
                      style: TextStyle(color: kAppColor, fontSize: 20),
                    ),
                    onPressed: () {

                    },
                  )),
            ],
          )),
    );
  }
}
