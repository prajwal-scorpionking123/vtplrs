import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
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

  Dashboard(
      {this.user,
      this.lat = 21.1962504,
      this.long = 79.0712471,
      this.area = "Farid Nagar"});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  User userData;
  Marker marker;
  bool loader;
  var uuid = Uuid();
  //this init
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      loader = true;
    });
    super.initState();
    userData = widget.user;

    print(widget.area);
    print(widget.lat);
    marker = new Marker(
      markerId: MarkerId(uuid.v1()),
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
