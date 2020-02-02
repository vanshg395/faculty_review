import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String userId;
  bool isLoggedIn = false;

  bool get isAuth {
    return isLoggedIn;
  }

  Future<bool> tryAutoLogin() async {
    HttpRequest.request(
      'https://jai9399-reviewsapi.herokuapp.com/redirect',
      method: 'GET',
      withCredentials: true,
      requestHeaders: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).then((res) {
      print(res.responseText);
      if (res.responseText == 'verify') {
        return false;
      } else {
        isLoggedIn = true;
        userId = res.responseText;
        notifyListeners();
        return true;
      }
    });
    return false;
  }

  Future<void> login(Map<String, String> _cred) async {
    try {
      // final response = await http.post(
      //   'https://jai9399-reviewsapi.herokuapp.com/login',
      //   body: _cred,
      // );
      // print(response.body);

      var response = await HttpRequest.request(
        'https://jai9399-reviewsapi.herokuapp.com/login',
        method: 'POST',
        sendData: json.encode(_cred),
        withCredentials: true,
        requestHeaders: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(response.responseText);
      // print(response.responseHeaders);
      // request.open('POST', 'https://jai9399-reviewsapi.herokuapp.com/login');
      // request.withCredentials = true;
      // print(request.response);
      // print(request.responseText);
      // print(response.);
      // HttpRequest();
      if (response.responseText == 'Logged in') {
        // final isValid = await http
        //     .get('https://jai9399-reviewsapi.herokuapp.com/isverified');
        // final isValidBody = isValid.body;
        // print(isValidBody);

        var response = await HttpRequest.request(
          'https://jai9399-reviewsapi.herokuapp.com/isverified',
          method: 'GET',
          withCredentials: true,
          requestHeaders: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );
        print(response.responseText);

        userId = _cred['email'];
        isLoggedIn = true;
        notifyListeners();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> signUp(Map<String, String> _cred) async {
    final response = await http.post(
      'https://jai9399-reviewsapi.herokuapp.com/signup',
      body: _cred,
    );
    print(response.body);
  }

  Future<void> logout() async {
    try {
      var response = await HttpRequest.request(
        'https://jai9399-reviewsapi.herokuapp.com/logout',
        method: 'GET',
        withCredentials: true,
        requestHeaders: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
    } catch (e) {
      print(e);
      return;
    }
    isLoggedIn = false;
    userId = '';
    notifyListeners();
  }
}
