import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'config/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
        onGenerateRoute: RouteGenerator.generateRoute
    );
  }
}
