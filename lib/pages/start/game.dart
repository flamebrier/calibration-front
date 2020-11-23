import 'package:calibration/pages/start/start_settings.dart';
import 'package:calibration/widgets/circle_icon_button.dart';
import 'package:calibration/widgets/countdown.dart';
import 'package:flutter/material.dart';
import 'package:calibration/generated/l10n.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:intl/intl.dart';

import '../../styles.dart';

class Post {
  Color color;
  String name;
  String description;
}

class GameView extends StatefulWidget {
  final StartSettings settings;

  const GameView({Key key, @required this.settings}) : super(key: key);
  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  /// заглушка
  int _peopleIn = 2;

  // Duration _timeLeft = const Duration(minutes: 8, seconds: 57);
  int _chooseLeft = 8;

  format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

  List<Post> posts = [
    Post()
      ..color = Colors.red
      ..name = "Красный"
      ..description = "Красный цвет",
    Post()
      ..color = Colors.green
      ..name = "Зеленый"
      ..description = "Зеленый цвет",
    Post()
      ..color = Colors.blue
      ..name = "Синий"
      ..description = "Синий цвет",
    Post()
      ..color = Colors.black
      ..name = "Черный"
      ..description = "Черный цвет",
    Post()
      ..color = Colors.amber
      ..name = "Желтый"
      ..description = "Желтый цвет",
  ];

  CardController controller = CardController();

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
              DurationCountdown(
                  from: widget.settings.maxTime ?? Duration(minutes: 10),
                  builder: (context, snapshot) {
                    return Text(
                      format(snapshot?.data),
                      style: ((snapshot?.data?.inSeconds ??
                                  widget.settings.maxTime.inSeconds) >
                              widget.settings.maxTime.inSeconds / 10)
                          ? Theme.of(context).textTheme.headline5
                          : Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: Styles.primaryColor),
                    );
                  })
            ])
          ]),
          Text.rich(TextSpan(text: S.of(context).launchChooseLeft, children: [
            TextSpan(
                text: " " + _chooseLeft.toString(),
                style: Theme.of(context).textTheme.headline2)
          ])),
          Expanded(
            child: TinderSwapCard(
              cardController: controller,
              stackNum: 3,
              totalNum: posts.length ?? 0,
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width * 0.95,
              minWidth: 100.0,
              minHeight: 200.0,
              cardBuilder: (context, index) {
                return Card(
                    elevation: 3,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 600,
                            color: posts[index]?.color ?? Colors.white,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          posts[index]?.name ??
                                              S.of(context).title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                        ),
                                        Text(
                                          posts[index]?.description ??
                                              S.of(context).title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        )
                                      ])),
                              Container(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: CircleIconButton(
                                            color: Styles.brightColor,
                                            borderColor: Styles.primaryColor,
                                            icon: Icon(
                                                Icons.delete_outline_rounded,
                                                color: Styles.primaryColor,
                                                size: 32),
                                            onTap: () {},
                                          ))),
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: CircleIconButton(
                                            color: Styles.brightColor,
                                            borderColor: Styles.actionColor,
                                            icon: Icon(
                                              Icons.favorite_outline_rounded,
                                              color: Styles.actionColor,
                                              size: 32,
                                            ),
                                            onTap: () {},
                                          ))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
              },
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
