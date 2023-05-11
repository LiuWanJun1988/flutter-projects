import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_app/src/bloc/parking_spots_bloc.dart';
import 'package:parking_app/src/models/parking_spot.dart';
import 'package:parking_app/utils/helpers/constants.dart';
import 'package:parking_app/utils/ui/components/search_map_bar/search_map_place.dart';
import 'package:parking_app/utils/ui/screens/loading_screen.dart';


///screen displaying map and parking locations
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  //class initialization
  ParkingSpot parkingSpot = ParkingSpot();
  //API key for search widget
  final String _mapsAPIKey = "AIzaSyCYGgvq2lMGoY1FIE6WZIqXz6ajL37JZug";
  final String _searchLanguage = 'en';
  final int _searchRadius = 30000;

  //initial map position
  final _initialCameraPosition = CameraPosition(
      target: currentLocation,
      zoom: 11.0
  );
  //map controller
  GoogleMapController _mapController;

  //assign map controller when map is created and receive the current user location
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  //receive the data from Firebase
  @override
  void initState() {
    super.initState();
  }
  //dispose the controller
  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(kAppName),
      ),
      body: StreamBuilder(
          stream: bloc.getStream,
          initialData: bloc.parkingSpotsList,
          builder: (context, snapshot) {
            if (!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                GoogleMap(
                myLocationEnabled: true,
                onMapCreated: _onMapCreated,
                initialCameraPosition: _initialCameraPosition,
                //draw parking markers on the map
                markers: parkingSpot.getParkingMarkers(snapshot.data, context),
              ),
                Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: Container(
                    width: 280,
                    child: SearchMapPlaceWidget(
                        apiKey: _mapsAPIKey,
                      language: _searchLanguage,
                      location: currentLocation,
                      radius: _searchRadius,
                      onSelected: (Place place) async {
                        final geolocation = await place.geolocation;

                        // Will animate the GoogleMap camera, taking us to the selected position with an appropriate zoom
                        _mapController.animateCamera(CameraUpdate.newLatLng(geolocation.coordinates));
                        _mapController.animateCamera(CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
                      },
                    ),
                  ),
                )
              ]
            );
          }
      ),
      //button to move to the parking spot details screen
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('/parking_screen');
        },
      ),
    );
  }
}

