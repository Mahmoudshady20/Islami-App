import 'package:flutter/material.dart';
import 'package:islamirevision/sharedpreferences/sharedpreferences.dart';

class SettingProvider extends ChangeNotifier {

  ThemeMode themeMode = ThemeMode.system;
  Locale myLocal = Locale('ar');


  void init(){
    if(SharedPrefs.getTheme()=='dark'){
      themeMode = ThemeMode.dark;
    }else {
      themeMode = ThemeMode.light;
    }
    if(SharedPrefs.getlanguage()=='ar'){
      myLocal = Locale('ar');
    }else {
      myLocal = Locale('en');
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
    myLocal = Locale('ar');
    SharedPrefs.setlanguage('ar');
    notifyListeners();
  }
  void enableEnglish(){
    myLocal = Locale('en');
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
    if(myLocal == Locale('en')){
      return true;
    }
    else {
      return false;
    }
  }
}
