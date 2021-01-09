import 'package:flutter/material.dart';
import 'package:vtplrs/utilities/app_drawer.dart';
import 'package:vtplrs/utilities/constant.dart';

class Location_History extends StatefulWidget {
  Location_History({Key key}) : super(key: key);

  @override
  _Location_HistoryState createState() => _Location_HistoryState();
}

class _Location_HistoryState extends State<Location_History> {
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(color: kAppColor, fontSize: 20);
    return Container(
      child: Scaffold(
        drawer: Load_Drawer(),
        backgroundColor: kButtonColor,
        appBar: AppBar(
          title: Text(
            "Location History",
            style: TextStyle(color: kAppColor),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card tapped.');
                  },
                  child: Container(
                      width: 300,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Area',
                              style: textStyle,
                            ),
                            Text('Time', style: textStyle),
                            Text('Vehicle', style: textStyle)
                          ],
                        ),
                      )),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  // onTap: () {
                  //   print('Card tapped.');
                  // },
                  child: Container(
                      width: 300,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Area',
                              style: textStyle,
                            ),
                            Text('Time', style: textStyle),
                            Text('Vehicle', style: textStyle)
                          ],
                        ),
                      )),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  // onTap: () {
                  //   print('Card tapped.');
                  // },
                  child: Container(
                      width: 300,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Area',
                              style: textStyle,
                            ),
                            Text('Time', style: textStyle),
                            Text('Vehicle', style: textStyle)
                          ],
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
