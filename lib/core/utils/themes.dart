import 'package:flutter/material.dart';
import 'constants.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: white,
    scaffoldBackgroundColor: white,
    iconTheme: const IconThemeData(color: white),
    appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        actionsIconTheme: IconThemeData(color: white),
        centerTitle: false,
        elevation: 1,
        titleTextStyle: TextStyle(color: white, fontSize: 20)),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: primary, fontSize: numberFontSize),
    ),
  );
}
