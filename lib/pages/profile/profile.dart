import 'package:calibration/pages/profile/auth.dart';
import 'package:calibration/pages/profile/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:calibration/generated/l10n.dart';

import '../../auth_service.dart';

enum Sex { undefined, male, female }

class Profile {
  String id;
  String nickName;
  String name;
  DateTime birthDate;
  Sex sex;
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  User _user;

  @override
  void initState() {
    super.initState();
    // signInWithGoogle();
    /* FirebaseAuth.instance?.authStateChanges()?.listen((user) {
      if (mounted) {
        setState(() {
          _user = user;
        });
      }
    }); */
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // _user = FirebaseAuth.instance?.currentUser;
    if (FirebaseAuth.instance?.currentUser == null) {
      return AuthView();
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(S.current.profileTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: UserInfoView(),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
