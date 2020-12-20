import 'dart:convert';
import 'dart:developer';

import 'package:calibration/data/loader.dart';
import 'package:calibration/data/models.dart';
import 'package:calibration/generated/l10n.dart';
import 'package:calibration/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QuizesView extends StatefulWidget {
  final Category category;
  final Function(Quiz) onChoose;

  const QuizesView({Key key, this.onChoose, @required this.category})
      : super(key: key);
  @override
  _QuizesViewState createState() => _QuizesViewState();
}

class _QuizesViewState extends State<QuizesView> {
  List<Quiz> _quizes = List<Quiz>();

  @override
  void initState() {
    super.initState();
    Loader.instance.getQuizes(widget.category.id).then((response) {
      final body = json.decode(response.body);
      for (final e in body) {
        _quizes.add(Quiz()
          ..id = e["Id"]
          ..settings = (QuizSettings()
            ..filterTypeId = e["QuizSettings"]["FilterType"]
            ..id = e["QuizSettings"]["Id"])
          ..dateOfCreation = DateTime.parse(e["DateOfCreation"]));
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_quizes.isEmpty) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.primaryColor),
        ),
      );
    }
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 10, right: 25),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                    catNames[widget.category.name] ?? widget.category.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Styles.actionColor)),
              ),
              Container(height: 10),
              Text(S.of(context).startQuizSuggestion),
              Expanded(
                  child: ListView.builder(
                      itemCount: _quizes.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Quiz item = _quizes[index];
                        if (item == null) {
                          return Container();
                        }
                        return Card(
                          child: InkWell(
                            onTap: () {
                              if (widget.onChoose != null) {
                                widget.onChoose(item);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      DateFormat.yMMMd()
                                          .format(item.dateOfCreation ?? 0),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                  Text.rich(TextSpan(
                                      text: S.current.filter + ": ",
                                      children: [
                                        TextSpan(
                                            text: filterNames[FilterTypes
                                                    .values[
                                                item.settings.filterTypeId]],
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                    color: Styles.primaryColor))
                                      ]))
                                ],
                              ),
                            ),
                          ),
                        );
                      }))
            ]));
  }
}
