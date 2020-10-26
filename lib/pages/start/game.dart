import 'package:calibration/pages/start/start_settings.dart';
import 'package:flutter/material.dart';
import 'package:calibration/generated/l10n.dart';
import 'package:intl/intl.dart';

import '../../styles.dart';

class GameView extends StatefulWidget {
  final StartSettings settings;

  const GameView({Key key, @required this.settings}) : super(key: key);
  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  /// заглушка
  int _peopleIn = 2;

  Duration _timeLeft = const Duration(minutes: 8, seconds: 57);
  int _chooseLeft = 8;

  format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

  @override
  Widget build(BuildContext context) {
    if (widget.settings == null) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
        child: Column(children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              _peopleIn.toString(),
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(Intl.plural(_peopleIn,
                zero: S.of(context).peopleIn0,
                one: S.of(context).peopleIn1,
                two: S.of(context).peopleIn2,
                few: S.of(context).peopleIn3,
                many: S.of(context).peopleIn5,
                other: S.of(context).peopleIn5)),
            Spacer(),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(S.of(context).launchTimeLeft),
              Text(
                format(_timeLeft),
                style: Theme.of(context).textTheme.headline5,
              )
            ])
          ]),
          Text.rich(TextSpan(text: S.of(context).launchChooseLeft, children: [
            TextSpan(
                text: " " + _chooseLeft.toString(),
                style: Theme.of(context).textTheme.headline2)
          ])),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 600,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    color: Styles.brightColor,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).title,
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    S.of(context).title,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  )
                                ])),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RaisedButton(
                              elevation: 0,
                              color: Colors.blueGrey,
                              child: Icon(Icons.delete_outline_rounded),
                              onPressed: () {},
                            ),
                            RaisedButton(
                              elevation: 0,
                              color: Colors.greenAccent.shade400,
                              child: Icon(Icons.favorite_outline_rounded),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.close_rounded),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                iconSize: 36,
                splashRadius: 28,
              ))
        ]),
      ),
    );
  }
}
