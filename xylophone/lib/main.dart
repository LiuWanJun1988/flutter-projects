import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playSound(String note) {
    final player = AudioCache();
    player.play(note);
  }

  Widget buildKey(Color color, String note) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(note);
        }, child:Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildKey(Colors.red, 'note1.wav'),
                    buildKey(Colors.orange, 'note2.wav'),
                    buildKey(Colors.yellow, 'note3.wav'),
                    buildKey(Colors.green, 'note4.wav'),
                    buildKey(Colors.teal, 'note5.wav'),
                    buildKey(Colors.blue, 'note6.wav'),
                    buildKey(Colors.indigo, 'note7.wav'),
                  ]
              )
          ),
        ),
      ),
    );
  }
}
