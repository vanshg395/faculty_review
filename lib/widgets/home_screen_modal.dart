import 'package:flutter/material.dart';

import './welcome.dart';
import './login_modal.dart';
import './register_modal.dart';

class HomeScreenModal extends StatefulWidget {
  @override
  _HomeScreenModalState createState() => _HomeScreenModalState();
}

class _HomeScreenModalState extends State<HomeScreenModal>
    with SingleTickerProviderStateMixin {
  bool _isClicked = false;
  AnimationController _animationController;
  Animation<double> _opacityFadeInAnimation;
  Animation<double> _opacityFadeOutAnimation;
  int _authMode;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _opacityFadeInAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(curve: Curves.linear, parent: _animationController),
    );
    _opacityFadeOutAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(curve: Curves.linear, parent: _animationController),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void chooseAuthMode(int authMode) {
    _animationController.forward();
    setState(() {
      _authMode = authMode;
      _isClicked = true;
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.teal,
      child: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInCubic,
          height: _isClicked
              ? MediaQuery.of(context).size.height * 0.6
              : MediaQuery.of(context).size.height * 0.7,
          width: _isClicked
              ? MediaQuery.of(context).size.width < 800
                  ? MediaQuery.of(context).size.width * 0.8
                  : MediaQuery.of(context).size.width * 0.3
              : MediaQuery.of(context).size.width * 0.7,
          child: Card(
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 3,
            child: _isClicked
                ? _authMode == 1
                    ? FadeTransition(
                        opacity: _opacityFadeInAnimation,
                        child: LoginModal(chooseAuthMode),
                      )
                    : FadeTransition(
                        opacity: _opacityFadeInAnimation,
                        child: RegisterModal(chooseAuthMode),
                      )
                : FadeTransition(
                    opacity: _opacityFadeOutAnimation,
                    child: Welcome(chooseAuthMode),
                  ),
          ),
        ),
      ),
    );
  }
}
