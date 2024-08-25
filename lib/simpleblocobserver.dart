import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Simpleblocobserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint(' onchange = ${change}');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint(' onclose = ${bloc}');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint(' onceate= ${bloc}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
