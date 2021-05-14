import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:vtplrs/mappers/Location.dart';
import 'package:vtplrs/mappers/User.dart';
import 'package:vtplrs/screens/dashboard_screen.dart';
import 'package:vtplrs/services/LocationService.dart';
import 'package:vtplrs/utilities/app_drawer.dart';
import 'package:vtplrs/utilities/constant.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Location_History extends StatefulWidget {
  Location_History({this.user});
  final User user;
  @override
  _Location_HistoryState createState() => _Location_HistoryState();
}

class _Location_HistoryState extends State<Location_History> {
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

  @override
  void initState() {
    fetchHistory();
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(color: kAppColor, fontSize: 20);
    return Container(
      child: Scaffold(
        drawer: Load_Drawer(user: widget.user),
        backgroundColor: kButtonColor,
        appBar: AppBar(
          title: Text(
            "Location History",
            style: TextStyle(color: kAppColor),
          ),
        ),
        body: SafeArea(
          child: loader == true
              ? SpinKitRotatingCircle(
                  color: Colors.white,
                  size: 50.0,
                )
              : ListView.builder(
                  itemCount: _historyList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return new Dashboard(
                                user: widget.user,
                                lat: double.parse(_historyList[index].lat),
                                long: double.parse(_historyList[index].long),
                                area: _cities[index]);
                            ;
                          }));
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
                                    "Area:    ${_cities[index]}",
                                    style: textStyle,
                                  ),
                                  Text(
                                      'Time&Date:   ${_historyList[index].timeStamp}',
                                      style: textStyle),
                                  Text(
                                      'Vehicle:   ${_historyList[index].deviceId}',
                                      style: textStyle)
                                ],
                              ),
                            )),
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
