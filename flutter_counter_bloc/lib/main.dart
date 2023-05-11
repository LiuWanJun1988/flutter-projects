import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/counter_observer.dart';
import 'package:flutter_counter_bloc/app.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(const CounterApp());
}