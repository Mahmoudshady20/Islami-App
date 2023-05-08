import 'package:flutter/material.dart';

class AzkarContent extends StatelessWidget {
  String content;

  AzkarContent(this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
