import 'package:flutter/material.dart';

class VerseContent extends StatelessWidget {
  final List<String> content;

  const VerseContent(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    final formattedContent = content.map((s) => s == content.last ? s : '$s)').join(' ');
    return Container(
      padding: const EdgeInsets.only(
        top: 12,
      ),
      alignment: Alignment.center,
      child: Text(
        formattedContent,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
