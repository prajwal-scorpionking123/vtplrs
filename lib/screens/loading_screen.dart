import 'package:vtplrs/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    super.initState();
    redirectTo();
  }

  //
  void redirectTo() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Dashboard();
    }));
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
