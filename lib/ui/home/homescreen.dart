import 'package:flutter/material.dart';
import 'package:islamirevision/ui/home/azkar/azkarscreen.dart';
import 'package:islamirevision/ui/home/hadeth/hadethscreen.dart';
import 'package:islamirevision/ui/home/quran/bookmarks_details.dart';
import 'package:islamirevision/ui/home/quran/quranscreen/quranscreen.dart';
import 'package:islamirevision/ui/home/sebha/sebhascreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamirevision/ui/home/settings/settingscreen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;
  List<Widget> tabs = [
    QuranScreen(),
    HadethScreen(),
    SebhaScreen(),
    AzkarScreen(),
    BookMarksDetails(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.app_title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).cardColor,
        currentIndex: selectedTabIndex,
        onTap: (index){
          setState(() {
            selectedTabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).cardColor,
            icon: const ImageIcon(
              AssetImage('assets/images/quran.png'),
            ),
            label: AppLocalizations.of(context)!.quran,
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).cardColor,
            icon: const ImageIcon(
              AssetImage('assets/images/hadeth.png'),
            ),
            label: AppLocalizations.of(context)!.hadeth,
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).cardColor,
            icon: const ImageIcon(
              AssetImage('assets/images/sebha.png'),
            ),
            label: AppLocalizations.of(context)!.tasbeh,
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).cardColor,
            icon: const ImageIcon(
              AssetImage('assets/images/azkar.png'),
            ),
            label: AppLocalizations.of(context)!.azkar,
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).cardColor,
              icon: const Icon(Icons.bookmark),
              label: AppLocalizations.of(context)!.book),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).cardColor,
              icon: const Icon(Icons.settings),
              label: AppLocalizations.of(context)!.setting),
        ],
      ),
      body: tabs[selectedTabIndex],
    );
  }
}
