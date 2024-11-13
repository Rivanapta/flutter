import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_flutter_2_counter_cubit/app.dart';
import 'package:task_flutter_2_counter_cubit/counter_observer.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const CounterApp());
}
