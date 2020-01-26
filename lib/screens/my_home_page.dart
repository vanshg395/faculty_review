import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/landing_screen.dart';
import '../widgets/comment_section.dart';
import '../widgets/faculty_list.dart';
import '../helpers/auth.dart';

class MyHomePage extends StatelessWidget {
  static const routeName = '/user';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<Auth>(context).isLoggedIn
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FacultyList(),
                CommentSection(),
              ],
            )
          : Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.teal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You Are Not Logged In',
                    style: TextStyle(
                      fontFamily: 'Bangers',
                      fontSize: 40,
                      color: Colors.white,
                      letterSpacing: 10,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        hoverColor: Color(0x00000000),
                        borderRadius: BorderRadius.circular(50),
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed(LandingScreen.routeName),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontFamily: 'BarlowSemiCondensed',
                                // fontFamily: 'SairaCondensed',
                                fontSize: 22,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
    // } else {
    //   Navigator.of(context).pushReplacementNamed(LandingScreen)
    // }
  }
}
