import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:calibration/data/models.dart';
import 'package:calibration/widgets/circle_icon_button.dart';
import 'package:calibration/widgets/countdown.dart';
import 'package:flutter/material.dart';
import 'package:calibration/generated/l10n.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../styles.dart';

class Post {
  int id;
  String title;
  String pictureUrl;

  @override
  String toString() {
    return "id: $id, title: $title, pic: $pictureUrl\n";
  }
}

class GameView extends StatefulWidget {
  final StartSettings settings;
  final http.Response quiz;

  const GameView({Key key, @required this.settings, this.quiz})
      : super(key: key);
  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  /// заглушка
  int _peopleIn = 2;

  // Duration _timeLeft = const Duration(minutes: 8, seconds: 57);
  int _chooseLeft = 8;

  format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

  var quiz;

  List<Post> posts = List<Post>();

  @override
  void initState() {
    super.initState();
    quiz = json.decode(widget.quiz?.body);
    log(quiz.toString());
    for (final e in quiz["Questions"]) {
      posts.add(Post()
        ..id = e["Id"]
        ..title = e["Title"]
        ..pictureUrl = e["PictureUrl"]);
    }
    log(posts.toString());
  }

/*   List<Post> posts = [
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
  ]; */

  _checkImage(String url, {VoidCallback onError}) async {
    try {
      var res = await http.get(url);
      if (res.statusCode ~/ 100 != 2) {
        throw Exception("Image not found");
      }
    } catch (e) {
      if (onError != null) {
        onError();
      }
    }
  }

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
            maxWidth: MediaQuery.of(context).size.width,
            minWidth: 100.0,
            minHeight: 100.0,
            cardBuilder: (context, index) {
              /* _checkImage(posts[index].pictureUrl, onError: () {
                controller.triggerLeft();
                return Container();
              }); */
              /* precacheImage(
                AdvancedNetworkImage(
                  posts[index].pictureUrl,
                  useDiskCache: true,
                  loadFailedCallback: () {
                    controller.triggerLeft();
                  },
                  cacheRule: CacheRule(maxAge: const Duration(days: 7)),
                ),
                context,
              ); */
              return Card(
                  elevation: 3,
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: SingleChildScrollView(
                          child: CachedNetworkImage(
                              imageUrl: posts[index].pictureUrl,
                              /* frameBuilder: (BuildContext context,
                                            Widget child,
                                            int frame,
                                            bool wasSynchronouslyLoaded) {
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
                                        }, */
                              placeholder: (BuildContext context, String s) {
                                return Center(
                                    child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Styles.primaryColor),
                                ));
                              }),
                        ),
                      ),

                      /* CachedNetworkImage(
                                  imageUrl: posts[index].pictureUrl,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ) */
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
                                        posts[index]?.title ??
                                            S.of(context).title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ) /* ,
                                        Text(
                                          posts[index]?.description ??
                                              S.of(context).title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ) */
                                    ])),
                            Container(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          )),
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
