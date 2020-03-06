import 'package:FavYout/app/app.dart';
import 'package:FavYout/app/shared/api.dart';
import 'package:flutter/material.dart';

void main() {
  Api api = Api();
  api.search("eletro");

  runApp(MyApp());
}
