import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parking_app/src/models/parking_spot.dart';
import 'package:parking_app/src/resources/firebase_database.dart';
import 'package:parking_app/utils/helpers/constants.dart';
import 'package:parking_app/utils/helpers/parser.dart';
import 'package:parking_app/utils/ui/components/warning_dialog.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

///screen receiving the data for the parking spot
class ParkingScreen extends StatefulWidget {
  @override
  _ParkingScreenState createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {

  //definition of text controllers to receive input data
  TextEditingController _longitudeController = TextEditingController();
  TextEditingController _latitudeController = TextEditingController();
  TextEditingController _parkingName = TextEditingController();
  TextEditingController _parkingDescription = TextEditingController();
  //rating intial value
  double _rating = 0;
  //definition of strings for widgets
  final String _labelName = 'Parking name';
  final String _labelDescription = 'Parking description';
  final String _labelLatitude = 'Latitude';
  final String _labelLongitude = 'Longitude';
  final String _saveButton = 'Save the spot';
  //text formatter for lang & lat input fields, only allow digits and .
  final List<TextInputFormatter> kCoordinateFormat = [
    FilteringTextInputFormatter.allow(
        RegExp(r'(^-?\d*\.?\d*)'))
  ];
  //keyboard type for lang & lat field allowing the input of the numbers
  final TextInputType _kCoordinateKeyboard = TextInputType.numberWithOptions(decimal: true);
  //sizing values for clear interface
  final double _kParkingScreenVerticalSpacer = 15.0;
  final double _kRatingSize = 50.0;
  final double _kParkingScreenBottomSpacer = 40.0;
  final double _kParkingScreenSaveButtonWidth = 150.0;
  final double _kParkingScreenSaveButtonHeight = 40.0;

  //validator methods for lat & long fields
  String _validateLatitude(String value) {
    if (value.isNotEmpty) {
      double validatorValue = stringToDouble(value);
      if (validatorValue < -90 || validatorValue > 90) {
        return 'Please enter valid latitude';
      }
    }
    return null;
  }
  String _validateLongitude(String value){
    if (value.isNotEmpty) {
      double validatorValue = stringToDouble(value);
      if (validatorValue < -180 || validatorValue > 180) {
        return 'Please enter valid latitude';
      }
    }
    return null;
  }

  //method to send input parking details to database as ParkingSpot class
  void _sendDataToFirebase() {
    //all fields except for lat and long can be empty for the definition of the parking spot
    if (_latitudeController.text.isNotEmpty && _longitudeController.text.isNotEmpty) {
      double _latitude = stringToDouble(_latitudeController.text);
      double _longitude = stringToDouble(_longitudeController.text);
      ParkingSpot _newParkingSpot = ParkingSpot(
          name: _parkingName.text,
          description: _parkingDescription.text,
          latitude: _latitude,
          longitude: _longitude,
          rating: _rating
      );
      FirebaseProvider().addNewParkingSpot(_newParkingSpot);
      Navigator.pop(context);
    }
    else {
      showWarningDialog(context);
    }
  }

  //disposal of controllers
  @override
  void dispose() {
    _longitudeController.dispose();
    _latitudeController.dispose();
    _parkingName.dispose();
    _parkingDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppName),
      ),
      body: ListView(
        padding: const EdgeInsets.all(kPadding),
        children: [
          //input for parking name
          TextField(
            controller: _parkingName,
            decoration: InputDecoration(
                labelText: _labelName,
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: _kParkingScreenVerticalSpacer),
          //input for parking description
          TextField(
            controller: _parkingDescription,
            decoration: InputDecoration(
                labelText: _labelDescription,
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: _kParkingScreenVerticalSpacer),
          Row(
            children: [
              Expanded(
                //input for parking latitude coordinate
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: _latitudeController,
                  validator: _validateLatitude,
                  inputFormatters: kCoordinateFormat,
                  keyboardType: _kCoordinateKeyboard,
                  decoration: InputDecoration(
                      labelText: _labelLatitude,
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              SizedBox(width: kHorizontalSpacer),
              Expanded(
                child:
                //input for parking longitude coordinate
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: _longitudeController,
                  validator: _validateLongitude,
                  inputFormatters: kCoordinateFormat,
                  keyboardType: _kCoordinateKeyboard,
                  decoration: InputDecoration(
                      labelText: _labelLongitude,
                      border: OutlineInputBorder()
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: _kParkingScreenVerticalSpacer),
          Center(
            //input for parking rating
            child: SmoothStarRating(
              size: _kRatingSize,
              //allowHalfRating: false,
              onRated: (value) {
                _rating = value;
              },
            ),
          ),
          SizedBox(height: _kParkingScreenBottomSpacer),
          //save button, align allows to center button in ListView
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: _kParkingScreenSaveButtonWidth,
              height: _kParkingScreenSaveButtonHeight,
              child: ElevatedButton(
                onPressed: () {
                  _sendDataToFirebase();
                },
                child: Text(_saveButton),
              ),
            ),
          )
        ],
      ),
    );
  }
}
