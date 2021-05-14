import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:vtplrs/mappers/User.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:vtplrs/screens/dashboard_screen.dart';
import 'package:vtplrs/screens/home_screen.dart';
import 'package:vtplrs/screens/location_history.dart';
import 'package:vtplrs/screens/profile_page.dart';
import 'package:vtplrs/screens/report_thief.dart';
import 'package:vtplrs/screens/setting.dart';
import 'package:vtplrs/screens/vehicle_detail.dart';
import 'package:vtplrs/services/AddVehicleService.dart';
import 'package:vtplrs/utilities/app_drawer.dart';
import 'package:vtplrs/utilities/constant.dart';
import 'package:vtplrs/utilities/input_field.dart';

class Add_Vehicle extends StatefulWidget {
  Add_Vehicle({this.user});
  final User user;
  @override
  _Add_VehicleState createState() => _Add_VehicleState();
}

class _Add_VehicleState extends State<Add_Vehicle> {
  String make, model, colour, registration, email;
  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  void add() async {
    AddVehicleService addV = new AddVehicleService(
        make: make,
        model: model,
        colour: colour,
        registration: registration,
        email: email,
        images: images);
    var status = await addV.addVehicle();
    if (status == true) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Successful",
        desc: "Added Successfully",
        buttons: [
          DialogButton(
            child: Text(
              "See Details",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Vehicle_Detail(user: widget.user);
              }))
            },
            width: 120,
          )
        ],
      ).show();
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "ALERT",
        desc: "Something Went Wrong",
        buttons: [
          DialogButton(
            child: Text(
              "Try Again",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => {Navigator.pop(context)},
            width: 120,
          )
        ],
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Load_Drawer(user: widget.user),
      appBar: AppBar(
        title: Text(
          "Add Vehicle",
          style: TextStyle(color: kAppColor),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  height: 100,
                  width: 50,
                  child: Column(
                    children: <Widget>[
                      Center(child: Text('Error: $_error')),
                      ElevatedButton(
                        child: Text("Pick images"),
                        onPressed: loadAssets,
                      ),
                      Expanded(
                        child: buildGridView(),
                      )
                    ],
                  )),
              Input_Field(
                labal_text: "Company",
                onChange: (value) {
                  setState(() {
                    make = value;
                  });
                },
              ),
              Input_Field(
                labal_text: "Model",
                onChange: (value) {
                  setState(() {
                    model = value;
                  });
                },
              ),
              Input_Field(
                labal_text: "Colour",
                onChange: (value) {
                  setState(() {
                    colour = value;
                  });
                },
              ),
              Input_Field(
                labal_text: "Registration Number",
                onChange: (value) {
                  setState(() {
                    registration = value;
                  });
                },
              ),
              Input_Field(
                labal_text: "Email",
                onChange: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 15),
              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.black,
                    child: Text('Add',
                        style: TextStyle(color: kAppColor, fontSize: 20)),
                    onPressed: () {
                      add();
                    },
                  )),
            ],
          )),
    );
  }
}
