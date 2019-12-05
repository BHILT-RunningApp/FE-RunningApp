import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:new_geolocation/geolocation.dart';

import 'dart:async';

//see https://github.com/alfanhui/new_geolocation/blob/master/lib/facet_android/location.dart

void main() => runApp(new Maptest());

class Maptest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var points = <LatLng>[
    new LatLng(53.2832, -2.1503),
    new LatLng(53.4774, -2.2309)
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to RunningMan',
      home: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
          image: AssetImage("assets/running.jpeg"),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.blueGrey[600],
            title: Text("RunningMan"),
            centerTitle: true,
          ),
          body: Center(
              child: new FlutterMap(
                  options: new MapOptions(
                      center: new LatLng(53.4774, -2.2309), minZoom: 5.0),
                  layers: [
                new TileLayerOptions(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/chancayl/ck3sk6kg204rw1dru4w8zyuhr/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiY2hhbmNheWwiLCJhIjoiY2szc2s2MHQxMDV2NjNjbmh0eWUzbnZreSJ9.lezjaEbXhVsuOpkaKxiZiA",
                    additionalOptions: {
                      "accessToken":
                          "pk.eyJ1IjoiY2hhbmNheWwiLCJhIjoiY2szc2tsNHJzMDdkMzNvbW5yNXZwejl2ZiJ9.Qp2kV0-P22Z52DxjV3q1qg",
                      "id": "mapbox.mapbox-streets-v7"
                    }),
//                  new MarkerLayerOptions(markers: [
//                    new Marker(
//                        width: 15.0,
//                        height: 15.0,
//                        point: new LatLng(53.4774, -2.2309),
//                        builder: (context) => new Container(
//                              child: IconButton(
//                                icon: Icon(Icons.location_on),
//                                color: Colors.red,
//                                iconSize: 45.0,
//                                onPressed: () {
//                                  print('Marker tapped');
//                                },
//                              ),
//                            ))
//                  ])
                new PolylineLayerOptions(polylines: [
                  new Polyline(
                      points: points, strokeWidth: 5.0, color: Colors.red)
                ]),
              ])),
          floatingActionButton: FloatingActionButton(
//          floatingActionButtonLocation:
//              FloatingActionButtonLocation.centerDocked,
            onPressed: () {},
            child: Text('Find Route!'),
            backgroundColor: Colors.blueGrey[600],
          ),
        ),
      ),
    );
  }
}