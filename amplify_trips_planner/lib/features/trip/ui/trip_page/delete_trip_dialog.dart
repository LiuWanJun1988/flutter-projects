import 'package:flutter/material.dart';

class DeleteTripDialog extends StatelessWidget {
  const DeleteTripDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Please confirm'),
      content: Text('Delete this trip?'),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop(true);
          },
          child: const Text('Yes'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('No'),
        )
      ],
    );
  }
}
