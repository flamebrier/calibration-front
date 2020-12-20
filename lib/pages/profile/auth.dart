import 'package:calibration/generated/l10n.dart';
import 'package:calibration/styles.dart';
import 'package:flutter/material.dart';

import '../../auth_service.dart';

class AuthView extends StatefulWidget {
  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton.icon(
          color: Styles.brightColor,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          icon: Container(
              height: 32,
              width: 32,
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Image.asset("assets/google_logo.jpg"),
              )),
          label: Text(S.current.signInGoogle),
          onPressed: () {
            signInWithGoogle();
          }),
    );
  }
}
