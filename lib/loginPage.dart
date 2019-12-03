import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  void validateSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
     // _loginCommand();
    }

//    void _loginCommand() async{
//      dynamic user = await getUser(_email, _password);
//      if (user == null){
//        final snackbar = SnackBar(content: Text('Incorrect details')),
//    scaffoldKey.currentState.showSnackBar(snackbar);
//      } else {
//        widget.changeUser(user)
//      }
//
//    }

  }

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget>[
            TextFormField(
              validator: (input)=>
                input.isEmpty?'Please type in your e-mail':input.contains('@')?null:'Please type in a correct e-mail',
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
              onPressed: validateSave,
              child:Text('Sign in')
            )

          ]
        )
      )
    );
  }
}