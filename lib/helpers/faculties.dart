import 'dart:html';
import 'dart:convert';

import 'package:flutter/material.dart';

class Faculty with ChangeNotifier {
  List<dynamic> faculty;
  String selectedFacId = '';
  Map<String, dynamic> selectedFaculty;

  List<dynamic> get faculties {
    return [...faculty];
  }

  Future<void> getFaculties() async {
    var response = await HttpRequest.request(
      'https://jai9399-reviewsapi.herokuapp.com/faculty',
      method: 'GET',
      withCredentials: true,
      requestHeaders: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    faculty = json.decode(response.responseText) as List<dynamic>;
    notifyListeners();
  }

  Future<void> getFacultyById(String id) async {
    var response = await HttpRequest.request(
      'https://jai9399-reviewsapi.herokuapp.com/faculty/$id',
      method: 'GET',
      withCredentials: true,
      requestHeaders: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    selectedFaculty = json.decode(response.responseText);
    notifyListeners();
  }

  Future<void> selectFaculty(String id) async {
    selectedFacId = id;
    await getFacultyById(id);
    notifyListeners();
  }
}
