import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:calibration/generated/l10n.dart';

import '../../styles.dart';

class HistoryTile extends StatelessWidget {
  final DateTime date;
  final String category;
  final int matches;
  final String user1;
  final String user2;

  const HistoryTile(
      {Key key, this.date, this.category, this.matches, this.user1, this.user2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Styles.radius)),
          side: BorderSide(color: Styles.borderColor)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(DateFormat.yMMMd()
                    .format(date ?? DateTime.fromMillisecondsSinceEpoch(0)) +
                ", " +
                DateFormat.jm()
                    .format(date ?? DateTime.fromMillisecondsSinceEpoch(0))),
            Text(category ?? ""),
          ]),
          Container(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(user1 ?? ""),
                  CircleAvatar(
                    child: Icon(Icons.umbrella_outlined),
                  )
                ],
              ),
              /* Expanded(
                  child: Container(
                constraints: BoxConstraints(maxHeight: 100, maxWidth: 300),
                child: FittedBox(
                  child: Text(
                    (matches ?? 0).toString(),
                    /* style: Theme.of(context).textTheme.headline3 */
                  ),
                ),
              )), */
              Expanded(
                  child: Container(
                constraints: BoxConstraints(maxHeight: 80, maxWidth: 300),
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                        child: FittedBox(
                      child: Text(
                        (matches ?? 0).toString(),
                        /* style: Theme.of(context).textTheme.headline3 */
                      ),
                    )),
                    Text(Intl.plural(matches ?? 0,
                        zero: S.of(context).matches0,
                        one: S.of(context).matches1,
                        two: S.of(context).matches2,
                        few: S.of(context).matches3,
                        many: S.of(context).matches5,
                        other: S.of(context).matches5)),
                  ],
                ),
              )),
              Column(
                children: <Widget>[
                  Text(user2 ?? ""),
                  CircleAvatar(
                    child: Icon(Icons.pest_control_rodent),
                  )
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
