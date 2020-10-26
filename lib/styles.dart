import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class Styles {
  static Color backgroundColor = Colors.grey.shade300;
  static Color primaryColor = Colors.deepPurple;
  static Color actionColor = Colors.grey.shade900;
  static Color brightColor = Colors.white;

  static final ThemeData mainTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.deepPurple,
      scaffoldBackgroundColor: Colors.grey.shade300,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          color: backgroundColor,
          textTheme: TextTheme(
              headline6: TextStyle(
                  color: primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600))),
      textTheme: TextTheme(button: TextStyle(color: brightColor)),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.deepPurpleAccent.shade100,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(21))),
      ));
}
