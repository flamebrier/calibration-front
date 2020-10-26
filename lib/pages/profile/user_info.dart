import 'package:calibration/pages/profile/profile.dart';
import 'package:flutter/material.dart';

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
  ValueNotifier<DateTime> _dateController;
  ValueNotifier<Sex> _sexController;

  Profile _localProfile = Profile();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [],
    );
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
