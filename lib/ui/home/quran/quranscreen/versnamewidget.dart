import 'package:flutter/material.dart';
import 'package:islamirevision/sharedpreferences/sharedpreferences.dart';
import 'package:islamirevision/ui/home/quran/quranscreen/suradetails.dart';
import 'package:quran/quran.dart'as quran;

class VerseNameWidget extends StatelessWidget {
  String titlearabic;
  String titleenglish;
  int index;
  VerseNameWidget({required this.titlearabic,required this.index,required this.titleenglish,});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        SharedPrefs.setLastNumberOfSurahRead(index+1);
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
        arguments: SuraDetailsScreenArgs(titlearabic, index)
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 3),
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
          children: [
            Text(quran.getVerseEndSymbol(index+1)),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(titleenglish,style: Theme.of(context).textTheme.headline4),
                Text('${quran.getVerseCount(index+1)} Verses', style: Theme.of(context).textTheme.headline2?.copyWith(
                  fontSize: 16
                ), ),
              ],
            ),
            Spacer(),
            Text(titlearabic,style: Theme.of(context).textTheme.headline6),
          ],
        ),
      ),
    );
  }
}
