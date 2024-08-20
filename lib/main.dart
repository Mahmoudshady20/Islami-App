import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:islamirevision/providers/setting_provider.dart';
import 'package:islamirevision/sharedpreferences/sharedpreferences.dart';
import 'package:islamirevision/ui/home/azkar/azkardetails.dart';
import 'package:islamirevision/ui/home/hadeth/hadethcontent.dart';
import 'package:islamirevision/ui/home/homescreen.dart';
import 'package:islamirevision/ui/home/quran/bookmarks_details.dart';
import 'package:islamirevision/ui/home/quran/quranscreen/suradetails.dart';
import 'package:islamirevision/ui/home/quran/quranscreen/verse_model.dart';
import 'package:islamirevision/ui/mythemedata.dart';
import 'package:islamirevision/ui/splash/splashscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding();
  SharedPrefs.prefs = await SharedPreferences.getInstance();
  final document = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(document.path);
  Hive.registerAdapter(VerseModelAdapter());
  await Hive.openBox('verseBox');
  runApp(ChangeNotifierProvider(
      create: (BuildContext context)=>SettingProvider()..init(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraDetailsScreen.routeName: (context) => const SuraDetailsScreen(),
        HadethContnt.routeName: (context) => const HadethContnt(),
        AzkarDetails.routeName: (context) => const AzkarDetails(),
        BookMarksDetails.routeName : (context) => const BookMarksDetails()
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.themeMode,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: provider.myLocal,
    );
  }
}