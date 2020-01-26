import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/auth.dart';

class LoginModal extends StatefulWidget {
  final Function authHandler;

  LoginModal(this.authHandler);

  @override
  _LoginModalState createState() => _LoginModalState();
}

class _LoginModalState extends State<LoginModal> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _credentials = {
    'email': '',
    'password': '',
  };

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    await Provider.of<Auth>(context).login(_credentials);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FittedBox(
            child: Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 50,
                fontWeight: FontWeight.w900,
                fontFamily: 'Bangers',
                letterSpacing: 8,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 300,
            ),
            child: TextFormField(
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                hintText: 'Email',
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xFFBDB3B3),
                ),
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
              validator: (value) {
                if (value == '') {
                  return 'This field is required.';
                }
              },
              onSaved: (email) {
                _credentials['email'] = email;
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 300,
            ),
            child: TextFormField(
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xFFBDB3B3),
                ),
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
              validator: (value) {
                if (value == '') {
                  return 'This field is required.';
                }
              },
              onSaved: (pass) {
                _credentials['password'] = pass;
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.05,
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: Colors.white, width: 2),
              ),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () => _submit(),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.05,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                hoverColor: Color(0x00000000),
                borderRadius: BorderRadius.circular(50),
                onTap: () => widget.authHandler(2),
                child: Center(
                  child: FittedBox(
                    child: Text(
                      'Sign Up Instead',
                      style: TextStyle(
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
    );
  }
}
