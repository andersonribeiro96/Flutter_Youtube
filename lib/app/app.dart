import 'package:FavYout/app/blocs/videos_bloc.dart';
import 'package:FavYout/app/views/home.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: VideoBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Search Youtube',
        home: Home(),
      ),
    );
  }
}
