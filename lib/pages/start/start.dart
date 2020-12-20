import 'package:calibration/data/models.dart';
import 'package:calibration/pages/start/categories.dart';
import 'package:calibration/pages/start/choose_start_settings.dart';
import 'package:calibration/pages/start/enter_existing.dart';
import 'package:calibration/pages/start/game.dart';
import 'package:calibration/generated/l10n.dart';
import 'package:calibration/data/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../styles.dart';

class StartPage extends StatefulWidget {
  final StartSettings initialSettings;

  StartPage({Key key, this.initialSettings}) : super(key: key);
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>
    with AutomaticKeepAliveClientMixin {
  StartSettings _settings = StartSettings();
  User _user;

  @override
  void initState() {
    super.initState();
    if (widget.initialSettings != null) {
      _settings = widget.initialSettings;
    }
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (mounted) {
        setState(() {
          _user = user;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_user == null) {
      return EnterExisting(implyLeading: false);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.startTitle),
        leading: (_settings.category != null)
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Styles.actionColor,
                ),
                onPressed: () {
                  if (mounted) {
                    setState(() {
                      _settings.category = null;
                    });
                  }
                },
              )
            : Container(),
      ),
      body: _chooseViewBuilder(context),
    );
  }

  Widget _chooseViewBuilder(BuildContext context) {
    if (_settings.category == null) {
      return Column(
        children: [
          Expanded(
            child: CategoriesView(
              onChoose: (category) {
                if (mounted) {
                  setState(() {
                    _settings.category = category;
                  });
                }
              },
            ),
          ),
          RaisedButton.icon(
              icon: Icon(Icons.vpn_key_outlined),
              label: Text(S.current.startAlready),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EnterExisting()))),
          Container(
            height: 25,
          )
        ],
      );
    }
    return ChooseStartSettings(
      initialSettings: _settings,
      onChoose: (settings) {
        if (mounted) {
          setState(() {
            _settings = settings;
          });
        }
      },
      launch: (settings) async {
        var response = await Loader.instance.getQuizById();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                GameView(settings: _settings, quiz: response)));
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
