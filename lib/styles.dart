import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class Styles {
  static Color backgroundColor = Colors.grey.shade300;
  static Color primaryColor = Colors.deepPurple;
  static Color actionColor = Colors.grey.shade900;
  static final ThemeData mainTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.deepPurple,
      scaffoldBackgroundColor: Colors.grey.shade300,
      visualDensity: VisualDensity.adaptivePlatformDensity);
}
