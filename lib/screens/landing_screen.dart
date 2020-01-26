import 'package:flutter/material.dart';

import '../widgets/home_screen_modal.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();

  static const routeName = '/';
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreenModal(),
    );
  }
}
