import 'package:flutter/material.dart';
import 'package:calibration/generated/l10n.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Text(S.current.profileTitle),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
