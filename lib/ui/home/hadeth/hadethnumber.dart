import 'package:flutter/material.dart';
import 'package:islamirevision/ui/home/hadeth/hadeth.dart';
import 'package:islamirevision/ui/home/hadeth/hadethcontent.dart';

class HadethNumber extends StatelessWidget {
  String title;
  String content;
  HadethNumber(this.title,this.content);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadethContnt.routeName,
        arguments: Hadeth(title, content)
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
