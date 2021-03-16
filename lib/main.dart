import 'package:flutter/material.dart';

//import 'foodAddform.dart';
import 'screens/signup_screen.dart';
import 'screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'models/authentication.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //return Muliprovider(
    //providers: [

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: Authentication(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        //home: FoodFormScreen(),
        home: SignUpFormScreen(),
        routes: {
          SignUpFormScreen.routeName: (ctx) => SignUpFormScreen(),
          LoginScreen.routeName: (ctx)=> LoginScreen(),
          HomeScreen.routeName: (ctx)=> HomeScreen(),
        },
        
      ),
      
    );
  }
}

