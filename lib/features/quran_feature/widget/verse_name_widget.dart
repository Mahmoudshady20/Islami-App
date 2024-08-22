import 'package:flutter/material.dart';
import 'package:islamirevision/core/local_db/shared_preferences/shared_preferences.dart';
import 'package:islamirevision/features/quran_feature/widget/sura_details.dart';
import 'package:quran/quran.dart' as quran;

class VerseNameWidget extends StatelessWidget {
  final String titleArabic;
  final String titleEnglish;
  final int index;
  const VerseNameWidget({
    super.key,
    required this.titleArabic,
    required this.index,
    required this.titleEnglish,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        SharedPrefs.setLastNumberOfSurahRead(index + 1);
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: SuraDetailsScreenArgs(
              titleArabic,
              index,
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 3),
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
          children: [
            Text(
              quran.getVerseEndSymbol(index + 1),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(titleEnglish,
                    style: Theme.of(context).textTheme.headlineMedium),
                Text(
                  '${quran.getVerseCount(index + 1)} Verses',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 16,
                      ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              titleArabic,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
