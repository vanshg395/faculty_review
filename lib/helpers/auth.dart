import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String userId;
  bool isLoggedIn = false;

  Future<void> login(Map<String, String> _cred) async {
    final url = 'https://jai9399-reviewsapi.herokuapp.com';
  }

  Future<void> signUp(Map<String, String> _cred) async {
    final url = 'https://jai9399-reviewsapi.herokuapp.com/signup';
    final response = await http.post(url, body: json.encode(_cred));
    print(1);
    print(response.body);
  }

  void logout() {}
}
