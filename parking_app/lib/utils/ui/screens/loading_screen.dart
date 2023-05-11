import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_app/src/resources/firebase_database.dart';
import 'package:parking_app/utils/services/location.dart';

LatLng currentLocation;

///loading screen to receive current location and Firebase data before the map is loaded
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  //get the location and data from Firebase
  @override
  void initState() {
    FirebaseProvider().getParkingSpots();
    getLocation();
    super.initState();
  }

  ///method to receive current user location and navigate to map screen
  Future<void> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation().then((value) {
      currentLocation = LatLng(location.latitude, location.longitude);
      Navigator.pushNamed(context, '/map_screen');
      Navigator.pushReplacementNamed(context, '/map_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CircularProgressIndicator()
      ),
    );
  }
}
