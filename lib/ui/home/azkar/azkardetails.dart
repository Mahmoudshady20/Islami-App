import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamirevision/ui/home/azkar/azkarcontent.dart';

class AzkarDetails extends StatefulWidget {
  static const String routeName = 'azkardetails';

  const AzkarDetails({super.key});

  @override
  State<AzkarDetails> createState() => _AzkarDetailsState();
}

class _AzkarDetailsState extends State<AzkarDetails> {
  List<String> content =[];
  List<String> counters =[];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as AzkarContentArgs;
    if(content.isEmpty){
      readFile(args.index);
      readCounter(args.index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Card(
        elevation: 24,
        margin: const EdgeInsets.symmetric(vertical: 48, horizontal: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (buildcontext,index){
                  return AzkarContent(content[index],counters[index]);
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
    );
  }

  void readFile(int index) async{

    String text = await rootBundle.loadString('assets/files/azkar${index+1}.txt');
    content = text.split('#');
    setState(() {

    });
  }
  void readCounter(int index) async{

    String text = await rootBundle.loadString('assets/files/count${index+1}.txt');
    counters = text.split('#');
    setState(() {

    });
  }
}


class AzkarContentArgs{
  String title;
  int index;
  AzkarContentArgs(this.title,this.index);
}
