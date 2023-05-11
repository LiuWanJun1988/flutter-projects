import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: Magic8Ball(),
      ),
    );

class Magic8Ball extends StatefulWidget {
  @override
  _Magic8BallState createState() => _Magic8BallState();
}

class _Magic8BallState extends State<Magic8Ball> {
  @override
  Widget build(BuildContext context) {
    var ballChoice = Random().nextInt(4) + 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Ask Me Anything'),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: FlatButton(
          onPressed: () {
            setState(() {
            });
          },
          child: Image.asset('images/ball$ballChoice.png'),
        ),
      ),
    );
  }
}
