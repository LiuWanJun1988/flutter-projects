import 'package:flutter/material.dart';

///warning dialog shown when the coordinates for parking spot are not provided
Future<void> showWarningDialog(BuildContext context) async {
  //strings for text widgets
  final String _title = 'Warning';
  final String _description = 'Input latitude and longitude before creating a parking spot';
  final String _button = 'Understood';

  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(_title),
        content: Text(_description),
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