import 'package:flutter/material.dart';

class MyThemeData{
  static const Color lightPrimryColor = Color(0xFFB7935F);
  static const Color darkPrimryColor = Color(0xFF141A2E);
  static const Color lightMainTextColor = Color(0xFF242424);
  static const Color darkMainTextColor = Color(0xFFF8F8F8);
  static const Color lightAccetentColor = Color(0x59BBC4CE);
  static const Color darkAccentColor = Color(0x597B80AD);

  static var lightTheme = ThemeData(

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: lightPrimryColor
    ),
    primaryColor: lightPrimryColor,
    hintColor: lightAccetentColor,
    dividerColor: darkPrimryColor,
    cardColor: Colors.white,
    appBarTheme: const AppBarTheme(
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
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xFFDCDCDC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        )
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFF672CBC),
      unselectedItemColor: Color(0xFF8789A3),
      backgroundColor: Colors.white
    ),
    scaffoldBackgroundColor: Colors.white,//Color(0xFFFFFFFF),
    textTheme: const TextTheme(
      /// title of application in splash screen
      displayLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 28,
        color: Color(0xFF672CBC),
      ),
      /// text in splash screen
      displayMedium: TextStyle(
        color: Color(0xFF8789A3),
        fontSize: 18
      ),
      // ignore: deprecated_member_use
      displaySmall: TextStyle(
        // ex.Screen title
          color: lightMainTextColor,
          fontSize: 20,
      ),
      // ignore: deprecated_member_use
      headlineSmall: TextStyle(
        // sub headers
          fontSize: 24,
          color: lightMainTextColor),
      // ignore: deprecated_member_use
      bodyLarge: TextStyle(fontSize: 24, color: lightMainTextColor),
      // ignore: deprecated_member_use
      bodyMedium: TextStyle(fontSize: 20, color: lightMainTextColor),
      /// used in verse name widget to name of English
      headlineMedium: TextStyle(
        fontSize: 18,
        color: Color(0xFF240F4F),
      ),
      /// used in verse name widget to name of arabic
      titleLarge: TextStyle(
        fontSize: 20,
        color: Color(0xFF863ED5),
      ),
    ),
  );

  static var darkTheme = ThemeData(
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: darkAccentColor
    ),
    primaryColor: darkPrimryColor,
    hintColor: darkAccentColor,
    cardColor: darkPrimryColor,
    appBarTheme: const AppBarTheme(
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
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFFFACC1D),
      unselectedItemColor: Colors.white,
      backgroundColor: darkPrimryColor
    ),
    scaffoldBackgroundColor: const Color(0xFF040C23),
    textTheme: const TextTheme(
      // ignore: deprecated_member_use
      /// headline3
    displaySmall: TextStyle(
        // ex.Screen title
          color: darkMainTextColor,
          fontSize: 20),
      // ignore: deprecated_member_use
      /// headline5
      headlineSmall: TextStyle(
        // sub headers
          fontSize: 24,
          color: darkMainTextColor),
      // ignore: deprecated_member_use
      /// bodyText1
      bodyLarge: TextStyle(fontSize: 24, color: darkMainTextColor),
      // ignore: deprecated_member_use
      ///bodyText2
      bodyMedium: TextStyle(fontSize: 20, color: darkMainTextColor),
      /// title of application in splash screen
      ///headline1
      displayLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 28,
        color: Colors.white,
      ),
      /// used in verse name widget to name of English
      ///headline4
      headlineMedium: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      /// used in verse name widget to name of arabic
      ///headline6
      titleLarge: TextStyle(
        fontSize: 18,
        color: Color(0xFFA44AFF),
      ),
      /// text in splash screen & in verse name widget but the size is 16
      ///headline2
      displayMedium: TextStyle(
          color: Color(0xFF8789A3),
          fontSize: 18
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: darkPrimryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      )
    ),
    dividerColor: lightPrimryColor,
  );
}