import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  @override
  Widget build(BuildContext context) {
    var leftDiceNumber = Random().nextInt(6) + 1;
    var rightDiceNumber = Random().nextInt(6) + 1;
    return Center(
      child: FlatButton(
        onPressed: () {
          setState(() {
          //widget is rebuild and new values of dies are chosen
          });
        },
        child: Row(
          children: [
            Expanded(
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Image.asset('images/dice$rightDiceNumber.png'),
            )
          ],
        ),
      ),
    );
  }
}