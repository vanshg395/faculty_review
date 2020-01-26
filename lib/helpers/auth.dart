import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String userId;
  bool isLoggedIn = false;

  Future<void> login(Map<String, String> _cred) async {
    final url = 'https://jai9399-reviewsapi.herokuapp.com/login';
    final response = await http.post(
      url,
      body: _cred,
    );
    print(response.body);
    final url2 = 'https://jai9399-reviewsapi.herokuapp.com/comment';
    final res = await http.get(url2);
    print(res.body);
    isLoggedIn = true;
    notifyListeners();
  }

  Future<void> signUp(Map<String, String> _cred) async {
    final url = 'https://jai9399-reviewsapi.herokuapp.com/signup';
    final response = await http.post(
      url,
      body: _cred,
    );
    print(response.body);
  }

  void logout() {}
}
