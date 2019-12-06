import "package:flutter/material.dart";
import "dart:async";
import "dart:convert";
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';

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
  String url =
      "https://route.api.here.com/routing/7.2/calculateroute.json?app_id=Txymz9FTINQege2cDfHs&app_code=IKjwYCNr4_RL87uEk4TvSQ&waypoint0=geo!53.457915,-2.226825&waypoint1=geo!53.487144,-2.248454&mode=fastest;pedestrian;traffic:disabled";

  Future<String> getMapPoints() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
//    print(response.body);
    List data;
    var extractdata = JSON.decode(response.body);
    data = extractdata["response"];

    print(data["route"]);
    print(data[0]["name"]["first"]);
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
