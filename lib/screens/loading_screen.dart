import 'package:geocoder/geocoder.dart';
import 'package:vtplrs/mappers/Location.dart';
import 'package:vtplrs/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vtplrs/services/LocationService.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    super.initState();
    fetchHistory();
  }

  //
  List<LocationMapper> _historyList;
  bool loader;
  List<String> _cities = [];
  LocationService locationService = new LocationService();
  Future<String> getRealAddress(double lt, double lg) async {
// From coordinates
    final coordinates = new Coordinates(
      lt,
      lg,
    );
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return addresses.first.subLocality.toString();
  }

  Future fetchHistory() async {
    setState(() {
      loader = true;
    });
    var response = await locationService.getLocationHistory();
    print(response);
    // var city;
    if (response != null) {
      setState(() {
        var historyList = locationFromJson(response);
        _historyList = new List.from(historyList.reversed);
      });
    } else {
      _historyList = null;
    }

    //creating cities
    if (_historyList != null) {
      await Future.wait(_historyList.map((e) async {
        var city =
            await getRealAddress(double.parse(e.lat), double.parse(e.long));
        _cities.add(city);
      }));
      setState(() {
        loader = false;
      });
    } else {
      setState(() {
        loader = false;
      });
    }

    //print
    print(_cities);
  }
  // lat=21.25
  //long=79.1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
