import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver{
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change)
  {
    debugPrint(change.toString());
    // TODO: implement onChange
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    // TODO: implement onClose
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    // TODO: implement onCreate
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition
      ) {
    // TODO: implement onTransition
  }
}