import 'package:flutter/material.dart';
import 'package:islamirevision/providers/setting_provider.dart';
import 'package:islamirevision/sharedpreferences/sharedpreferences.dart';
import 'package:islamirevision/ui/home/azkar/azkardetails.dart';
import 'package:islamirevision/ui/home/hadeth/hadethcontent.dart';
import 'package:islamirevision/ui/home/homescreen.dart';
import 'package:islamirevision/ui/home/quran/suradetails.dart';
import 'package:islamirevision/ui/mythemedata.dart';
import 'package:islamirevision/ui/splash/splashscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding();
  SharedPrefs.prefs = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context)=>SettingProvider()..init(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      title: 'Islami App',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethContnt.routeName: (context) => HadethContnt(),
        AzcarDetails.routeName: (context) => AzcarDetails(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.themeMode,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: provider.myLocal,
    );
  }
}
