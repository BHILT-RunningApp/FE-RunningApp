import 'package:flutter/material.dart';
import 'package:flutter_appp/loginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return  MaterialApp(
      title: 'HomePage demo',
      theme:  ThemeData(
        primarySwatch: Colors.blue,


      ),
      home: LoginPage(),
    );
  }
}
