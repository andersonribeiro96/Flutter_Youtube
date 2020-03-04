import 'package:FavYout/app/views/home.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search Youtube',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Home(),
    );
  }
}
