import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamirevision/providers/setting_provider.dart';
import 'package:provider/provider.dart';

class SebhaScreen extends StatefulWidget {
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter1 = 0;
  int counter2 = 0;
  int counter3 = 0;
  int counter4 = 0;
  int counter5 = 0;
  int counter6 = 0;
  List<int> counter = [];
  List<String> tasbeh = [
    'سُبْحَانَ اللَّهِ',
    'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ ، سُبْحَانَ اللَّهِ الْعَظِيمِ',
    'لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ',
    'الْحَمْدُ للّهِ رَبِّ الْعَالَمِينَ',
    'الْلَّهُم صَلِّ وَسَلِم وَبَارِك عَلَى سَيِّدِنَا مُحَمَّد',
    'أستغفر الله'
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    counter.add(counter1);
    counter.add(counter2);
    counter.add(counter3);
    counter.add(counter4);
    counter.add(counter5);
    counter.add(counter6);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(provider.themeMode==ThemeMode.light
            ? 'assets/images/sebhalogo.png' : 'assets/images/darksebhalogo.png'),
          ),
           Text(
            AppLocalizations.of(context)!.sebha_title,
            style: Theme.of(context).textTheme.headline3,
          ),
          Expanded(
            child: PageView.builder(
              itemBuilder: (buildcontext,index)=>Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    //padding: const EdgeInsets.all(15),
                    width: 69,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                        child: Text(
                          '${counter[index]}',
                          style: Theme.of(context).textTheme.headline5,
                        )),
                  ),
                  InkWell(
                  onTap: () {
                    setState(() {
                      counter[index]++;
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      counter[index] = 0;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: double.infinity,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child:  Center(
                      child: Text(
                        tasbeh[index],
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
            ),
                ],
              ),
              itemCount: tasbeh.length,
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
