import 'package:flutter/material.dart';
import 'package:islamirevision/providers/setting_provider.dart';
import 'package:islamirevision/sharedpreferences/sharedpreferences.dart';
import 'package:islamirevision/ui/home/quran/quranscreen/suradetails.dart';
import 'package:islamirevision/ui/home/quran/quranscreen/verse_model.dart';
import 'package:islamirevision/ui/home/quran/quranscreen/versnamewidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class QuranScreen extends StatefulWidget {

  QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
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
  List<String> namesEnglish = [
    "Al-Fatiha",
    "Al-Baqarah",
    "Al-Imran",
    "An-Nisa",
    "Al-Ma'idah",
    "Al-An'am",
    "Al-A'raf",
    "Al-Anfal",
    "at-Taubah",
    "Yunus",
    "Hud",
    "Yusuf",
    "Ar-Ra'd",
    "Ibrahim",
    "Al-Hijr",
    "An-Nahl",
    "Al-Isra",
    "Al-Kahf",
    "Maryam",
    "Ta-Ha",
    "Al-Anbiya",
    "Al-Hajj",
    "Al-Mu'minun",
    "An-Nur",
    "Al-Furqan",
    "Ash-Shu'ara",
    "An-Naml",
    "Al-Qasas",
    "Al-Ankabut",
    "Ar-Rum",
    "Luqman",
    "As-Sajda",
    "Al-Ahzab",
    "Saba",
    "Fatir",
    "Ya-Sin",
    "As-Saffat",
    "Sad",
    "Az-Zumar",
    "Ghafir",
    "Fussilat",
    "Ash-Shura",
    "Az-Zukhruf",
    "Ad-Dukhan",
    "Al-Jathiya",
    "Al-Ahqaf",
    "Muhammad",
    "Al-Fath",
    "Al-Hujurat",
    "Qaf",
    "Ad-Dhariyat",
    "At-Tur",
    "An-Najm",
    "Al-Qamar",
    "Ar-Rahman",
    "Al-Waqi'ah",
    "Al-Hadid",
    "Al-Mujadilah",
    "Al-Hashr",
    "Al-Mumtahanah",
    "As-Saff",
    "Al-Jumu'ah",
    "Al-Munafiqun",
    "Al-Taghabun",
    "Al-Talaq",
    "Al-Tahrim",
    "Al-Mulk",
    "Al-Qalam",
    "Al-Haqqah",
    "Al-Ma'arij",
    "Nuh",
    "Al-Jinn",
    "Al-Muzzammil",
    "Al-Muddathir",
    "Al-Qiyamah",
    "Al-Insane",
    "Al-Mursalat",
    "An-Naba",
    "An-Nazi`at",
    "Abasa",
    "Al-Takwir",
    "Al-Infitar",
    "Al-Mutaffifeen",
    "Al-Inshiqaq",
    "Al-Buruj",
    "Al-Tariq",
    "Al-A'la",
    "Al-Ghashiya",
    "Al-Fajr",
    "Al-Balad",
    "Ash-Shams",
    "Al-Layl",
    "Ad-Duha",
    "Ash-Sharh",
    "At-Tin",
    "Al-Alaq",
    "Al-Qadr",
    "Al-Bayyinah",
    "Az-Zalzala",
    "Al-Adiyat",
    "Al-Qari`ah",
    "At-Takathur",
    "Al-Asr",
    "Al-Humazah",
    "Al-Fil",
    "Quraish",
    "Al-Ma'un",
    "Al-Kauthar",
    "Al-Kafirun",
    "An-Nasr",
    "Al-Masad",
    "Al-Ikhlas",
    "Al-Falaq",
    "An-Nas"
  ];
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    VerseModel versemodel = VerseModel(suraNumber: SharedPrefs.getLastNumberOfSurahRead(), verse: 'verse');
    var provider = Provider.of<SettingProvider>(context);
    Future.delayed(Duration(milliseconds: 500,), (){
      setState(() {
        counter = 0;
      });
    });
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: counter ==1 ? Center(child: CircularProgressIndicator(),) : InkWell(
            onTap: (){
              Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                  arguments: SuraDetailsScreenArgs(names[versemodel.suraNumber-1], versemodel.suraNumber-1)
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    end: Alignment.topRight,
                    begin: Alignment.bottomLeft,
                    colors: [ // B675FD
                      Color(0xFFDF98FA),
                      Color(0xFFB675FD),
                      Color(0xFF9055FF),
                    ],
                  ),
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 20
              ),
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          ImageIcon(
                            AssetImage(
                              'assets/images/quranicon.png',
                            ),
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${AppLocalizations.of(context)?.lastread}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('${provider.isEnglish() ? namesEnglish[SharedPrefs.getLastNumberOfSurahRead()-1] : names[SharedPrefs.getLastNumberOfSurahRead()-1]}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                  Image.asset('assets/images/quran2.png',
                  width: 150,
                    height: 90,
                  )
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
          style: Theme.of(context).textTheme.headline3, //#BBC4CE59
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
                   titlearabic:  names[index],index: index, titleenglish: namesEnglish[index],);
              },
              itemCount: names.length,
              separatorBuilder: (buildcontext, index) => Container(
                width: double.infinity,
                color: Theme.of(context).hintColor,
                height: 1,
              ),
            ))
      ],
    );
  }
}
