import 'package:flutter/material.dart';
import 'package:islamirevision/ui/home/azkar/azkardetails.dart';
import 'package:islamirevision/ui/home/hadeth/hadethcontent.dart';
import 'package:islamirevision/ui/home/homescreen.dart';
import 'package:islamirevision/ui/home/quran/suradetails.dart';
import 'package:islamirevision/ui/mythemedata.dart';
import 'package:islamirevision/ui/splash/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (context)=>SplashScreen(),
        HomeScreen.routeName : (context)=>HomeScreen(),
        SuraDetailsScreen.routeName : (context)=>SuraDetailsScreen(),
        HadethContnt.routeName : (context)=>HadethContnt(),
        AzcarDetails.routeName : (context)=>AzcarDetails(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}


