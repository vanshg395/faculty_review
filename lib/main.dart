import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/landing_screen.dart';
import './screens/my_home_page.dart';
import './helpers/auth.dart';
import 'helpers/faculties.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Auth(),
      child: Consumer<Auth>(
        builder: (ctx, auth, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // home: auth.isLoggedIn ? MyHomePage() : LandingScreen(),
            home: auth.isLoggedIn
                ? ChangeNotifierProvider.value(
                    value: Faculty(),
                    child: MyHomePage(),
                  )
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (context, authResultSnapshot) {
                      if (authResultSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Scaffold(
                          body: Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                      } else {
                        return LandingScreen();
                      }
                    },
                  ),
            routes: {
              MyHomePage.routeName: (context) => MyHomePage(),
            },
          );
        },
      ),
    );
  }
}
