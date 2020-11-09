import 'package:calibration/generated/l10n.dart';
import 'package:calibration/pages/profile/profile.dart';
import 'package:flutter/material.dart';

import '../../styles.dart';

class UserInfoView extends StatefulWidget {
  final Profile profile;

  const UserInfoView({Key key, this.profile}) : super(key: key);

  @override
  _UserInfoViewState createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateTextController = TextEditingController();
  ValueNotifier<DateTime> _dateController;
  ValueNotifier<Sex> _sexController;

  Profile _localProfile = Profile();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Center(
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Styles.borderColor,
          foregroundColor: Styles.brightColor,
          child: Icon(Icons.umbrella_outlined),
        ),
      ),
      Row(children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(Icons.mail_outline),
        ),
        Expanded(
          child: TextField(
            controller: _idController,
            decoration: InputDecoration(labelText: S.current.profileId),
          ),
        ),
      ]),
      Row(children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(Icons.sentiment_very_satisfied),
        ),
        Expanded(
            child: TextField(
          controller: _nickNameController,
          decoration: InputDecoration(labelText: S.current.profileNickname),
        )),
      ]),
      Row(children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(Icons.person_pin_circle_outlined),
        ),
        Expanded(
            child: TextField(
          controller: _nameController,
          decoration: InputDecoration(labelText: S.current.profileName),
        )),
      ]),
      GestureDetector(
        onTap: () async {
          await showDatePicker(
              context: context,
              initialDate: _dateController?.value ??
                  DateTime.fromMillisecondsSinceEpoch(0),
              firstDate: DateTime(DateTime.now().year - 100),
              lastDate: DateTime(DateTime.now().year - 5));
        },
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.cake_outlined)),
            Expanded(
                child: TextField(
              controller: _dateTextController,
              enabled: false,
              decoration: InputDecoration(labelText: S.current.profileBirth),
            )),
          ],
        ),
      ),
      Container(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        OutlinedButton(onPressed: () {}, child: Text(S.current.cancel)),
        RaisedButton(onPressed: () {}, child: Text(S.current.save))
      ]),
    ]);
  }

  _updateControllers([Profile user]) {
    if (user.id != null) {
      _localProfile.id = user.id;
    }
    if (user.nickName != null) {
      _localProfile.nickName = user.nickName;
    }
    if (user.name != null) {
      _localProfile.name = user.name;
    }
    if (user.birthDate != null) {
      _localProfile.birthDate = user.birthDate;
    }
    if (user.sex != null) {
      _localProfile.sex = user.sex;
    }
  }
}
