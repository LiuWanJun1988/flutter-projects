import 'package:geolocator/geolocator.dart';

class Location{
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    //getting the navigation data is very battery heavy, the precision should be adjusted accordingly
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch (e){
      print(e);
    }

  }
}