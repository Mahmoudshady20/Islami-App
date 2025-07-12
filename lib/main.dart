import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:islamirevision/core/local_db/shared_preferences/shared_preferences.dart';
import 'package:islamirevision/core/local_db/verse_db/verse_db.dart';
import 'package:islamirevision/features/quran_feature/widget/sura_details.dart';
import 'package:islamirevision/features/settings_feature/data/setting_provider.dart';
import 'package:islamirevision/features/home/home_screen.dart';
import 'package:islamirevision/features/quran_feature/bookmarks_details.dart';
import 'package:islamirevision/shared/l10n/app_localizations.dart';
import 'package:islamirevision/shared/theme_data/my_theme_data.dart';
import 'package:islamirevision/features/splash_feature/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding();
  SharedPrefs.prefs = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  Hive.registerAdapter(VerseTypeAdaptor());
  await Hive.openBox('verseBox');
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => SettingProvider()..init(),
      child: const MyApp(),
    ),
  );
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
        BookMarksDetails.routeName: (context) => const BookMarksDetails()
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
