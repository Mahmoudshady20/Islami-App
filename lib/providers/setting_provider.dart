import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {

  ThemeMode themeMode = ThemeMode.system;
  Locale myLocal = Locale('ar');

  void enableLightMode(){
    themeMode = ThemeMode.light;
    notifyListeners();
  }
  void enableDarkMode(){
    themeMode = ThemeMode.dark;
    notifyListeners();
  }
  void enableArabic(){
    myLocal = Locale('ar');
    notifyListeners();
  }
  void enableEnglish(){
    myLocal = Locale('en');
    notifyListeners();
  }
}
