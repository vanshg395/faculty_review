import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/faculties.dart';

class FacultyOverview extends StatefulWidget {
  @override
  _FacultyOverviewState createState() => _FacultyOverviewState();
}

class _FacultyOverviewState extends State<FacultyOverview> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<Faculty>(context).selectedFacId == ''
        ? Center(
            child: Text('Hey'),
          )
        : Container(
            margin: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 40,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 300,
                  width: 300,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      Provider.of<Faculty>(context)
                          .selectedFaculty['facinfo']['img']
                          .toString()
                          .replaceFirst(
                              'https://jai9399ftpimages.herokuapp.com/',
                              'https://jai9399-reviewsapi.herokuapp.com/')
                          .trimRight(),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
