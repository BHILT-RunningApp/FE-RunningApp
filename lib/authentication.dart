import 'package:flutter/material.dart';
import 'package:flutter_appp/loginPage.dart';
import 'package:flutter_appp/signupPage.dart';

class Authentication extends StatefulWidget{

  @override
  _AuthenticationState createState() => _AuthenticationState();

}

class _AuthenticationState extends State<Authentication>{

  bool toogledBool = false;

  void toogle() {
    setState(() {
      toogledBool = !toogledBool;
    });
  }

  @override

  Widget build(BuildContext context) {
   if(toogledBool){
     return SignupPage(toogle: toogle);
   }
   else {
     return LoginPage(toogle: toogle);
   }
  }



}