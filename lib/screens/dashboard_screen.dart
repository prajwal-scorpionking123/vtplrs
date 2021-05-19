import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:locally/locally.dart';
import 'package:vtplrs/mappers/Location.dart';
import 'package:vtplrs/mappers/User.dart';
import 'package:vtplrs/screens/home_screen.dart';
import 'package:vtplrs/screens/my_map.dart';
import 'package:vtplrs/screens/profile_page.dart';
import 'package:vtplrs/services/LocationService.dart';
import '../utilities/constant.dart';
import '../utilities/app_drawer.dart';

class Dashboard extends StatefulWidget {
  User user;
  String area;
  double lat;
  double long;
  // Set<Marker> markers;
  Dashboard({
    this.user,
    this.lat = 21.1962504,
    this.long = 79.0712471,
    this.area = "Farid Nagar",
  });

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  User userData;
  Marker marker;
  bool loader;

  var timer;
  int length;
  List<LocationMapper> historyList;
  void fetchRealTime() async {
    var hasPermissions = await FlutterBackground.hasPermissions;
    if (!hasPermissions) {
      // TODO: Show warning to user or something
      print('hasPermissions: $hasPermissions');
    }
    try {
      final config = FlutterBackgroundAndroidConfig(
        notificationTitle: 'flutter_background example app',
        notificationText:
            'Background notification for keeping the example app running in the background',
        notificationIcon: AndroidResource(name: 'background_icon'),
      );
      // Demonstrate calling initialize twice in a row is possible without causing problems.
      hasPermissions =
          await FlutterBackground.initialize(androidConfig: config);
      hasPermissions =
          await FlutterBackground.initialize(androidConfig: config);
    } catch (ex) {
      print(ex);
    }
    if (hasPermissions) {
      final backgroundExecution =
          await FlutterBackground.enableBackgroundExecution();
      if (backgroundExecution) {
        timer = Timer.periodic(
            Duration(seconds: 30), (Timer t) => {getLastLocation()});
      }
    }
  }

  void getLastLocation() async {
    // print(historyList.last.timeStamp);
    if (length != null) {
      print(length);
    }
    LocationService locatioService = new LocationService();
    var response = await locatioService.getLocationHistory();
    setState(() {
      historyList = locationFromJson(response);
    });
    if (length != null) {
      if (length < historyList.length) {
        setState(() {
          length = historyList.length;
        });
        show();
      } else {
        length = length;
      }
    } else {
      setState(() {
        length = historyList.length;
      });
    }

    print(historyList);
    var lastLocation = historyList.last;
    print(lastLocation.timeStamp);
  }

  void show() async {
    print("hello");
    // Map<String, dynamic> payload = new Map<String, dynamic>();
    // payload["data"] = "content";
    // AlertController.show("Title", "message here!", TypeAlert.success);
    //
    // Locally locally = Locally(
    //   context: context,
    //   payload: 'test',
    //   pageRoute: MaterialPageRoute(
    //       builder: (context) => Dashboard(
    //           user: widget.user,
    //           lat: double.parse(historyList.last.lat),
    //           long: double.parse(historyList.last.long))),
    //   appIcon: 'mipmap/ic_launcher',
    // );

    // locally.show(title: "Update", message: "Hello");
    final coordinates = new Coordinates(double.parse(historyList.first.lat),
        double.parse((historyList.first.long)));
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var ar = addresses.first.subLocality.toString();
    Alert(
      context: context,
      type: AlertType.error,
      title: "Location Update",
      desc: "Hey your location is updated",
      buttons: [
        DialogButton(
            child: Text(
              "Check",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            width: 120,
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new Dashboard(
                      user: widget.user,
                      lat: double.parse(historyList.first.lat),
                      long: double.parse(historyList.first.long),
                      area: ar);
                })))
      ],
    ).show();
  }

  void stopExecution() async {
    var hasPermissions = await FlutterBackground.hasPermissions;
    hasPermissions = await FlutterBackground.initialize();
    bool enabled = FlutterBackground.isBackgroundExecutionEnabled;
    if (enabled) {
      await FlutterBackground.disableBackgroundExecution();
    }
  }

  //this init
  @override
  void initState() {
    // TODO: implement initState
    fetchRealTime();
    setState(() {
      loader = true;
    });
    super.initState();
    userData = widget.user;

    print(widget.area);
    print(widget.lat);
    marker = new Marker(
      markerId: MarkerId("id-1"),
      position: LatLng(widget.lat, widget.long),
      draggable: true,
      infoWindow: InfoWindow(title: "${widget.area}", snippet: "Local Area"),
    );
    setState(() {
      loader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VTPLRS', style: TextStyle(color: kAppColor)),
      ),
      drawer: Load_Drawer(user: widget.user),
      // drawer: Load_Drawer(),
      body: loader
          ? SpinKitRotatingCircle(
              color: Colors.black,
              size: 50.0,
            )
          : Center(
              child: Load_Map(
              lat: widget.lat,
              long: widget.long,
              area: widget.area,
              marker: marker,
            )),
    );
  }
}
