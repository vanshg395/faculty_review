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
    final selectedFaculty = Provider.of<Faculty>(context).selectedFaculty;
    // final selectedFacComments = selectedFaculty['comments'] as List<dynamic>;
    // print(selectedFacComments.length);
    return Provider.of<Faculty>(context).selectedFacId == ''
        ? Center(
            child: Text(
              'Choose a Faculty',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Bangers',
                color: Colors.white,
              ),
            ),
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
                      selectedFaculty['facinfo']['img']
                          .toString()
                          .replaceFirst(
                              'https://jai9399ftpimages.herokuapp.com/',
                              'https://jai9399-reviewsapi.herokuapp.com/')
                          .trimRight(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  selectedFaculty['facinfo']['name'],
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  selectedFaculty['facinfo']['post'],
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Card(
                        elevation: 1,
                        margin: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  for (var j = 1;
                                      j <=
                                          int.parse(
                                              Provider.of<Faculty>(context)
                                                  .comments[i]['rating']);
                                      j++)
                                    Icon(
                                      Icons.star,
                                      color: int.parse(
                                                  Provider.of<Faculty>(context)
                                                      .comments[i]['rating']) >
                                              3
                                          ? Colors.green
                                          : int.parse(Provider.of<Faculty>(
                                                          context)
                                                      .comments[i]['rating']) >
                                                  1
                                              ? Colors.yellow
                                              : Colors.red,
                                    )
                                ],
                              ),
                              Text(
                                Provider.of<Faculty>(context).comments[i]
                                    ['desc'],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: Provider.of<Faculty>(context).comments.length,
                  ),
                )
              ],
            ),
          );
  }
}
