import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamirevision/ui/home/hadeth/hadeth.dart';
import 'package:islamirevision/ui/home/hadeth/hadethnumber.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethScreen extends StatefulWidget {
  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<Hadeth> allHadethList = [];

  @override
  Widget build(BuildContext context) {
    if(allHadethList.isEmpty){
      readHadethFile();
    }
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset('assets/images/hadethlogo.png'),
        ),
        Container(
          width: double.infinity,
          color: Theme.of(context).dividerColor,
          height: 2,
          margin: const EdgeInsets.only(bottom: 4),
        ),
        Text(AppLocalizations.of(context)!.hadeth_title,
          style: Theme.of(context).textTheme.headline3,),
        Container(
          width: double.infinity,
          color: Theme.of(context).dividerColor,
          height: 2,
          margin: const EdgeInsets.only(top: 4),
        ),
        Expanded(
          flex: 3,
            child: ListView.separated(
              physics:  const BouncingScrollPhysics(),
                itemBuilder: (buildcontext,index){
                  return HadethNumber(allHadethList[index].title,allHadethList[index].content,index);
                },
              itemCount: allHadethList.length,
              separatorBuilder: (buildcontext,index)=>Container(
                width: double.infinity,
                color: Theme.of(context).dividerColor,
                height: 2,
              ),
            ),
        ),
      ],
    );
  }

  void readHadethFile() async{
    List<Hadeth> hadethList = [];
    String text = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allHadethContent = text.trim().split('#');
    for(int i=0;i<allHadethContent.length;i++){
      String singleHadethContent = allHadethContent[i];
      List<String> lines = singleHadethContent.trim().split('\n');
      String title = lines[0];
      lines.removeAt(0);
      String content = lines.join('\n');
      Hadeth hadeth = Hadeth(title: title,content:  content);
      hadethList.add(hadeth);
    }
    allHadethList = hadethList;
    setState(() {

    });
  }
}
