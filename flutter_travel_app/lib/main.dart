import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_app/cubit/app_cubit_logics.dart';
import 'package:flutter_travel_app/cubit/app_cubits.dart';
import 'package:flutter_travel_app/pages/detail_page.dart';
import 'package:flutter_travel_app/pages/main_page.dart';
import 'package:flutter_travel_app/pages/welcome_page.dart';
import 'package:flutter_travel_app/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices()
        ),
        child: AppCubitLogics(),
      ),
    );
  }
}