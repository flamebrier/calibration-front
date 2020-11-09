import 'package:calibration/pages/history/history_view.dart';
import 'package:calibration/pages/history/stats.dart';
import 'package:flutter/material.dart';
import 'package:calibration/generated/l10n.dart';

import '../../styles.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).historyTitle),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Text(
                    S.current.historyTitle,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Tab(
                  child: Text(
                    S.current.statsTitle,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [HistoryView(), StatsView()],
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
