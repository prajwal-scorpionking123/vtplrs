import 'package:flutter/material.dart';
import 'package:vtplrs/screens/home_screen.dart';
import 'package:vtplrs/screens/my_map.dart';
import 'package:vtplrs/screens/profile_page.dart';
import '../utilities/constant.dart';
import '../utilities/app_drawer.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('VTPLRS', style: TextStyle(color: kAppColor)),
          ),
          drawer: Load_Drawer(),
          // drawer: Load_Drawer(),
          body: Column(
            children: [
              Center(child: Text("Map Here")),
              Card(
                  child: Container(height: 300, width: 500, child: Load_Map())),
            ],
          )),
    );
  }
}
