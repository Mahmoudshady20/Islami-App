import 'package:flutter/material.dart';
import 'package:islamirevision/core/local_db/shared_preferences/shared_preferences.dart';

class SettingProvider extends ChangeNotifier {

  ThemeMode themeMode = ThemeMode.system;
  Locale myLocal = const Locale('ar');


  void init(){
    if(SharedPrefs.getTheme()=='dark'){
      themeMode = ThemeMode.dark;
    }else {
      themeMode = ThemeMode.light;
    }
    if(SharedPrefs.getlanguage()=='ar'){
      myLocal = const Locale('ar');
    }else {
      myLocal = const Locale('en');
    }
  }

  void enableLightMode(){
    themeMode = ThemeMode.light;
    SharedPrefs.setTheme("light");
    notifyListeners();
  }
  void enableDarkMode(){
    themeMode = ThemeMode.dark;
    SharedPrefs.setTheme("dark");
    notifyListeners();
  }

  void enableArabic(){
    myLocal = const Locale('ar');
    SharedPrefs.setlanguage('ar');
    notifyListeners();
  }
  void enableEnglish(){
    myLocal = const Locale('en');
    SharedPrefs.setlanguage('en');
    notifyListeners();
  }
  bool isDark(){
    if(themeMode == ThemeMode.dark){
      return true;
    }
    else {
      return false;
    }
  }
  bool isEnglish(){
    if(myLocal == const Locale('en')){
      return true;
    }
    else {
      return false;
    }
  }
}
