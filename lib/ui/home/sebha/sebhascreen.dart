import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamirevision/providers/setting_provider.dart';
import 'package:islamirevision/sharedpreferences/sharedpreferences.dart';
import 'package:provider/provider.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
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
    counter.add(SharedPrefs.getCounter1());
    counter.add(SharedPrefs.getCounter2());
    counter.add(SharedPrefs.getCounter3());
    counter.add(SharedPrefs.getCounter4());
    counter.add(SharedPrefs.getCounter5());
    counter.add(SharedPrefs.getCounter6());
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(provider.themeMode == ThemeMode.light
                ? 'assets/images/sebhalogo.png'
                : 'assets/images/darksebhalogo.png'),
          ),
          Text(
            AppLocalizations.of(context)!.sebha_title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (buildcontext, index) => Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    //padding: const EdgeInsets.all(15),
                    width: 69,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                        child: Text(
                          '${counter[index]}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              counter[index]++;
                              if(index==0){
                                SharedPrefs.setCounter1(counter[index]);
                              } else if(index==1){
                                SharedPrefs.setCounter2(counter[index]);
                              }
                              else if(index==2){
                                SharedPrefs.setCounter3(counter[index]);
                              }else if(index==3){
                                SharedPrefs.setCounter4(counter[index]);
                              }
                              else if(index==4){
                                SharedPrefs.setCounter5(counter[index]);
                              }else if(index==5){
                                SharedPrefs.setCounter6(counter[index]);
                              }
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
                            child: Center(
                              child: Text(
                                tasbeh[index],
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              counter[index] = 0;
                              if(index==0){
                                SharedPrefs.setCounter1(counter[index]);
                              }else if(index==1){
                                SharedPrefs.setCounter2(counter[index]);
                              }
                              else if(index==2){
                                SharedPrefs.setCounter3(counter[index]);
                              }else if(index==3){
                                SharedPrefs.setCounter4(counter[index]);
                              }
                              else if(index==4){
                                SharedPrefs.setCounter5(counter[index]);
                              }else if(index==5){
                                SharedPrefs.setCounter6(counter[index]);
                              }
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
                            child: Center(
                              child: Icon(Icons.refresh,color: provider.isDark() ? Colors.white : Colors.black,),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              itemCount: tasbeh.length,
              padEnds: false,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
