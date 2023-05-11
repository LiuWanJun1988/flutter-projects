import 'package:flutter/material.dart';
import 'package:parking_app/utils/ui/screens/loading_screen.dart';
import 'package:parking_app/utils/ui/screens/map_screen.dart';
import 'package:parking_app/utils/ui/screens/parking_screen.dart';

///class containg the routes for parking application
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/map_screen':
        return MaterialPageRoute(builder: (context) => MapScreen());
      case '/parking_screen':
        return MaterialPageRoute(builder: (context) => ParkingScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoadingScreen());
    }
  }
}