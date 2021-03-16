
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class Authentication with ChangeNotifier{

  Future<void> signUp(String email, String password) async

  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key= AIzaSyD5UehasAX9jOXn4125Ugg28jCtoI9rars';




    final response = await http.post(Uri.parse(url), body: json.encode(
        {

          "email": email,
          "password": password,
          "returnSecureToken": true,
        }

    ));


    final responseData = json.decode(response.body);
    print(responseData);
  }
}