import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:calibration/pages/history/history_tile.dart';
import 'package:flutter/material.dart';
import 'package:calibration/generated/l10n.dart';

class HistoryView extends StatefulWidget {
  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: HistoryTile(
          date: DateTime(2020, 10, 12, 12, 55),
          category: S.of(context).catMemes,
          matches: 6,
          user1: "flamebrier",
          user2: "vvdimon",
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: HistoryTile(
          date: DateTime(2020, 10, 12, 12, 55),
          category: S.of(context).catMemes,
          matches: 8,
          user1: "flamebrier",
          user2: "vvdimon",
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: HistoryTile(
          date: DateTime(2020, 10, 12, 12, 55),
          category: S.of(context).catPics,
          matches: 3,
          user1: "vvdimon",
          user2: "flamebrier",
        ),
      )
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}
