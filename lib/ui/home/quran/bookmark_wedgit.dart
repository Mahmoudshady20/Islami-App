import 'package:flutter/material.dart';
import 'package:islamirevision/ui/home/quran/quranscreen/suradetails.dart';
import 'package:islamirevision/ui/home/quran/quranscreen/verse_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quran/quran.dart'as quran;

class BookMarkWidget extends StatelessWidget {
  final VerseModel verseModel;
  final Function voidCallBack;
  final List<String> names = [
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

  final int index;
  BookMarkWidget({super.key, required this.verseModel,required this.voidCallBack,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(quran.getSurahNameArabic(verseModel.suraNumber),
          style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(verseModel.verse,
          style: Theme.of(context).textTheme.bodyMedium,
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
                    arguments: SuraDetailsScreenArgs(names[verseModel.suraNumber-1], verseModel.suraNumber-1)
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
