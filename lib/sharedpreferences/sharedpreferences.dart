import 'package:shared_preferences/shared_preferences.dart';


 class  SharedPrefs {
  static late SharedPreferences prefs;

 static Future<void> setTheme(String theme) async{
    await prefs.setString("theme", theme);
  }

   static String getTheme(){
    return prefs.getString("theme") ?? "light";
  }
  static Future<void> setlanguage(String lan) async{
    await prefs.setString('lan', lan);
  }

  static String getlanguage(){
    return prefs.getString('lan') ?? 'ar';
  }

}