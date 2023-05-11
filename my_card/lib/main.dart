import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'screens/my_card.dart';
import 'screens/my_card_edit.dart';


SharedPreferences applicationPreferences;

void main(){

  Future<void> instantiatePreferences() async {
    applicationPreferences = await SharedPreferences.getInstance();
  }

  //Two lines below are slowing the application
  WidgetsFlutterBinding.ensureInitialized();
  instantiatePreferences();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: PageView(
          children: [
            MyCard(),
            MyCardEdit()
          ],
        )
    );
  }
}

