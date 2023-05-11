import 'package:flutter/material.dart';
import 'package:parking_app/src/models/parking_spot.dart';
import 'package:parking_app/utils/helpers/constants.dart';

///dialog window containing the parking details
Future<void> showInfoDialog(ParkingSpot parkingSpot, BuildContext context) async {
  //parking name text style
  final TextStyle kMainTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25.0
  );
  //style for parking's description and rating
  final TextStyle kSubTextStyle = TextStyle(
      color: Colors.grey
  );

  //strings for text widgets
  final String _title = 'Parking details';
  final String _rating = 'Rating: ${parkingSpot.rating}';
  final String _button = 'Ok';

  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(_title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              parkingSpot.name,
              style: kMainTextStyle,
            ),
            SizedBox(height: kHorizontalSpacer),
            Text(parkingSpot.description,
                style: kSubTextStyle
            ),
            Text(_rating,
                style: kSubTextStyle
            )
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text(_button),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}