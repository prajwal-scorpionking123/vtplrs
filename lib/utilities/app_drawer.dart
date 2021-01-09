import 'package:flutter/material.dart';
import 'package:vtplrs/screens/dashboard_screen.dart';
import 'package:vtplrs/screens/home_screen.dart';
import 'package:vtplrs/screens/location_history.dart';
import 'package:vtplrs/screens/profile_page.dart';
import 'package:vtplrs/screens/report_thief.dart';
import 'package:vtplrs/screens/setting.dart';
import 'package:vtplrs/screens/vehicle_detail.dart';
import 'constant.dart';

class Load_Drawer extends StatelessWidget {
  const Load_Drawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'User',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home', style: TextStyle(color: kAppColor)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Dashboard();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile', style: TextStyle(color: kAppColor)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Profile_Page();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.location_history_rounded),
            title: Text('Location History', style: TextStyle(color: kAppColor)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Location_History();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.bike_scooter),
            title: Text('Vehicle Details', style: TextStyle(color: kAppColor)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Vehicle_Detail();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.report_problem),
            title: Text('Report Theft', style: TextStyle(color: kAppColor)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Report_Thief();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings', style: TextStyle(color: kAppColor)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Setting();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout', style: TextStyle(color: kAppColor)),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => home_screen()),
                  ModalRoute.withName('/'));
            },
          ),
        ],
      ),
    );
  }
}
