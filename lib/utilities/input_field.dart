import 'package:flutter/material.dart';

class Input_Field extends StatelessWidget {
  const Input_Field({this.labal_text, this.onChange, this.hint_text});
  final String labal_text;
  final String hint_text;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        onChanged: onChange,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            labelStyle: TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            labelText: '$labal_text',
            hintText: '$hint_text'),
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
