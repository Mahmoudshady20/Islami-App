import 'package:flutter/material.dart';

class MyThemeData{
  static const Color lightPrimryColor = Color(0xFFB7935F);
  static const Color darkPrimryColor = Color(0xFF141A2E);
  static const Color lightMainTextColor = Color(0xFF242424);
  static const Color darkMainTextColor = Color(0xFFF8F8F8);
  static const Color lightAccetentColor = Color(0xFFB7935F);
  static const Color darkAccentColor = Color(0xFFFACC1D);

  static var lightTheme = ThemeData(
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: lightPrimryColor
    ),
    primaryColor: lightPrimryColor,
    accentColor: lightAccetentColor,
    cardColor: Colors.white,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 24,
        color: Color(0xFF242424),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      headline3: TextStyle(
        // ex.Screen title
          color: lightMainTextColor,
          fontSize: 32,
      ),
      headline5: TextStyle(
        // sub headers
          fontSize: 24,
          color: lightMainTextColor),
      bodyText1: TextStyle(fontSize: 24, color: lightMainTextColor),
      bodyText2: TextStyle(fontSize: 20, color: lightMainTextColor),
    ),
  );

  static var darkTheme = ThemeData(
    progressIndicatorTheme: ProgressIndicatorThemeData(
        color: darkAccentColor
    ),
    primaryColor: darkPrimryColor,
    accentColor: darkAccentColor,
    cardColor: darkPrimryColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 24,
        color: Color(0xFFF8F8F8),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFFFACC1D),
      unselectedItemColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      headline3: TextStyle(
        // ex.Screen title
          color: darkMainTextColor,
          fontSize: 32),
      headline5: TextStyle(
        // sub headers
          fontSize: 24,
          color: darkMainTextColor),
      bodyText1: TextStyle(fontSize: 24, color: darkMainTextColor),
      bodyText2: TextStyle(fontSize: 20, color: darkMainTextColor),
    ),
  );
}