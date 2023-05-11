import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parking_app/src/bloc/parking_spots_bloc.dart';
import 'package:parking_app/src/models/parking_spot.dart';

///class interfacing with the firebase
class FirebaseProvider {

  //access to the firebase parking spot collection
  final _firebaseData = FirebaseFirestore.instance.collection('parkingSpots');
  //parking spot class initialization
  final _parkingSpot = ParkingSpot();

  ///method to add new parking spot to firebase and the BLoC
  void addNewParkingSpot(ParkingSpot pS) {
    _firebaseData.add(_parkingSpot.toMap(pS));
    bloc.addParkingSpot(pS);
  }

  ///method to download the Firebase element and push the data to the BLoC
  void getParkingSpots() {
    _firebaseData.get().then((snapshot) {
      snapshot.docs.forEach((element) {
        var _newParkingSpot = _parkingSpot.fromMap(element);
        bloc.addParkingSpot(_newParkingSpot);
      });
    });
  }

}