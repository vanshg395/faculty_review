import 'package:flutter/material.dart';

class FacultyList extends StatefulWidget {
  @override
  _FacultyListState createState() => _FacultyListState();
}

class _FacultyListState extends State<FacultyList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      width: MediaQuery.of(context).size.width * 0.3,
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: Colors.teal,
            title: Text('Hey'),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
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
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                hintText: 'Search',
                suffixIcon: Icon(Icons.search),
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
              keyboardType: TextInputType.emailAddress,
              // validator: (value) {
              //   if (value == '') {
              //     return 'This field is required.';
              //   }
              //   if (!RegExp(
              //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@vitstudent.ac.in")
              //       .hasMatch(value)) {
              //     return 'Please enter a valid VIT gmail id.';
              //   }
              // },
            ),
          ),
        ],
      ),
    );
  }
}
