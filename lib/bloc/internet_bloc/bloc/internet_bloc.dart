import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {

  Connectivity _connectivity = Connectivity();
  StreamSubscription ? connectivitySubscription;
  InternetBloc() : super(InternetInitialState()) {
    // on<InternetEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi ){
        add(InternetGainedEvent());
      }
      else{
        add(InternetLostEvent());
      }

    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    connectivitySubscription?.cancel();
    return super.close();
  }
}
