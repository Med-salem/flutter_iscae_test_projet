import 'package:flutter/material.dart';
import 'package:our_pharmacies/permission.dart';
import 'package:our_pharmacies/places_list.dart';

import 'carte.dart';
import 'Refresh.dart';
import 'places_list.dart';
import 'permission.dart';
import 'place_info.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/Permission',
    routes: {
      '/Home': (context) => Carte(),
      '/Permission': (context) => AskPermission(),
      '/Refresh': (context) => GetUserLocation(),
      '/PlaceInfo': (context) => PlaceInfo(),
      '/PlaceList': (context) => PlacesList(),
    },
  ));
}
