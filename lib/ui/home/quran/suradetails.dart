import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamirevision/providers/setting_provider.dart';
import 'package:islamirevision/ui/home/quran/versecontent.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'suradetails';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> chapterContent = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsScreenArgs;
    var provider = Provider.of<SettingProvider>(context);
    if(chapterContent.isEmpty){
      readFile(args.index);
    }
    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(provider.themeMode==ThemeMode.light?
            'assets/images/homebackground.png' : 'assets/images/darkbackground.png',),
          )
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){

            }, icon: Icon(Icons.data_saver_on))
          ],
          title: Text(args.title),
        ),
        body: Card(
          elevation: 24,
            margin: EdgeInsets.symmetric(vertical: 48, horizontal: 12),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Expanded(
                  child: chapterContent.isEmpty ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
                    child: VerseContent(chapterContent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void readFile(int index) async{
    String text = await rootBundle.loadString('assets/files/${index+1}.txt');
    chapterContent = text.split(')');
    print(chapterContent);
    setState(() {

    });
  }
}


class SuraDetailsScreenArgs{
  String title;
  int index;
  SuraDetailsScreenArgs(this.title,this.index);
}