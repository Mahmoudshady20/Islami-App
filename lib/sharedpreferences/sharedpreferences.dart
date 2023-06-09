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

  static Future<void> setCounter1(int counter) async {
   await prefs.setInt('counter1', counter);
  }

  static int getCounter1(){
   return prefs.getInt('counter1') ?? 0;
  }
  static Future<void> setCounter2(int counter) async {
   await prefs.setInt('counter2', counter);
  }

  static int getCounter2(){
   return prefs.getInt('counter2') ?? 0;
  }
  static Future<void> setCounter3(int counter) async {
   await prefs.setInt('counter3', counter);
  }

  static int getCounter3(){
   return prefs.getInt('counter3') ?? 0;
  }
  static Future<void> setCounter4(int counter) async {
   await prefs.setInt('counter4', counter);
  }

  static int getCounter4(){
   return prefs.getInt('counter4') ?? 0;
  }
  static Future<void> setCounter5(int counter) async {
   await prefs.setInt('counter5', counter);
  }

  static int getCounter5(){
   return prefs.getInt('counter5') ?? 0;
  }
  static Future<void> setCounter6(int counter) async {
   await prefs.setInt('counter6', counter);
  }

  static int getCounter6(){
   return prefs.getInt('counter6') ?? 0;
  }
}