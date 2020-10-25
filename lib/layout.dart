import 'package:calibration/pages/history.dart';
import 'package:calibration/pages/profile.dart';
import 'package:calibration/pages/start.dart';
import 'package:calibration/styles.dart';
import 'package:flutter/material.dart';

class LayoutView extends StatefulWidget {
  @override
  _LayoutViewState createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;

  List<Tab> _tabs = List<Tab>();
  List<Widget> _pages = List<Widget>();

  @override
  void initState() {
    super.initState();
    _tabs.addAll([
      Tab(
        icon: Icon(Icons.show_chart_outlined),
        text: "История",
      ),
      Tab(
        icon: Icon(Icons.play_arrow_outlined),
        text: "Старт",
      ),
      Tab(icon: Icon(Icons.person_pin_circle_outlined), text: "Профиль")
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          bottomNavigationBar: TabBar(
            tabs: _tabs,
            unselectedLabelColor: Styles.actionColor,
            labelColor: Styles.primaryColor,
            indicator:
                CircleTabIndicator(color: Styles.primaryColor, radius: 3),
          ),
          body: TabBarView(
            children: [HistoryPage(), StartPage(), ProfilePage()],
          ),
        ));
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}