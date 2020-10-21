import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class Styles {
  static final ThemeData mainTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.deepPurple,
      scaffoldBackgroundColor: Colors.grey.shade300,
      visualDensity: VisualDensity.adaptivePlatformDensity);
}
