import 'package:FavYout/app/app.dart';
import 'package:flutter/material.dart';

import 'app/shared/api.dart';

void main() {
  runApp(MyApp());
  Api api = Api();
  api.search("eletro");
}
