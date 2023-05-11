import 'dart:async';
import 'package:parking_app/src/models/parking_spot.dart';

class ParkingSpotsBloc {
  //definition of streamController mode
  final parkingSpotStreamController = StreamController.broadcast();
  //start streaming the data
  Stream get getStream => parkingSpotStreamController.stream;

  //definition of the list containing the parking spots
  final List<ParkingSpot> parkingSpotsList = [];

  ///method to add data to the list of parking spots and propagate it on the stream
  void addParkingSpot(ParkingSpot spot) {
    parkingSpotsList.add(spot);
    parkingSpotStreamController.sink.add(parkingSpotsList);
  }

  //method to close the stream
  void dispose() {
    parkingSpotStreamController.close();
  }
}
//initialization of BLoC
final bloc = ParkingSpotsBloc();