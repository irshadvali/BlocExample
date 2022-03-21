import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity/connectivity.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  // ignore: prefer_final_fields
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  InternetCubit() : super(InternetInitialState()) {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetGainedState());
      } else {
        emit(InternetLostState());
      }
    });
  }
  @override
  Future<void> close() {
    // ignore: todo
    // TODO: implement close
    connectivitySubscription?.cancel();
    return super.close();
  }
}
