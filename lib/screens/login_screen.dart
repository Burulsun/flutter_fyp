import 'package:flutter/material.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget{
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();




}

class _LoginScreenState extends State<LoginScreen>{
  String _email;
  String _password;


  final GlobalKey<FormState> _logInFormKey = GlobalKey();

  void _submit(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Login'),
            actions: <Widget> [
              TextButton(
                  child: Row(

                    children: <Widget>[
                      Text("Sign Up"),
                      Icon(Icons.person_add)
                    ],
                  ),
                onPressed: (){
                    Navigator.of(context).pushReplacementNamed(SignUpFormScreen.routeName);
                },

                )


            ],

        ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.lightGreenAccent,
                  Colors.blue,
                ]
              )
            ),
          ),
          Center(child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),

            ),
            child: Container(
              height: 260,
              width: 300,
              padding: EdgeInsets.all(16),
              child: Form(
                key: _logInFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget> [

                      //email
                      TextFormField(
                        decoration: InputDecoration(labelText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                        validator: (logInValue){
                          if(logInValue.isEmpty || !logInValue.contains(("@")))
                            {
                              return "invalid email";
                            }
                          return null;
                        },
                        onSaved: (logInValue){
                          _email = logInValue;

                        },
                      ),

                      TextFormField(
                        decoration: InputDecoration(labelText: "Password"),
                        obscureText: true,


                        validator: (logInValue){
                          if(logInValue.isEmpty || logInValue.length<=8)
                          {
                            return "invalid password";
                          }
                          return null;
                        },

                        onSaved: (logInValue){
                          _password = logInValue;

                        },
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      ElevatedButton(onPressed: () {
                        if (!_logInFormKey.currentState.validate()) {
                          return;
                        }
                        _logInFormKey.currentState.save();

                        print(_password);
                        print(_email);

                      },
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(30),
                        // ),
                        // color: Colors.blue,
                        // textColor

                      )
                    ],
                  ),
                )
              ),
            ),
          ),)
        ]
      ),
    );


  }
  
}