import 'package:flutter/material.dart';
import 'package:flutter_fyp/models/authentication.dart';
import 'login_screen.dart';
import 'package:provider/provider.dart';



class SignUpFormScreen extends StatefulWidget {
  static const routeName = '/signup';
  @override
  State<StatefulWidget> createState() {
    return SignUpFormState();
  }
}


class SignUpFormState  extends State<SignUpFormScreen> {

  String _name;
  String _email;
  String _password;
  String _password2;
  String _phoneNumber;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> _authData ={
    "email" : "",
    "password" : ""
  };

  Future<void> _submit() async
  {
    if(!_formKey.currentState.validate())
      {
        return;
      }
    _formKey.currentState.save();

    await Provider.of<Authentication> (context, listen: false).signUp(
        _authData['email'],
        _authData['password']);
  }

  Widget _nameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: " Name"),
      validator: (String value){
        if(value.isEmpty){
          return "Name is required";
        }
      },
      onSaved: (String value){
        _name =value;
      },
    );
  }


  Widget _emailField() {
    return TextFormField(
        decoration: InputDecoration(labelText: "Email"),
        keyboardType: TextInputType.visiblePassword,
        // validator: (String value) {
        //   if (value.isEmpty) {
        //     return "Email is required";
        //   }
        //   String pattern = r"^([a-zA-Z]{2,}\s[a-zA-z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)";
        //   RegExp regExp = new RegExp(pattern);
        //
        //   if (!regExp.hasMatch(value)) {
        //     return 'Enter a valid email';
        //   }
        // },

      validator: (value){
        if(value.isEmpty || !value.contains(("@")))
        {
          return "invalid email";
        }
        return null;
      },
        onSaved: (String value) {
          _authData['email'] = value;
        },
    );
  }

  Widget _passwordField() {
    return TextFormField(
        decoration: InputDecoration(labelText: "Passworddddddddd"),
        validator: (String value) {
          if (value.isEmpty) {
            return "Password is required";
          }
        },
        onSaved: (String value) {
          _authData['password'] = value;
        },

    );
  }


  Widget _passwordRepeatField() {
    return TextFormField(
        decoration: InputDecoration(labelText: "Repeat Password"),
        validator: (String value) {
          if (value.isEmpty) {
            return "Password is required";
          }
        },
        onSaved: (String value) {
          _name = value;
        },

    );
  }


  Widget _phoneNumberField() {
    return TextFormField(
        decoration: InputDecoration(labelText: "Phone Number"),
        validator: (String value) {
          if (value.isEmpty) {
            return "Phone Number is required";
          }
        },
        onSaved: (String value) {
          _name = value;
        },

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Sign Up  "),
          actions: <Widget> [
            ElevatedButton(
              child: Row(

                children: <Widget>[
                  Text("Sign In"),
                  Icon(Icons.person_add)
                ],
              ),
              onPressed: (){
                  Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              },

            )


            ],



      ),

      body: Container(
          margin: EdgeInsets.all(24),
          child: Form(
              key: _formKey,
              child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _nameField(),
                    _emailField(),
                    _passwordField(),
                    _passwordRepeatField(),
                    _phoneNumberField(),
                    SizedBox(height: 100),
                    ElevatedButton(
                        onPressed: () {

                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _submit();

                      _formKey.currentState.save();

                      print(_name);
                      print(_email);
                      print(_password);
                      print(_password2);
                      print(_phoneNumber);
                    },
                        child: Text(
                            'Submit', style: TextStyle(color: Colors.white)))
                  ]
              )

          )


      ),
    );
  }
}


