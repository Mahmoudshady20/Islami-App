import 'package:flutter/material.dart';
import 'package:islamirevision/ui/home/quran/suradetails.dart';
import 'package:islamirevision/ui/home/quran/verse_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quran/quran.dart'as quran;

class BookMarkWidget extends StatelessWidget {
  VerseModel versemodel;
  Function voidCallBack;
  List<String> names = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  int index;
  BookMarkWidget({required this.versemodel,required this.voidCallBack,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${quran.getSurahNameArabic(versemodel.suraNumber)}',
          style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 5,
          ),
          Text(versemodel.verse,
          style: Theme.of(context).textTheme.bodyText2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).dividerColor,
                ),
                onPressed: (){
                Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                    arguments: SuraDetailsScreenArgs(names[versemodel.suraNumber-1], versemodel.suraNumber-1)
                );
              }, child: Text(AppLocalizations.of(context)!.go),
              ),
              IconButton(
                  onPressed: (){
                    voidCallBack(index);
              }, icon: Icon(Icons.delete_forever,color: Theme.of(context).dividerColor,))
            ],
          )
        ],
      ),
    );
  }
}
