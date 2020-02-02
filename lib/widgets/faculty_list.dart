import 'dart:html';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/auth.dart';
import '../helpers/faculties.dart';

class FacultyList extends StatefulWidget {
  @override
  _FacultyListState createState() => _FacultyListState();
}

class _FacultyListState extends State<FacultyList> {
  var faculty = [];
  var dispFaculty = [];
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 0),
      () async {
        await Provider.of<Faculty>(context).getFaculties();
        getFaculties();
      },
    );
  }

  void getFaculties() {
    faculty = Provider.of<Faculty>(context).faculties;
    setState(() {
      dispFaculty = faculty;
      _isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      width: MediaQuery.of(context).size.width * 0.3,
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: Colors.teal,
            title: FittedBox(
              child: Text(Provider.of<Auth>(context, listen: false).userId),
            ),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Provider.of<Auth>(context).logout();
                },
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 40,
            ),
            constraints: BoxConstraints(
              maxWidth: 400,
            ),
            child: TextField(
              onChanged: (value) {
                final temp = faculty.where((element) {
                  return element['facinfo']['name']
                      .toString()
                      .toLowerCase()
                      .contains(value.toLowerCase());
                }).toList();
                setState(() {
                  dispFaculty = temp;
                });
              },
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                hintText: 'Search',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(
                  color: Color(0xFFBDB3B3),
                ),
                errorStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
          Expanded(
            child: _isLoaded
                ? ListView.builder(
                    // shrinkWrap: false,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, i) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              dispFaculty[i]['facinfo']['img']
                                  .toString()
                                  .replaceFirst(
                                      'https://jai9399ftpimages.herokuapp.com/',
                                      'https://jai9399-reviewsapi.herokuapp.com/')
                                  .trimRight(),
                            ),
                          ),
                          title: Text(
                            dispFaculty[i]['facinfo']['name'],
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            dispFaculty[i]['facinfo']['post'],
                            style: TextStyle(color: Colors.white70),
                          ),
                          onTap: () async {
                            await Provider.of<Faculty>(context)
                                .selectFaculty(dispFaculty[i]['_id']);
                          },
                        ),
                      );
                    },
                    itemCount: dispFaculty.length,
                  )
                : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
