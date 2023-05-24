import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamirevision/providers/setting_provider.dart';
import 'package:islamirevision/ui/home/azkar/azkarcontent.dart';
import 'package:provider/provider.dart';

class AzcarDetails extends StatefulWidget {
  static const String routeName = 'azkardetails';

  @override
  State<AzcarDetails> createState() => _AzcarDetailsState();
}

class _AzcarDetailsState extends State<AzcarDetails> {
  List<String> content =[];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as AzkarContentArgs;
    var provider = Provider.of<SettingProvider>(context);
    if(content.isEmpty){
      readFile(args.index);
    }
    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage( provider.themeMode==ThemeMode.light?
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
                child: ListView.separated(
                  itemBuilder: (buildcontext,index){
                    return AzkarContent(content[index]);
                  },
                  itemCount: content.length,
                  separatorBuilder: (buildcontext,index)=>Container(
                    width: double.infinity,
                    color: Theme.of(context).hintColor,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void readFile(int index) async{

    String text = await rootBundle.loadString('assets/files/azkar${index+1}.txt');
    content = text.split('#');
    setState(() {

    });
  }
}

class AzkarContentArgs{
  String title;
  int index;
  AzkarContentArgs(this.title,this.index);
}
