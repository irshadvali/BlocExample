part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetInitialState extends InternetState {}

class InternetLostState extends InternetState {}

class InternetGainedState extends InternetState {}
