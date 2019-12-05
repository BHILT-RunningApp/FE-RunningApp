//import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_geolocation/geolocation.dart';

import 'dart:async';

void main() => runApp(new Test());

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new TestingHomepage(),
    );
  }
}

class TestingHomepage extends StatefulWidget {
  @override
  _TestingHomepageState createState() => new _TestingHomepageState();
}

class _TestingHomepageState extends State<TestingHomepage> {
  List<LocationResult> locations = [];
  StreamSubscription<LocationResult> streamSubscription;
  bool trackLocation = false;

  @override
  initState() {
    super.initState();
    checkGps();

    trackLocation = false;
    locations = [];
  }

  getLocation() {
    if (trackLocation) {
      setState(() => trackLocation = false);
      streamSubscription.cancel();
      streamSubscription = null;
    } else {
      setState(() => trackLocation = true);
      streamSubscription = Geolocation.locationUpdates(
        accuracy: LocationAccuracy.best,
        displacementFilter: 0.0,
        inBackground: false,
      ).listen((result) {
        final location = result;
        setState(() {
          locations.add(location);
        });
      });
      streamSubscription.onDone(() => setState(() {
            trackLocation = false;
          }));
    }
  }

  checkGps() async {
    final GeolocationResult result = await Geolocation.isLocationOperational();
    if (result.isSuccessful) {
      print("I did it!!!!!!!!!!!!!!!!");
    } else {
      print("Looser!");
    }
  }

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
          appBar: AppBar(title: Text("RunningMan"), actions: <Widget>[
            FlatButton(
              child: Text("Start point"),
              onPressed: getLocation,
            )
          ]
//            elevation: 0,
//            backgroundColor: Colors.blueGrey[600],
//            title: Text("RunningMan")
//            centerTitle: true,
              ),
          body:
//          Column(
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.fromLTRB(110.0, 20.0, 30.0, 40.0),
//                child: new Text(
//                  "Welcome to RunningMan",
//                  style: TextStyle(
//                    fontSize: 25.0,
//                    fontWeight: FontWeight.bold,
//                    letterSpacing: 2.0,
//                    color: Colors.blueGrey[600],
//                    fontFamily: 'Bitter',
//                  ),
//                ),
//              ),
//              new FlutterMap(
//                  options: new MapOptions(
//                      center: new LatLng(53.4774, -2.2309), minZoom: 15.0),
//                  layers: [
//                    new TileLayerOptions(
//                        urlTemplate:
//                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                        subdomains: ['a', 'b', 'c']),
//                    new MarkerLayerOptions(markers: [
//                      new Marker(
//                          width: 45.0,
//                          height: 45.0,
//                          point: new LatLng(53.4774, -2.2309),
//                          builder: (context) => new Container(
//                                child: IconButton(
//                                  icon: Icon(Icons.location_on),
//                                  color: Colors.red,
//                                  iconSize: 45.0,
//                                  onPressed: () {
//                                    print('Marker tapped');
//                                  },
//                                ),
//                              ))
//                    ])
//                  ]),
              Container(
            child: ListView(
              children: locations
                  .map((loc) => ListTile(
                        title: Text(
                            "You are here: ${loc.location.longitude} : ${loc.location.latitude}"),
                        subtitle: Text(
                          "Your Altitude is: ${loc.location.altitude}",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            color: Colors.blueGrey[600],
                            fontFamily: 'Bitter',
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
//            ],
//          ),
//
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
