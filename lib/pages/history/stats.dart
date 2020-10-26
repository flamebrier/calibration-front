import 'package:flutter/material.dart';
import 'package:calibration/generated/l10n.dart';

class StatsView extends StatefulWidget {
  @override
  _StatsViewState createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Text(S.current.statsTitle),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
