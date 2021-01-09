import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Load_Map extends StatefulWidget {
  Load_Map({Key key}) : super(key: key);

  @override
  _Load_MapState createState() => _Load_MapState();
}

class _Load_MapState extends State<Load_Map> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(20.5937, 78.9629);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 4,
          ),
        ),
      ),
    );
  }
}
