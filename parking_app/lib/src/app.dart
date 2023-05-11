import 'package:flutter/material.dart';
import 'package:parking_app/config/routes/routes.dart';
import 'package:parking_app/utils/helpers/constants.dart';

///Material App of parking application
class ParkingApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}