import 'package:flutter/material.dart';
import 'package:calibration/generated/l10n.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Text(S.current.historyTitle),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
