import 'package:flutter/material.dart';
import 'package:islamirevision/ui/home/hadeth/hadeth.dart';
import 'package:islamirevision/ui/home/hadeth/hadethcontent.dart';

class HadethNumber extends StatelessWidget {
  final String title;
  final String content;
  final int index;
  const HadethNumber(this.title,this.content,this.index, {super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadethContnt.routeName,
        arguments: Hadeth(title:  title,content:  content,index:  index)
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
