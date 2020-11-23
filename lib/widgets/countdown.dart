import 'package:flutter/material.dart';

class DurationCountdown extends StatelessWidget {
  final AsyncWidgetBuilder<Duration> builder;
  final Duration from;

  const DurationCountdown({
    Key key,
    @required this.builder,
    this.from = const Duration(minutes: 10),
  })  : assert(builder != null),
        super(key: key);

  Stream<Duration> _countdown() async* {
    Duration c = from;
    while (c != Duration(seconds: 0)) {
      c = Duration(seconds: c.inSeconds - 1);
      yield c;
      await Future.delayed(Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(stream: _countdown(), builder: builder);
  }
}
