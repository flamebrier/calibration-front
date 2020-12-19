import 'dart:developer';

import 'package:calibration/pages/profile/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:calibration/generated/l10n.dart';

import '../../styles.dart';

enum Sex { undefined, male, female }

class Profile {
  String id;
  String nickName;
  String name;
  String photoUrl;

  Profile();
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  final ValueNotifier<String> _photoController = ValueNotifier<String>("");
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Profile _localUser = Profile();

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance?.authStateChanges()?.listen((user) {
      if (user != null) {
        if (mounted) {
          setState(() {
            _updateControllers(Profile()
              ..id = user?.email
              ..name = user?.displayName
              ..photoUrl = user?.photoURL);
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _photoController.removeListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_localUser == null) {
      return AuthView();
    }
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(S.current.profileTitle),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: ListView(shrinkWrap: true, children: [
              Container(
                  height: 100,
                  width: 100,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.network(
                    _photoController.value,
                    frameBuilder: (BuildContext context, Widget child,
                        int frame, bool wasSynchronouslyLoaded) {
                      if (frame == null) {
                        return Container();
                      }
                      if (wasSynchronouslyLoaded) {
                        return child;
                      }
                      return AnimatedOpacity(
                        child: child,
                        opacity: frame == null ? 0 : 1,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeOut,
                      );
                    },
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Styles.primaryColor),
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  )),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.email_outlined,
                    color: Styles.semiDarkColor,
                  ),
                ),
                Expanded(
                    child: TextField(
                  controller: _emailController,
                  enabled: false,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Styles.semiDarkColor),
                  decoration: InputDecoration(
                    labelText: S.current.profileId,
                    border: InputBorder.none,
                  ),
                )),
              ]),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.sentiment_very_satisfied),
                ),
                Expanded(
                    child: TextField(
                  controller: _nickNameController,
                  onChanged: (text) {
                    if (text != _localUser.nickName) {
                      _startEditing();
                    }
                  },
                  decoration:
                      InputDecoration(labelText: S.current.profileNickname),
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
                  onChanged: (text) {
                    if (text != _localUser.name) {
                      _startEditing();
                    }
                  },
                  decoration: InputDecoration(labelText: S.current.profileName),
                )),
              ]),
              Container(height: 10),
              if (_isEditing)
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            _updateControllers();
                          },
                          child: Text(S.current.cancel)),
                      RaisedButton(
                          onPressed: () {
                            _updateControllers(Profile()
                              ..name = _nameController.text
                              ..nickName = _nickNameController.text);
                          },
                          child: Text(S.current.save))
                    ])
            ]),
          )),
    );
  }

  _startEditing() {
    if (!_isEditing) {
      if (mounted) {
        setState(() {
          _isEditing = true;
        });
      }
    }
  }

  _updateControllers([Profile user]) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (user != null) {
      if (user.id != null) {
        _localUser.id = user.id;
      }
      if (user.name != null) {
        _localUser.name = user.name;
      }
      if (user.nickName != null) {
        _localUser.nickName = user.nickName;
      }
      if (user.photoUrl != null) {
        _localUser.photoUrl = user.photoUrl;
      }
    }
    if (_localUser.id != null) {
      _emailController.text = _localUser.id;
    }
    if (_localUser.name != null) {
      _nameController.text = _localUser.name;
    }
    if (_localUser.nickName != null) {
      _nickNameController.text = _localUser.nickName;
    }
    if (_localUser.photoUrl != null) {
      _photoController.value = _localUser.photoUrl;
    }
    if (mounted) {
      setState(() {
        _isEditing = false;
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
}
