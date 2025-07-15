import 'package:flutter/material.dart';
import 'package:islamirevision/features/quran_feature/model/quran_page_constants.dart';
import 'package:islamirevision/features/quran_feature/widget/sura_details.dart';
import 'package:islamirevision/features/quran_feature/model/verse_model.dart';
import 'package:islamirevision/features/quran_feature/widget/verse_name_widget.dart';
import 'package:islamirevision/features/settings_feature/data/setting_provider.dart';
import 'package:islamirevision/core/local_db/shared_preferences/shared_preferences.dart';
import '../../shared/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  void initState() {
    super.initState();
    SharedPrefs.setLastNumberOfSurahReadListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    SharedPrefs.clearLastNumberOfSurahReadListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    VerseModel verseModel = VerseModel(
        suraNumber: SharedPrefs.getLastNumberOfSurahRead(), verse: 'verse');
    var provider = Provider.of<SettingProvider>(context);
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                        arguments: SuraDetailsScreenArgs(
                            QuranPageConstants.names[verseModel.suraNumber - 1],
                            verseModel.suraNumber - 1));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        end: Alignment.topRight,
                        begin: Alignment.bottomLeft,
                        colors: [
                          // B675FD
                          Color(0xFFDF98FA),
                          Color(0xFFB675FD),
                          Color(0xFF9055FF),
                        ],
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                const ImageIcon(
                                  AssetImage(
                                    'assets/images/quranicon.png',
                                  ),
                                  color: Colors.white,
                                  size: 25,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${AppLocalizations.of(context)?.lastread}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              provider.isEnglish()
                                  ? QuranPageConstants.namesEnglish[
                                      SharedPrefs.getLastNumberOfSurahRead() -
                                          1]
                                  : QuranPageConstants.names[
                                      SharedPrefs.getLastNumberOfSurahRead() -
                                          1],
                              key: ValueKey(SharedPrefs.getLastNumberOfSurahRead()),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        Image.asset(
                          'assets/images/quran2.png',
                          width: 150,
                          height: 90,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
        Container(
          width: double.infinity,
          color: Theme.of(context).hintColor,
          height: 2,
          margin: const EdgeInsets.only(bottom: 4),
        ),
        Text(
          AppLocalizations.of(context)!.quran_title,
          style: Theme.of(context).textTheme.displaySmall, //#BBC4CE59
        ),
        Container(
          width: double.infinity,
          color: Theme.of(context).hintColor,
          height: 2,
          margin: const EdgeInsets.only(top: 4),
        ),
        Expanded(
          flex: 3,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return VerseNameWidget(
                titleArabic: QuranPageConstants.names[index],
                index: index,
                titleEnglish: QuranPageConstants.namesEnglish[index],
              );
            },
            itemCount: QuranPageConstants.names.length,
            separatorBuilder: (buildcontext, index) => Divider(
              color: Theme.of(context).hintColor,
              thickness: 1,
            ),
          ),
        ),
      ],
    );
  }
}
