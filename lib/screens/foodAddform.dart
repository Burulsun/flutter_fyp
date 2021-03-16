import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'dart:io';

class FoodFormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FoodFormState();
  }
}

class FoodFormState  extends State<FoodFormScreen>{

  String _foodName;
  String _foodDescription;
  int _price;
  // DateTime _expireDate;
  // Image _image;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFoodNameField(){

    //builds a field for food name
    return TextFormField(
      decoration: InputDecoration(labelText: " Food name"),
      validator: (String value){
        if(value.isEmpty){
          return "Name is required";
        }
      },
      onSaved: (String value){
        _foodName =value;
      },
    );
  }



  Widget _buildFoodPriceField(){
    return TextFormField(
      decoration: InputDecoration(labelText: " Food price"),
      validator: (String value){
        if(value.isEmpty){
          return "Price is required";
        }
      },
      onSaved: (String value){
        _price =value as int;
      },
    );
  }

  Widget _buildFoodDescriptionField(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Food Description"),
      validator: (String value){
        if(value.isEmpty){
          return "Description is required";
        }
      },
      onSaved: (String value){
        _foodDescription =value;
      },
    );
  }





  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Food Form"),
      ),
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        margin: EdgeInsets.all(24),
        child: Form(child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildFoodNameField(),
              _buildFoodPriceField(),
              _buildFoodDescriptionField(),
              //_buildFoodDateField(),
              //_buildFoodImageField(),
              SizedBox(height: 100),
              ElevatedButton(
                  child: Text(
                      "Add",
                      style: TextStyle(color:Colors.blue, fontSize: 16)),
                  onPressed: (){
                    if(!_formKey.currentState.validate()){
                      return;
                    }

                    _formKey.currentState.save();
                    print(_foodName);
                    print(_price);
                    print(_foodDescription);
                    //print(_expireDate);
                    //print(_image);


                  }
              )


            ]
        )),
      ),

    );
  }


}
