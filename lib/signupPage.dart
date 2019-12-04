
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget{

  @override

  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>{

  String _email, _password;
  void validateSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      // _loginCommand();
    }

//    void _signupCommand() async{
//      dynamic user = await postUser(_email, _password);
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
        title: Text('Sign up'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              validator: (input)=> input.isEmpty? 'Please type in your e-mail': input.contains('@')?null:'Please type in correct e-mail' ,
              onSaved: (input) =>  _email = input,
              decoration: InputDecoration(labelText: 'e-mail'),
            ),
            TextFormField(
              validator: (input)=> input.isEmpty? 'Please type in your password': null ,
              onSaved: (input) =>  _password = input,
              decoration: InputDecoration(labelText: 'password'),
            ),
            RaisedButton(
                onPressed: validateSave,
                child:Text('Sign up')
            )
          ],
        ),
      ),
    );
  }
}

