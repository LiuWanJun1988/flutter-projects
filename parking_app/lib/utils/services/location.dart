import 'package:geolocator/geolocator.dart';

///class receiving the current user position
class Location{
  double latitude;
  double longitude;

  ///method to return the current user location as future
  Future<void> getCurrentLocation() async {
    //getting the navigation data is very battery heavy, the precision should be adjusted accordingly
    try {
      bool serviceEnabled;
      LocationPermission permission;
      //check if the location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('Location services are disabled.');
      }
      //check if the location access permission is given
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) {
        print('Location permissions are permanently denied.');
      }
      //request location permission if they are denied
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          print('Location permissions are denied (actual value: $permission).');
        }
      }

      //request current position from Geolocator package
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      //assign the coordinates to the class fields
      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch (e){
      print(e);
    }

  }
}
