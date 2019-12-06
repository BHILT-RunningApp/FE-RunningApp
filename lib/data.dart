import "package:flutter/material.dart";
import "dart:async";
import "dart:convert";
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: MapData(),
  ));
}

class MapData extends StatefulWidget {
  @override
  MapDataState createState() => MapDataState();
}

class MapDataState extends State<MapData> {
  var data;

  List<Map<String, dynamic>> coordinates = [];
  Future<String> getMapPoints() async {
    http.Response response = await http.get(
        'https://route.api.here.com/routing/7.2/calculateroute.json?app_id=Txymz9FTINQege2cDfHs&app_code=IKjwYCNr4_RL87uEk4TvSQ&waypoint0=geo!53.457915,-2.226825&waypoint1=geo!53.487144,-2.248454&mode=fastest;pedestrian;traffic:disabled');
    setState(() {
      data = json.decode(response.body);
    });
    var coord = data['response']['route'][0]['leg'][0]['maneuver'];
    for (var waypoint in coord) {
      coordinates.add(waypoint['position']);
    }
//    for (var i =0; i<coordinates.length; i++){
//
//    }
    print(coordinates);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("RunningApp")),
        body: new RaisedButton(
            child: new Text("Make Request"), onPressed: getMapPoints)
//        body: new ListView.builder(
//            itemCount: data.length,
//            itemBuilder: (BuildContext context, int index) {
//              return new Container(
//                  child: Center(
//                      child: Column(
//                crossAxisAlignment: CrossAxisAlignment.stretch,
//                children: <Widget>[
//                  Card(
//                    child: Container(
//                      child: Text(
//                        data[index]["route"],
//                        style: TextStyle(fontSize: 18.0, color: Colors.black54),
//                      ),
//                    ),
//                  ),
//                ],
//              )));
//            })
        );
  }
}
