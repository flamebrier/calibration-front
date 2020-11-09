import 'package:calibration/pages/start/start_settings.dart';
import 'package:calibration/generated/l10n.dart';
import 'package:calibration/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChooseStartSettings extends StatefulWidget {
  final StartSettings initialSettings;
  final Function(StartSettings) onChoose;
  final Function(StartSettings) launch;

  const ChooseStartSettings(
      {Key key, this.initialSettings, this.onChoose, @required this.launch})
      : super(key: key);
  @override
  _ChooseStartSettingsState createState() => _ChooseStartSettingsState();
}

class _ChooseStartSettingsState extends State<ChooseStartSettings> {
  StartSettings _settings;
  bool _isSaved = false;

  final TextEditingController _linkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _settings = widget.initialSettings ?? StartSettings();
    if (_settings.maxTime == null) _settings.maxTime = Duration(minutes: 10);
    if (_settings.maxPeople == null) _settings.maxPeople = 2;
    if (_settings.goodsCounter == null) _settings.goodsCounter = 10;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25),
        child: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(S.current.startMaxTime),
          ),
          Row(children: <Widget>[
            Expanded(
                flex: 7,
                child: Slider(
                  min: 1,
                  max: 30,
                  activeColor: Styles.primaryColor,
                  onChanged: (double value) {
                    if (mounted) {
                      setState(() {
                        _isSaved = false;
                        _settings.maxTime = Duration(minutes: value.truncate());
                      });
                    }
                  },
                  value: _settings?.maxTime?.inMinutes?.toDouble() ?? 10,
                )),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    _settings?.maxTime?.inMinutes?.toString() ?? "10",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    Intl.plural(_settings?.maxTime?.inMinutes ?? 10,
                        zero: S.current.minutes0,
                        one: S.current.minutes1,
                        two: S.current.minutes2,
                        few: S.current.minutes3,
                        many: S.current.minutes5,
                        other: S.current.minutes5),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 25),
            child: Text(S.current.startMaxPeople ?? 10),
          ),
          Row(children: <Widget>[
            Expanded(
                flex: 7,
                child: Slider(
                  min: 1,
                  max: 6,
                  activeColor: Styles.primaryColor,
                  onChanged: (double value) {
                    if (mounted) {
                      setState(() {
                        _isSaved = false;
                        _settings.maxPeople = value.truncate();
                      });
                    }
                  },
                  value: _settings?.maxPeople?.toDouble() ?? 2,
                )),
            Expanded(
                child: Text(
              _settings?.maxPeople?.toString() ?? "2",
              textAlign: TextAlign.center,
            )),
          ]),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 25),
            child: Text(S.current.startGoodsCounter),
          ),
          Row(children: <Widget>[
            Expanded(
                flex: 7,
                child: Slider(
                  min: 1,
                  max: 35,
                  activeColor: Styles.primaryColor,
                  onChanged: (double value) {
                    setState(() {
                      _isSaved = false;
                      _settings.goodsCounter = value.truncate();
                    });
                  },
                  value: _settings?.goodsCounter?.toDouble() ?? 10,
                )),
            Expanded(
                child: Text(
              _settings?.goodsCounter?.toString() ?? "10",
              textAlign: TextAlign.center,
            )),
          ]),
          if (_isSaved) ...[
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 10),
              child: Text(
                S.current.share,
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
            ),
            TextField(
              controller: _linkController,
              decoration: InputDecoration(
                  labelText: S.current.startLinkInfo,
                  border: OutlineInputBorder()),
              readOnly: true,
            )
          ] else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Padding(
                padding: const EdgeInsets.only(top: 25),
                child: RaisedButton(
                    child: Text(S.current.save),
                    onPressed: () {
                      if (mounted) {
                        setState(() {
                          _isSaved = true;
                        });
                      }
                    }),
              )],
            ),
          if (_settings.allFilled && _isSaved)
            IconButton(
              icon: Icon(Icons.play_circle_fill_rounded),
              disabledColor: Colors.transparent,
              splashRadius: 24,
              onPressed: null,
              iconSize: 128,
            )
        ]),
      ),
      if (_settings.allFilled && _isSaved)
        IconButton(
          icon: Icon(Icons.play_circle_fill_rounded),
          color: Styles.actionColor,
          splashRadius: 24,
          onPressed: () {
            if (widget.launch != null) {
              widget.launch(_settings);
            }
          },
          iconSize: 128,
        )
    ]);
  }
}
