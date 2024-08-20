import 'package:flutter/material.dart';

class VerseContent extends StatelessWidget {
  final List<String> content;

  const VerseContent(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    String test = '';
    for(var s in content) {
      test+=s+')';
    }
    return Container(
      padding: const EdgeInsets.only(
        top: 12,
      ),
      alignment: Alignment.center,
      child: Text(
        test,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
