import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/landing_screen.dart';
import './screens/my_home_page.dart';
import './helpers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LandingScreen.routeName,
        // initialRoute: MyHomePage.routeName,
        routes: {
          LandingScreen.routeName: (context) => LandingScreen(),
          MyHomePage.routeName: (context) => MyHomePage(),
        },
      ),
    );
  }
}
