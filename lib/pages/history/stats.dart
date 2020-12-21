import 'dart:convert';
import 'dart:developer';

import 'package:calibration/data/loader.dart';
import 'package:calibration/data/models.dart';
import 'package:flutter/material.dart';
import 'package:calibration/generated/l10n.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart';

class SimpleLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _createSampleData(),
        builder: (context, snapshot) {
          if (snapshot?.data == null) {
            return Container();
          }
          return charts.LineChart(snapshot?.data,
              animate: true,
              defaultRenderer: charts.LineRendererConfig(includePoints: true));
        });
  }

  static Future<List<charts.Series<StatsPair, int>>> _createSampleData() async {
    List<StatsPair> data = List<StatsPair>();

    Response response = await Loader.instance.getCategoryStats();

    log(response.body.toString());

    var body;
    try {
      body = json.decode(response.body);

      for (int i = 0; i < body.length; i++) {
        data.add(StatsPair(i, body[i]));
      }
    } catch (e) {
      data = [StatsPair(0, 6), StatsPair(1, 8), StatsPair(2, 3)];
    }

    return [
      charts.Series<StatsPair, int>(
        id: S.current.catStats,
        domainFn: (StatsPair sales, _) => sales.catName,
        measureFn: (StatsPair sales, _) => sales.catTop,
        labelAccessorFn: (StatsPair row, _) =>
            catNames.values.toList()[row.catName],
        data: data,
      )
    ];
  }
}

class SimplePieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _createSampleData(),
        builder: (context, snapshot) {
          if (snapshot?.data == null) {
            return Container();
          }
          return charts.PieChart(snapshot?.data,
              animate: true,
              defaultRenderer: charts.ArcRendererConfig(
                  arcWidth: 60,
                  arcRendererDecorators: [charts.ArcLabelDecorator()]));
        });
  }

  static Future<List<charts.Series<StatsPair, int>>> _createSampleData() async {
    List<StatsPair> data = List<StatsPair>();

    Response response = await Loader.instance.getCategoryStats();

    log(response.body.toString());

    var body;
    try {
      body = json.decode(response.body);

      for (int i = 0; i < body.length; i++) {
        data.add(StatsPair(i, body[i]));
      }
    } catch (e) {
      data = [StatsPair(0, 4), StatsPair(1, 1)];
    }

    return [
      charts.Series<StatsPair, int>(
        id: S.current.catStats,
        domainFn: (StatsPair sales, _) => sales.catName,
        measureFn: (StatsPair sales, _) => sales.catTop,
        labelAccessorFn: (StatsPair row, _) =>
            catNames.values.toList()[row.catName],
        data: data,
      )
    ];
  }
}

class StatsPair {
  final int catName;
  final int catTop;

  StatsPair(this.catName, this.catTop);
}

class StatsView extends StatefulWidget {
  @override
  _StatsViewState createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(shrinkWrap: true, children: [
      Container(
        height: 10,
      ),
      Center(
          child: Text(
        S.current.catStats,
        style: Theme.of(context).textTheme.subtitle1,
      )),
      Container(
          width: MediaQuery.of(context).size.width * 0.5,
          constraints: BoxConstraints(
              maxHeight: 300, maxWidth: 400, minWidth: 100, minHeight: 100),
          child: SimplePieChart()),
      Container(
        height: 25,
      ),
      Center(
          child: Text(
        S.current.matchesStats,
        style: Theme.of(context).textTheme.subtitle1,
      )),
      Container(
          width: MediaQuery.of(context).size.width * 0.5,
          constraints: BoxConstraints(
              maxHeight: 300, maxWidth: 400, minWidth: 100, minHeight: 100),
          child: SimpleLineChart()),
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}
