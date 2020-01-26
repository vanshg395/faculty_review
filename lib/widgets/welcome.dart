import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final Function clickedHandler;

  Welcome(this.clickedHandler);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'VIT Faculty Review System OK',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 50,
            fontWeight: FontWeight.w900,
            fontFamily: 'Bangers',
            letterSpacing: 8,
          ),
        ),
        FittedBox(
          child: Icon(
            Icons.people,
            size: 400,
            color: Colors.white70,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white, width: 2),
                ),
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () => clickedHandler(1),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text(
                          '  Login  ',
                          style: TextStyle(
                            fontFamily: 'BarlowSemiCondensed',
                            // fontFamily: 'SairaCondensed',
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white, width: 2),
                ),
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () => clickedHandler(2),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontFamily: 'BarlowSemiCondensed',
                            // fontFamily: 'SairaCondensed',
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
