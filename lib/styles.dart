import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class Styles {
  static Color backgroundColor = Color(0xFFDAE0E6);
  static Color primaryColor = Color(0xFFFF4500);
  static Color borderColor = Colors.grey.shade400;
  static Color actionColor = Color(0xFF0079d3);
  static Color brightColor = Colors.white;
  static Color darkColor = Colors.grey.shade900;
  static Color semiDarkColor = Colors.grey.shade700;
  static double radius = 10;

  static final ThemeData mainTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.red,
      primaryColor: primaryColor,
      accentColor: actionColor,
      scaffoldBackgroundColor: backgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: "Exo",
      appBarTheme: AppBarTheme(
          color: Styles.brightColor,
          elevation: 1,
          centerTitle: true,
          textTheme: TextTheme(
              headline6: TextStyle(
                  fontFamily: "Ruda",
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  fontSize: 24))),
      textTheme: TextTheme(
        headline1: TextStyle(fontFamily: "Ruda"),
        headline2: TextStyle(fontFamily: "Ruda"),
        headline3: TextStyle(fontFamily: "Ruda", fontWeight: FontWeight.bold),
        headline4: TextStyle(
            fontFamily: "Ruda", fontWeight: FontWeight.bold, fontSize: 24),
        headline5: TextStyle(
            fontFamily: "Ruda", fontWeight: FontWeight.bold, fontSize: 20),
        headline6: TextStyle(fontFamily: "Exo", fontSize: 22),
        subtitle1: TextStyle(
            fontFamily: "Ruda", fontSize: 18, fontWeight: FontWeight.w900),
        subtitle2: TextStyle(fontFamily: "Exo", fontSize: 18),
        bodyText1: TextStyle(fontFamily: "Exo"),
        bodyText2: TextStyle(fontFamily: "Exo"),
        caption: TextStyle(fontFamily: "Exo"),
        overline: TextStyle(fontFamily: "Exo"),
        button: TextStyle(
            color: brightColor,
            fontFamily: "Ruda",
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(fontFamily: "Exo", fontWeight: FontWeight.normal),
        labelStyle: TextStyle(fontFamily: "Exo", fontWeight: FontWeight.normal),
      ),
      buttonTheme: ButtonThemeData(
        minWidth: 150,
        textTheme: ButtonTextTheme.primary,
        buttonColor: actionColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
        minimumSize:
            MaterialStateProperty.resolveWith((state) => Size(150, 36)),
        side: MaterialStateProperty.resolveWith(
            (state) => BorderSide(color: actionColor)),
        overlayColor: MaterialStateProperty.resolveWith(
            (state) => actionColor.withOpacity(0.2)),
        backgroundColor:
            MaterialStateProperty.resolveWith((state) => brightColor),
        foregroundColor:
            MaterialStateProperty.resolveWith((state) => actionColor),
        shape: MaterialStateProperty.resolveWith((state) =>
            RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)))),
      )));
}
