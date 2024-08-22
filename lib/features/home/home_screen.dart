import 'package:flutter/material.dart';
import 'package:islamirevision/features/azkar_feature/azkar_screen.dart';
import 'package:islamirevision/features/hadeth_feature/hadeth_screen.dart';
import 'package:islamirevision/features/quran_feature/bookmarks_details.dart';
import 'package:islamirevision/features/quran_feature/quran_screen.dart';
import 'package:islamirevision/features/sebha_feature/sebha_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamirevision/features/settings_feature/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;
  final List<Widget> tabs = [
    const QuranScreen(),
    const HadethScreen(),
    const SebhaScreen(),
    const AzkarScreen(),
    const BookMarksDetails(),
    const SettingScreen(),
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
