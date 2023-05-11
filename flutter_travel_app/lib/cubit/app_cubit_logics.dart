import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_app/cubit/app_cubit_states.dart';
import 'package:flutter_travel_app/cubit/app_cubits.dart';
import 'package:flutter_travel_app/pages/detail_page.dart';
import 'package:flutter_travel_app/pages/main_page.dart';
import 'package:flutter_travel_app/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if(state is DetailsState) {
            return DetailPage();
          }
          if(state is WelcomeState) {
            return WelcomePage();
          } if(state is LoadingState) {
            return Center(child: CircularProgressIndicator(),);
          } if(state is LoadedState) {
            return MainPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
