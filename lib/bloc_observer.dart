import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Myobserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('changs are $change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('close are $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('craete are $bloc');
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
