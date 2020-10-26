import 'package:calibration/pages/profile/auth.dart';
import 'package:flutter/material.dart';
import 'package:calibration/generated/l10n.dart';

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
  Profile _user;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_user == null) {
      return AuthView();
    }
    return ListView(children: []);
  }

  @override
  bool get wantKeepAlive => true;
}
