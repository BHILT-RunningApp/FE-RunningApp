import 'package:flutter/material.dart';
import 'package:running_man/home_map.dart';

//on home_map you can find the Leaflet map using openstreetmap. This is set with LatLng
//at the moment, geolocation is a list of realtime coordinates and can be found in home_one
// the map_test file is for trying all get requests to the api and also, for implementing geolocation
//in case of making any change, please USE map_test

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'HomePage demo',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//        ),
        home: Maptest());
  }
}
