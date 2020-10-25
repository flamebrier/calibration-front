import 'package:calibration/layout.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'generated/l10n.dart';

import 'styles.dart';

void main() {
  runApp(Calibration());
  S.load(Locale(Intl.getCurrentLocale()));
}

class Calibration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: <LocalizationsDelegate>[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: S.current?.title ?? "",
      theme: Styles.mainTheme,
      home: LayoutView(),
    );
  }
}