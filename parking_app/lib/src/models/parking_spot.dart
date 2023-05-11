import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_app/utils/ui/components/info_dialog.dart';
import 'package:uuid/uuid.dart';

///class collecting parking spot data
class ParkingSpot{
  //parking spot fields
  double latitude;
  double longitude;
  String name;
  String description;
  double rating;

  //class contructor
  ParkingSpot({
    this.name,
    this.description,
    this.latitude,
    this.longitude,
    this.rating
  });

  ///method to map ParkingSpot object to Firebase object
  Map<String, dynamic> toMap (ParkingSpot parkingSpot){
    return {
      'name': parkingSpot.name,
      'description': parkingSpot.description,
      'latitude': parkingSpot.latitude,
      'longitude': parkingSpot.longitude,
      'rating': parkingSpot.rating
    };
  }

  ///method to rebuild ParkingSpot object from Firebase object
  ParkingSpot fromMap (QueryDocumentSnapshot snapshot){
    return ParkingSpot(
        name: snapshot['name'],
        description: snapshot['description'],
        latitude: snapshot['latitude'],
        longitude: snapshot['longitude'],
        rating: snapshot['rating']
    );
  }

  ///method to convert ParkingSpot object to Map marker
  Set<Marker> getParkingMarkers(List<ParkingSpot> parkingSpotList, BuildContext context){
    //set of map markers
    Set<Marker> _markers = {};
    //initialization of id assigning plugin for markers set
    var uuid = Uuid();

    for (int i = 0; i < parkingSpotList.length; i++){
      //conversion of latitude and longitude to LatLng
      LatLng _position = LatLng(parkingSpotList[i].latitude, parkingSpotList[i].longitude);

      _markers.add(
          Marker(
              markerId: MarkerId(uuid.v1()),
              position: _position,
              //label displayed on the map
              infoWindow: InfoWindow(
                  title: parkingSpotList[i].name,
              ),
              onTap: () {
                //dialog window containing the parking details
                showInfoDialog(parkingSpotList[i], context);
              }
          )
      );
    }
    return _markers;
  }

}