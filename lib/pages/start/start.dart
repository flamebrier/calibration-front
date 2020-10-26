import 'package:calibration/pages/start/categories.dart';
import 'package:calibration/pages/start/choose_start_settings.dart';
import 'package:calibration/pages/start/start_settings.dart';
import 'package:calibration/generated/l10n.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  final StartSettings initialSettings;

  StartPage({Key key, this.initialSettings}) : super(key: key);
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>
    with AutomaticKeepAliveClientMixin {
  StartSettings _settings = StartSettings();

  @override
  void initState() {
    super.initState();
    if (widget.initialSettings != null) {
      _settings = widget.initialSettings;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text(S.current.startTitle)),
      body: _chooseViewBuilder(context),
    );
  }

  Widget _chooseViewBuilder(BuildContext context) {
    if (_settings.category == null) {
      return CategoriesView(
        onChoose: (category) {
          if (mounted) {
            setState(() {
              _settings.category = category;
            });
          }
        },
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
      launch: (settings) {

      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
