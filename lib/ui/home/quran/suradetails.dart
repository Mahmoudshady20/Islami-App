import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamirevision/ui/home/quran/versecontent.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'suradetails';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String chapterContent = '';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsScreenArgs;
    if(chapterContent.isEmpty){
      readFile(args.index);
    }
    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage( Theme.of(context).primaryColor == Color(0xFFB7935F) ?
            'assets/images/homebackground.png' : 'assets/images/darkbackground.png',),
          )
      ),
      child: Scaffold(
        appBar: AppBar(
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
                child: SingleChildScrollView(
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
    chapterContent = text;
    setState(() {

    });
  }
}


class SuraDetailsScreenArgs{
  String title;
  int index;
  SuraDetailsScreenArgs(this.title,this.index);
}