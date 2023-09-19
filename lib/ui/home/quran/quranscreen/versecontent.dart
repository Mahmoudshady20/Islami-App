import 'package:flutter/material.dart';

class VerseContent extends StatelessWidget {
  List<String> content;

  VerseContent(this.content);

  @override
  Widget build(BuildContext context) {
    String test = '';
    for(var s in content)test+=s+')';
    return Container(
      padding: EdgeInsets.only(
        top: 12,
      ),
      alignment: Alignment.center,
      child: Text(
        test,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
