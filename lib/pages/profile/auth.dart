import 'package:calibration/generated/l10n.dart';
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
      child: RaisedButton(
          child: Text("Sign in with Google" /* S.current.signInGoogle */),
          onPressed: () {
            signInWithGoogle();
          }),
    );
  }
}