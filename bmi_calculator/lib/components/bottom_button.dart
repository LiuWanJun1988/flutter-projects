import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({Key key, @required this.function, @required this.buttonText}) : super(key: key);
  final VoidCallback function;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        child: Center(
          child: Text('$buttonText',
              style: kLargeButtonTextStyle),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height:  kBottomContainerHeight,
      ),
    );
  }
}