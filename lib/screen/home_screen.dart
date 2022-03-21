// ignore_for_file: prefer_const_constructors

import 'package:bloc_example/bloc/internet_bloc/bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
            listener: (context, state) {
              if (state is InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Internet Connected."),
                  backgroundColor: Colors.green,
                ));
              } else if (state is InternetLostState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Internet is not  Connected."),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              if (state is InternetGainedState) {
                return Text("Connected");
              } else if (state is InternetLostState) {
                return Text("Not Connected");
              } else {
                return Text("Loading....");
              }
            },
          ),
          // child: BlocBuilder<InternetBloc, InternetState>(
          //   builder: (context, state) {
          //     if (state is InternetGainedState) {
          //       return Text("Connected");
          //     } else if (state is InternetLostState) {
          //       return Text("Not Connected");
          //     } else {
          //       return Text("Loading....");
          //     }
          //     // return Text("Loading....");
          //   },
          // ),
        ),
      ),
    );
  }
}
