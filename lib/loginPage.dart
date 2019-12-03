import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
      ),
      body: Form(
        key:_formKey,
        child:Column(
          children:<Widget>[
            TextFormField(
              validator: (input){
                if(input.isEmpty){
                  return 'Please type in your e-mail';
                }
              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            TextFormField(
              validator: (input){
                if(input.isEmpty){
                  return 'Please type in valid password';
                }
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(labelText: 'password'),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: (){},
              child:Text('Sign in')
            )

          ]
        )
      )
    );
  }
}