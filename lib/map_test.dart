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
                image: new NetworkImage(
                    "https://fsb.zobj.net/crop.php?r=mELUiAtFzr-X-2QfAbffs91qLa57V5bq55GEalKHUTVjPRDNdCrNwuxzPkuJ4gASCWdQjNqojiO90YHQ1jKNlign1W5Xm0WL1og--xm015YXC7LT7wVwX2AU9QX9dza1RWkA4dyRPYk_OBSG"),
                fit: BoxFit.cover
//               colorFilter: ColorFilter,
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
                    center: new LatLng(53.4774, -2.2309), minZoom: 15.0),
                layers: [
                  new TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c']),
                  new MarkerLayerOptions(markers: [
                    new Marker(
                        width: 15.0,
                        height: 15.0,
                        point: new LatLng(53.4774, -2.2309),
                        builder: (context) => new Container(
                              child: IconButton(
                                icon: Icon(Icons.location_on),
                                color: Colors.red,
                                iconSize: 45.0,
                                onPressed: () {
                                  print('Marker tapped');
                                },
                              ),
                            ))
                  ])
                ]),
          ),
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
